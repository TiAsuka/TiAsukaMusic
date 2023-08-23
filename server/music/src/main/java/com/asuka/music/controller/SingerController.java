package com.asuka.music.controller;
/*
* 歌手控制类
* */

import com.alibaba.fastjson2.JSONObject;
import com.asuka.music.domain.Singer;
import com.asuka.music.service.SingerService;
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
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
@RequestMapping("/singer")
public class SingerController {
    @Autowired
    private SingerService singerService;

    // 添加歌手
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object addSinger(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String name = request.getParameter("name").trim();
        String gender = request.getParameter("gender").trim();
        String pic = request.getParameter("pic").trim();
        String birth = request.getParameter("birth").trim();
        String location = request.getParameter("location").trim();
        String introduction = request.getParameter("introduction").trim();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birthDate = new Date();
        try {
            birthDate = dateFormat.parse(birth);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        // 保存到对象
        Singer singer = new Singer();
        singer.setName(name);
        singer.setGender(Byte.valueOf(gender));
        singer.setBirth(birthDate);
        singer.setPic(pic);
        singer.setLocation(location);
        singer.setIntroduction(introduction);
        boolean flag = singerService.insert(singer);
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
    public Object updateSinger(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String id =request.getParameter("id").trim();
        String name = request.getParameter("name").trim();
        String gender = request.getParameter("gender").trim();
        String birth = request.getParameter("birth").trim();
        String location = request.getParameter("location").trim();
        String introduction = request.getParameter("introduction").trim();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birthDate = new Date();
        try {
            birthDate = dateFormat.parse(birth);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        // 保存歌手到对象中
        Singer singer = new Singer();
        singer.setId(Integer.parseInt(id));
        singer.setName(name);
        singer.setGender(Byte.valueOf(gender));
        singer.setBirth(birthDate);
        singer.setLocation(location);
        singer.setIntroduction(introduction);
        boolean flag = singerService.update(singer);
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
    * 删除歌手
    * */
    @RequestMapping(value="/delete",method = RequestMethod.GET)
    public Object deleteSinger(HttpServletRequest request){
        String id =request.getParameter("id").trim();
        String url = singerService.selectByPrimaryKey(Integer.parseInt(id)).getPic();
        File file = new File(url);
        if(!url.equals("img/singerPic/default.jpg") &&file.exists()){
            file.delete();
        }
        boolean flag = singerService.delete(Integer.parseInt(id));
        return flag;
    }

    /*
    * 根据主键查询
    * */
    @RequestMapping(value="/selectByPrimaryKey",method = RequestMethod.GET)
    public Object selectByPrimaryKey(HttpServletRequest request){
        String id =request.getParameter("id").trim();
        return singerService.selectByPrimaryKey(Integer.parseInt(id));
    }

    /*
    * 查找所有
    * */
    @RequestMapping(value="/allSinger",method = RequestMethod.GET)
    public Object allSinger(HttpServletRequest request){
        return singerService.allSinger();
    }

    /*
    * 模糊查询
    * */
    @RequestMapping(value="/singerOfName",method = RequestMethod.GET)
    public Object singerOfName(HttpServletRequest request){
        String name = request.getParameter("name").trim();
        return singerService.singerOfName("%"+name+"%");
    }

    @RequestMapping(value="/singerOfGender",method = RequestMethod.GET)
    public Object singerOfGender(HttpServletRequest request){
        String gender = request.getParameter("gender").trim();
        return singerService.singerOfGender(Integer.parseInt(gender));
    }

    // 上传歌手图片
    @RequestMapping(value="/updateSingerPic",method = RequestMethod.POST)
    public Object updateSingerPic(@RequestParam("file") MultipartFile avatorFile,@RequestParam("id")int id){
        JSONObject jsonObject = new JSONObject();
        if(avatorFile.isEmpty()){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"头像上传失败");
            return jsonObject;
        }
        String fileName = System.currentTimeMillis()+ avatorFile.getOriginalFilename();
        String filePath = System.getProperty("user.dir")+System.getProperty("file.separator")+"img"+System.getProperty("file.separator")+"singerPic";
        File file1 = new File(filePath);
        if(!file1.exists()){
            file1.mkdir();
        }
        // 同时删除源头像文件
        String url = singerService.selectByPrimaryKey(id).getPic();
        File file2 = new File(url);
        if(!url.equals("img/singerPic/default.jpg") && file2.exists()){
            file2.delete();
        }
        // 实际文件地址
        File dest = new File(filePath+System.getProperty("file.separator")+fileName);
        // 存储到数据库的相对地址
        String storeAvatorPath = "img/singerPic/"+fileName;
        try {
            avatorFile.transferTo(dest);
            Singer singer = new Singer();
            singer.setId(id);
            singer.setPic(storeAvatorPath);
            boolean flag = singerService.update(singer);
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
}
