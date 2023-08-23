package com.asuka.music.controller;


import com.alibaba.fastjson2.JSONObject;
import com.asuka.music.domain.Song;
import com.asuka.music.service.SongService;
import com.asuka.music.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
@RequestMapping("/song")
public class SongController {

    @Autowired
    private SongService songService;

    /*
    * 添加歌曲
    * */
    @RequestMapping(value="/add",method= RequestMethod.POST)
    public Object addSong(HttpServletRequest request, @RequestParam("file") MultipartFile mpFile){
        JSONObject jsonObject = new JSONObject();
        // 获取前端传来的参数
        String singerId = request.getParameter("singerId").trim();
        String name = request.getParameter("name").trim();
        String introduction = request.getParameter("introduction").trim();
        String pic = "img/songPic/default.jpg";
        String lyric = request.getParameter("lyric").trim();
        // 上传歌曲文件
        if(mpFile.isEmpty()){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"歌曲上传失败");
            return jsonObject;
        }
        String fileName = System.currentTimeMillis()+ mpFile.getOriginalFilename();
        // 文件路径
        String filePath = System.getProperty("user.dir")+System.getProperty("file.separator")+"song";
        // 如果文件路径不存在，则新增
        File file1 = new File(filePath);
        if(!file1.exists()){
            file1.mkdir();
        }

