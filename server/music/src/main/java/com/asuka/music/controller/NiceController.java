package com.asuka.music.controller;


import com.alibaba.fastjson2.JSONObject;
import com.asuka.music.domain.Nice;
import com.asuka.music.service.NiceService;
import com.asuka.music.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/nice")
public class NiceController {
    @Autowired
    private NiceService niceService;

    /*
    * 点赞
    * */

    @RequestMapping(value="/add", method = RequestMethod.POST)
    public Object nice(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String commentId = request.getParameter("commentId");
        String userId = request.getParameter("userId");

        Nice nice = new Nice();
        nice.setCommentId(Integer.parseInt(commentId));
        nice.setUserId(Integer.parseInt(userId));

        boolean flag=niceService.insert(nice);
        if(flag){
            jsonObject.put(Consts.CODE,1);
            return jsonObject;
        }
        jsonObject.put(Consts.CODE,0);
        return jsonObject;
    }

    /*
    * 取消点赞
    * */
    @RequestMapping(value="/delete", method = RequestMethod.GET)
    public Object delete(HttpServletRequest request){
        String id =request.getParameter("id").trim();
        boolean flag = niceService.delete(Integer.parseInt(id));
        return flag;
    }
    /*
    * 当前用户点赞
    * */
    @RequestMapping(value="/self", method = RequestMethod.GET)
    public Object SelectSelfNice(HttpServletRequest request){
        String commentId = request.getParameter("commentId");
        String userId = request.getParameter("userId");
        return niceService.SelectSelfNice(Integer.parseInt(commentId),Integer.parseInt(userId));
    }
}
