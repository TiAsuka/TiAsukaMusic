package com.asuka.music.controller;
/*
* 评论控制类
* */

import com.alibaba.fastjson2.JSONObject;
import com.asuka.music.domain.Comment;
import com.asuka.music.service.CommentService;
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
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    // 添加评论
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object addComment(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String userId = request.getParameter("userId");
        String type = request.getParameter("type");
        String songId = request.getParameter("songId");
        String songListId = request.getParameter("songListId");
        String content = request.getParameter("content").trim();
        // 保存到对象
        Comment comment = new Comment();
        comment.setUserId(Integer.parseInt(userId));
        comment.setType(Byte.valueOf(type));
        if(Byte.valueOf(type)==0){
            comment.setSongId(Integer.parseInt(songId));
        }else{
            comment.setSongListId(Integer.parseInt(songListId));
        }
        comment.setContent(content);
        boolean flag = commentService.insert(comment);
        if(flag){
            jsonObject.put(Consts.CODE,1);
            jsonObject.put(Consts.MSG,"评论成功");
            return jsonObject;
        }
        jsonObject.put(Consts.CODE,0);
        jsonObject.put(Consts.MSG,"评论失败");
        return jsonObject;
    }
    /*
    *   修改
    * */
    @RequestMapping(value="/update",method = RequestMethod.POST)
    public Object updateComment(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String id =request.getParameter("id").trim();
        String userId = request.getParameter("userId");
        String type = request.getParameter("type");
        String songId = request.getParameter("songId");
        String songListId = request.getParameter("songListId");
        String content = request.getParameter("content").trim();
        // 保存到对象
        Comment comment = new Comment();
        comment.setUserId(Integer.parseInt(userId));
        comment.setType(Byte.valueOf(type));
        if(songId!=null&&songId.equals("")){
            songId=null;
        }else{
            comment.setSongId(Integer.parseInt(songId));
        }
        if(songListId!=null&&songListId.equals("")){
            songListId=null;
        }else{
            comment.setSongListId(Integer.parseInt(songListId));
        }
        comment.setContent(content);
        boolean flag = commentService.update(comment);
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
    * 删除评论
    * */
    @RequestMapping(value="/delete",method = RequestMethod.GET)
    public Object deleteComment(HttpServletRequest request){
        String id =request.getParameter("id").trim();
        boolean flag = commentService.delete(Integer.parseInt(id));
        return flag;
    }

    /*
    * 根据主键查询
    * */
    @RequestMapping(value="/selectByPrimaryKey",method = RequestMethod.GET)
    public Object selectByPrimaryKey(HttpServletRequest request){
        String id =request.getParameter("id").trim();
        return commentService.selectByPrimaryId(Integer.parseInt(id));
    }

    /*
    * 查找所有
    * */
    @RequestMapping(value="/allComment",method = RequestMethod.GET)
    public Object allComment(HttpServletRequest request){
        return commentService.allComment();
    }

    /*
     * 查找歌曲评论
     * */
    @RequestMapping(value="/commentOfSong",method = RequestMethod.GET)
    public Object CommentOfSong(HttpServletRequest request){
        String songId = request.getParameter("songId");
        return commentService.CommentOfSong(Integer.parseInt(songId));
    }

    /*
     * 查找歌单评论
     * */
    @RequestMapping(value="/commentOfAlbum",method = RequestMethod.GET)
    public Object CommentOfAlbum(HttpServletRequest request){
        String songListId = request.getParameter("songListId");
        return commentService.CommentOfAlbum(Integer.parseInt(songListId));
    }

    /*
     * 点赞
     * */
    @RequestMapping(value="/like",method = RequestMethod.POST)
    public Object like(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String id = request.getParameter("id").trim();
        String up = request.getParameter("up").trim();
        // 保存到对象
        Comment comment = new Comment();
        comment.setId(Integer.parseInt(id));
        comment.setUp(Integer.parseInt(up));

        boolean flag = commentService.update(comment);
        if(flag){
            jsonObject.put(Consts.CODE,1);
            jsonObject.put(Consts.MSG,"点赞成功");
            return jsonObject;
        }
        jsonObject.put(Consts.CODE,0);
        jsonObject.put(Consts.MSG,"点赞失败");
        return jsonObject;
    }
}
