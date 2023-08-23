package com.asuka.music.controller;
/*
* 收藏控制类
* */

import com.alibaba.fastjson2.JSONObject;
import com.asuka.music.domain.Likes;
import com.asuka.music.service.LikesService;
import com.asuka.music.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/likes")
public class LikesController {
    @Autowired
    private LikesService likesService;

    // 添加收藏
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object addLikes(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String userId = request.getParameter("userId");
        String type = request.getParameter("type");
        String songId = request.getParameter("songId");
        String songListId = request.getParameter("songListId");
        // 保存到对象
        Likes likes = new Likes();
        likes.setUserId(Integer.parseInt(userId));
        likes.setType(Byte.valueOf(type));
        if(songId != null){
            likes.setSongId(Integer.parseInt(songId));
        }
        if(songListId != null){
            likes.setSongListId(Integer.parseInt(songListId));
        }
        boolean flag = likesService.insert(likes);
        if(flag){
            jsonObject.put(Consts.CODE,1);
            jsonObject.put(Consts.MSG,"收藏成功");
            return jsonObject;
        }
        jsonObject.put(Consts.CODE,0);
        jsonObject.put(Consts.MSG,"收藏失败");
        return jsonObject;
    }

    /*
    * 删除收藏歌曲
    * */
    @RequestMapping(value="/delete",method = RequestMethod.GET)
    public Object deleteLikes(HttpServletRequest request){
        String id =request.getParameter("id").trim();
        boolean flag = likesService.delete(Integer.parseInt(id));
        return flag;
    }


    /*
    * 查找所有
    * */
    @RequestMapping(value="/allLikes",method = RequestMethod.GET)
    public Object allLikes(HttpServletRequest request){
        return likesService.allLikes();
    }

    /*
     * 查找用户收藏
     * */
    @RequestMapping(value="/likesOfUserId",method = RequestMethod.GET)
    public Object LikesOfUserId(HttpServletRequest request){
        String userId = request.getParameter("userId");
        return likesService.LikesOfUserId(Integer.parseInt(userId));
    }

    /*
    * 是否已经收藏
    * */
    @RequestMapping(value="/existLikes",method = RequestMethod.GET)
    public Object existLikes(HttpServletRequest request){
        String userId = request.getParameter("userId");
        String songId = request.getParameter("songId");
        return likesService.existLikes(Integer.parseInt(userId),Integer.parseInt(songId));
    }
    // 歌单是否已收藏
    @RequestMapping(value="/existAlbums",method = RequestMethod.GET)
    public Object existAlbums(HttpServletRequest request){
        String userId = request.getParameter("userId");
        String songListId = request.getParameter("songListId");
        return likesService.existAlbums(Integer.parseInt(userId),Integer.parseInt(songListId));
    }
    /*
    * 删除歌曲后对应的收藏数据都删除
    * */
    @RequestMapping(value="/deleteSongLikes",method = RequestMethod.GET)
    public Object deleteSongLikes(HttpServletRequest request){
        String songId =request.getParameter("songId").trim();
        boolean flag = likesService.deleteSongLikes(Integer.parseInt(songId));
        return flag;
    }
}