        // 实际文件地址
        File dest = new File(filePath+System.getProperty("file.separator")+fileName);
        // 存储到数据库的相对地址
        String storeUrlPath = "song/"+fileName;
        try {
            mpFile.transferTo(dest);
            Song song = new Song();
            song.setSingerId(Integer.parseInt(singerId));
            song.setName(name);
            song.setIntroduction(introduction);
            song.setPic(pic);
            song.setLyric(lyric);
            song.setUrl(storeUrlPath);
            boolean flag = songService.insert(song);
            if(flag){
                jsonObject.put(Consts.CODE,1);
                jsonObject.put(Consts.MSG,"保存成功");
                jsonObject.put("avator",storeUrlPath);
                return jsonObject;
            }
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"保存失败");
            return jsonObject;
        } catch (IOException e) {
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"保存失败"+e.getMessage());
        }finally{
            return jsonObject;
        }
    }

    /*
    * 根据歌手id查询歌曲
    * */
    @RequestMapping(value="/singer/detail",method = RequestMethod.GET)
    public Object songOfSingerId(HttpServletRequest request){
        String singerId = request.getParameter("singerId");
        return songService.songOfSingerId(Integer.parseInt(singerId));
    }
    /*
    *   修改歌曲
    * */
    @RequestMapping(value="/update",method = RequestMethod.POST)
    public Object updateSong(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String id =request.getParameter("id").trim();
        String name = request.getParameter("name").trim();
        String introduction = request.getParameter("introduction").trim();
        String lyric = request.getParameter("lyric").trim();
        // 保存歌曲到对象中
        Song song = new Song();
        song.setId(Integer.parseInt(id));
        song.setName(name);
        song.setIntroduction(introduction);
        song.setLyric(lyric);
        boolean flag = songService.update(song);
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
    * 删除歌曲
    * */
    @RequestMapping(value="/delete",method = RequestMethod.GET)
    public Object deleteSong(HttpServletRequest request){
        String id =request.getParameter("id").trim();
        String songUrl = songService.selectByPrimaryKey(Integer.parseInt(id)).getUrl();
        String picUrl = songService.selectByPrimaryKey(Integer.parseInt(id)).getPic();
        File mp3File = new File(songUrl);
        File picFile = new File(picUrl);
        if(mp3File.exists()){
            mp3File.delete();
        }
        if(!picUrl.equals("img/songPic/default.jpg") &&picFile.exists()){
            picFile.delete();
        }
        boolean flag = songService.delete(Integer.parseInt(id));
        return flag;
    }
    /*
    * 更新歌曲图片
    * */
    @RequestMapping(value="/updateSongPic",method = RequestMethod.POST)
    public Object updateSongPic(@RequestParam("file") MultipartFile avatorFile,@RequestParam("id")int id){
        JSONObject jsonObject = new JSONObject();
        if(avatorFile.isEmpty()){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"头像上传失败");
            return jsonObject;
        }
        String fileName = System.currentTimeMillis()+ avatorFile.getOriginalFilename();
        String filePath =
                System.getProperty("user.dir")+System.getProperty("file.separator")+"img"+System.getProperty("file" +
                        ".separator")+"songPic";
        File file1 = new File(filePath);
        if(!file1.exists()){
            file1.mkdir();
        }
        String url = songService.selectByPrimaryKey(id).getPic();
        File file2 = new File(url);
        if(!url.equals("img/songPic/default.jpg") && file2.exists()){
            file2.delete();
        }
        // 实际文件地址
        File dest = new File(filePath+System.getProperty("file.separator")+fileName);
        // 存储到数据库的相对地址
        String storeAvatorPath = "img/songPic/"+fileName;
        try {
            avatorFile.transferTo(dest);
            Song song = new Song();
            song.setId(id);
            song.setPic(storeAvatorPath);
            boolean flag = songService.update(song);
            if(flag){
                jsonObject.put(Consts.CODE,1);
                jsonObject.put(Consts.MSG,"头像上传成功");
                jsonObject.put("pic",storeAvatorPath);
                return jsonObject;
            }
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"头像上传失败");
            return jsonObject;
        } catch (IOException e) {
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"头像上传失败"+e.getMessage());
        }finally{
            return jsonObject;
        }
    }

    /*
    *  更新歌曲
    * */
    @RequestMapping(value="/updateSongUrl",method = RequestMethod.POST)
    public Object updateSongUrl(@RequestParam("file") MultipartFile avatorFile,@RequestParam("id")int id){
        JSONObject jsonObject = new JSONObject();
        if(avatorFile.isEmpty()){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"歌曲上传失败");
            return jsonObject;
        }
        String fileName = System.currentTimeMillis()+ avatorFile.getOriginalFilename();
        String filePath = System.getProperty("user.dir")+System.getProperty("file.separator")+"song";
        File file1 = new File(filePath);
        if(!file1.exists()){
            file1.mkdir();
        }
        String url = songService.selectByPrimaryKey(id).getUrl();
        File file2 = new File(url);
        if(file2.exists()){
            file2.delete();
        }
        // 实际文件地址
        File dest = new File(filePath+System.getProperty("file.separator")+fileName);
        // 存储到数据库的相对地址
        String storeAvatorPath = "song/"+fileName;
        try {
            avatorFile.transferTo(dest);
            Song song = new Song();
            song.setId(id);
            song.setUrl(storeAvatorPath);
            boolean flag = songService.update(song);
            if(flag){
                jsonObject.put(Consts.CODE,1);
                jsonObject.put(Consts.MSG,"歌曲修改成功");
                jsonObject.put("avator",storeAvatorPath);
                return jsonObject;
            }
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"歌曲修改失败");
            return jsonObject;
        } catch (IOException e) {
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"头像上传失败"+e.getMessage());
        }finally{
            return jsonObject;
        }
    }
    /*
     * 根据歌曲id查询歌曲
     * */
    @RequestMapping(value="/detail",method = RequestMethod.GET)
    public Object detail(HttpServletRequest request){
        String songId = request.getParameter("songId");
        return songService.selectByPrimaryKey(Integer.parseInt(songId));
    }

    /*
     * 根据歌曲歌名查询歌曲
     * */
    @RequestMapping(value="/songOfSongName",method = RequestMethod.GET)
    public Object songOfSongName(HttpServletRequest request){
        String songName = request.getParameter("songName");
        return songService.songOfName(songName);
    }
    /*
     * 根据歌曲歌名模糊歌曲
     * */
    @RequestMapping(value="/likeSongOfName",method = RequestMethod.GET)
    public Object likeSongOfName(HttpServletRequest request){
        String songName = request.getParameter("songName");
        return songService.likeSongOfName(songName);
    }


    /*
     * 根据歌曲id查询歌曲
     * */
    @RequestMapping(value="/allSong",method = RequestMethod.GET)
    public Object allSong(HttpServletRequest request){
        return songService.allSong();
    }
}
