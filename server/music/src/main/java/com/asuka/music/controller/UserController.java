package com.asuka.music.controller;
/*
* 前端用户控制类
* */

import com.alibaba.fastjson2.JSONObject;
import com.asuka.music.domain.User;
import com.asuka.music.service.UserService;
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
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    // 添加用户
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object addUser(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String gender = request.getParameter("gender").trim();
        String phoneNumber = request.getParameter("phoneNumber").trim();
        String email = request.getParameter("email").trim();
        String birth = request.getParameter("birth").trim();
        String introduction = request.getParameter("introduction").trim();
        String address = request.getParameter("address").trim();
        String avator = request.getParameter("avator").trim();
        if(username==null||username.equals("")){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"用户名不能为空");
            return jsonObject;
        }
        User userExist = userService.getByPhoneNumber(phoneNumber);
        if(userExist!=null){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"手机号已被注册");
            return jsonObject;
        }
        if(password==null||password.equals("")){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"密码不能为空");
            return jsonObject;
        }

            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date birthDate = new Date();
            try {
                birthDate = dateFormat.parse(birth);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }

        // 保存到对象
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setGender(Byte.valueOf(gender));
        user.setBirth(birthDate);
        user.setPhoneNumber(phoneNumber);
        user.setEmail(email);
        user.setIntroduction(introduction);
        user.setAddress(address);
        user.setAvator(avator);
        boolean flag = userService.insert(user);
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
    public Object updateUser(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String id = request.getParameter("id").trim();
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String gender = request.getParameter("gender").trim();
        String phoneNumber = request.getParameter("phoneNumber").trim();
        String email = request.getParameter("email").trim();
        String birth = request.getParameter("birth").trim();
        String introduction = request.getParameter("introduction").trim();
        String address = request.getParameter("address").trim();
        if(username==null||username.equals("")){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"用户名不能为空");
            return jsonObject;
        }
        if(password==null||password.equals("")){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"密码不能为空");
            return jsonObject;
        }
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birthDate = new Date();
        try {
            birthDate = dateFormat.parse(birth);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        // 保存歌手到对象中
        User user = new User();
        user.setId(Integer.parseInt(id));
        user.setUsername(username);
        user.setPassword(password);
        user.setGender(Byte.valueOf(gender));
        user.setBirth(birthDate);
        user.setPhoneNumber(phoneNumber);
        user.setEmail(email);
        user.setIntroduction(introduction);
        user.setAddress(address);
        boolean flag = userService.update(user);
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
    * 删除用户
    * */
    @RequestMapping(value="/delete",method = RequestMethod.GET)
    public Object deleteUser(HttpServletRequest request){
        String id =request.getParameter("id").trim();
        String url = userService.selectByPrimaryKey(Integer.parseInt(id)).getAvator();
        File file = new File(url);
        if(!url.equals("avatorImg/userPic/user.jpg") &&file.exists()){
            file.delete();
        }
        boolean flag = userService.delete(Integer.parseInt(id));
        return flag;
    }

    /*
    * 根据主键查询
    * */
    @RequestMapping(value="/selectByPrimaryKey",method = RequestMethod.GET)
    public Object selectByPrimaryKey(HttpServletRequest request){
        String id =request.getParameter("id").trim();
        return userService.selectByPrimaryKey(Integer.parseInt(id));
    }

    /*
    * 查找所有
    * */
    @RequestMapping(value="/allUser",method = RequestMethod.GET)
    public Object allUser(HttpServletRequest request){
        return userService.allUser();
    }


    // 更新用户图片
    @RequestMapping(value="/updateUserPic",method = RequestMethod.POST)
    public Object updateUserPic(@RequestParam("file") MultipartFile avatorFile,@RequestParam("id")int id){
        JSONObject jsonObject = new JSONObject();
        if(avatorFile.isEmpty()){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"头像上传失败");
            return jsonObject;
        }
        String fileName = System.currentTimeMillis()+ avatorFile.getOriginalFilename();
        String filePath =
                System.getProperty("user.dir")+System.getProperty("file.separator")+"avatorImg"+System.getProperty(
                        "file.separator")+"userPic";
        File file1 = new File(filePath);
        if(!file1.exists()){
            file1.mkdir();
        }
        System.out.println(file1);
        // 同时删除源头像文件
        String url = userService.selectByPrimaryKey(id).getAvator();
        File file2 = new File(url);
        if(!url.equals("avatorImg/userPic/user.jpg") && file2.exists()){
            file2.delete();
        }
        // 实际文件地址
        System.out.println(fileName);
        File dest = new File(filePath+System.getProperty("file.separator")+fileName);
        // 存储到数据库的相对地址
        String storeAvatorPath = "avatorImg/userPic/"+fileName;
        try {
            avatorFile.transferTo(dest);
            User user = new User();
            user.setId(id);
            user.setAvator(storeAvatorPath);
            boolean flag = userService.update(user);
            if(flag){
                jsonObject.put(Consts.CODE,1);
                jsonObject.put(Consts.MSG,"头像上传成功");
                jsonObject.put("avator",storeAvatorPath);
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

    // 前端用户登录
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public Object login(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String phoneNumber = request.getParameter("phoneNumber").trim();
        String password = request.getParameter("password").trim();
        if(phoneNumber==null||phoneNumber.equals("")){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"账号不能为空");
            return jsonObject;
        }
        if(password==null||password.equals("")){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"密码不能为空");
            return jsonObject;
        }

        // 保存到对象
        User user = new User();
        user.setPhoneNumber(phoneNumber);
        user.setPassword(password);
        boolean flag = userService.verifyPassword(phoneNumber,password);
        if(flag){
            jsonObject.put(Consts.CODE,1);
            jsonObject.put(Consts.MSG,"登录成功");
            jsonObject.put("userMsg",userService.getByPhoneNumber(phoneNumber));
            return jsonObject;
        }
        jsonObject.put(Consts.CODE,0);
        jsonObject.put(Consts.MSG,"用户名或密码不正确");
        return jsonObject;
    }
}
