package com.asuka.music.controller;

import com.alibaba.fastjson2.JSONObject;
import com.asuka.music.domain.SongList;
import com.asuka.music.service.SongListService;
import com.asuka.music.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

/*
* 歌单控制类
* */
@RestController
@RequestMapping("/songList")
public class SongListController {
    @Autowired
    private SongListService songListService;

    // 添加歌单
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object addSongList(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String title = request.getParameter("title").trim();
        String pic = request.getParameter("pic").trim();
        String introduction = request.getParameter("introduction").trim();
        String style = request.getParameter("style").trim();
        // 保存到对象
        SongList songList = new SongList();
        songList.setTitle(title);
        songList.setPic(pic);
        songList.setIntroduction(introduction);
        songList.setStyle(style);
        boolean flag = songListService.insert(songList);
        if(flag){
            jsonObject.put(Consts.CODE,1);
            jsonObject.put(Consts.MSG,"添加成功");
            return jsonObject;
        }
        jsonObject.put(Consts.CODE,0);
        jsonObject.put(Consts.MSG,"添加失败");
        return jsonObject;
    }
    /*
    *   修改
    * */
    @RequestMapping(value="/update",method = RequestMethod.POST)
    public Object updateSongList(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String id =request.getParameter("id").trim();
        String title = request.getParameter("title").trim();
        String introduction = request.getParameter("introduction").trim();
        String style = request.getParameter("style").trim();
        // 保存歌单到对象中
        SongList songList = new SongList();
        songList.setId(Integer.parseInt(id));
        songList.setTitle(title);
        songList.setIntroduction(introduction);
        songList.setStyle(style);
        boolean flag = songListService.update(songList);
        if(flag){
            jsonObject.put(Consts.CODE,1);
            jsonObject.put(Consts.MSG,"修改成功");
            return jsonObject;
        }
        jsonObject.put(Consts.CODE,0);
        jsonObject.put(Consts.MSG,"修改失败");
        return jsonObject;
    }

    /*
    * 删除歌单
    * */
    @RequestMapping(value="/delete",method = RequestMethod.GET)
    public Object deleteSongList(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String id =request.getParameter("id").trim();
        String url = songListService.selectByPrimaryKey(Integer.parseInt(id)).getPic();
        File file = new File(url);
        if(!url.equals("img/songListPic/default.jpg") && file.exists()){
            file.delete();
        }
        boolean flag = songListService.delete(Integer.parseInt(id));
        return flag;
    }

    /*
    * 根据主键查询
    * */
    @RequestMapping(value="/selectByPrimaryKey",method = RequestMethod.GET)
    public Object selectByPrimaryKey(HttpServletRequest request){
        String songListId =request.getParameter("songListId").trim();
        return songListService.selectByPrimaryKey(Integer.parseInt(songListId));
    }

    /*
    * 查找所有
    * */
    @RequestMapping(value="/allSongList",method = RequestMethod.GET)
    public Object allSongList(HttpServletRequest request){
        return songListService.allSongList();
    }

    /*
    * 根据标题精确查询
    * */
    @RequestMapping(value="/songListOfTitle",method = RequestMethod.GET)
    public Object songListOfTitle(HttpServletRequest request){
        String title = request.getParameter("title").trim();
        return songListService.songListOfTitle(title);
    }
    /*
     * 根据标题模糊查询
     * */
    @RequestMapping(value="/likeTitle",method = RequestMethod.GET)
    public Object likeTitle(HttpServletRequest request){
        String title = request.getParameter("title").trim();
        return songListService.likeTitle("%"+title+"%");
    }
    /*
     * 根据风格模糊查询
     * */
    @RequestMapping(value="/likeStyle",method = RequestMethod.GET)
    public Object likeStyle(HttpServletRequest request){
        String style = request.getParameter("style").trim();
        return songListService.likeStyle("%"+style+"%");
    }

    // 上传歌单封面
    @RequestMapping(value="/updateSongListPic",method = RequestMethod.POST)
    public Object updateSongListPic(@RequestParam("file") MultipartFile avatorFile,@RequestParam("id")int id){
        JSONObject jsonObject = new JSONObject();
        if(avatorFile.isEmpty()){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"封面上传失败");
            return jsonObject;
        }
        String fileName = System.currentTimeMillis()+ avatorFile.getOriginalFilename();
        String filePath = System.getProperty("user.dir")+System.getProperty("file.separator")+"img"+System.getProperty("file.separator")+"songListPic";
        File file1 = new File(filePath);
        if(!file1.exists()){
            file1.mkdir();
        }
        // 同时删除源头像文件
        String url = songListService.selectByPrimaryKey(id).getPic();
        File file2 = new File(url);
        if(!url.equals("img/songListPic/default.jpg") && file2.exists()){
            file2.delete();
        }
        // 实际文件地址
        File dest = new File(filePath+System.getProperty("file.separator")+fileName);
        // 存储到数据库的相对地址
        String storeAvatorPath = "img/songListPic/"+fileName;
        try {
            avatorFile.transferTo(dest);
            SongList songList = new SongList();
            songList.setId(id);
            songList.setPic(storeAvatorPath);
            boolean flag = songListService.update(songList);
            if(flag){
                jsonObject.put(Consts.CODE,1);
                jsonObject.put(Consts.MSG,"歌单封面上传成功");
                jsonObject.put("pic",storeAvatorPath);
                return jsonObject;
            }
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"歌单封面上传失败");
            return jsonObject;
        } catch (IOException e) {
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"歌单封面上传失败"+e.getMessage());
        }finally{
            return jsonObject;
        }
    }
}
