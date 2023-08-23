package com.asuka.music.controller;


import com.alibaba.fastjson2.JSONObject;
import com.asuka.music.domain.Grade;
import com.asuka.music.service.GradeService;
import com.asuka.music.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
public class GradeController {
    @Autowired
    private GradeService gradeService;

    /*
    * 评分儿
    * */

    @RequestMapping(value="/grade/add", method = RequestMethod.POST)
    public Object add(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String songListId = request.getParameter("songListId");
        String userId = request.getParameter("userId");
        String score = request.getParameter("score");

        Grade grade = new Grade();
        grade.setSongListId(Integer.parseInt(songListId));
        grade.setUserId(Integer.parseInt(userId));
        grade.setScore(Integer.parseInt(score));

        boolean flag=gradeService.insert(grade);
        if(flag){
            jsonObject.put(Consts.CODE,1);
            jsonObject.put(Consts.MSG,"评价成功");
            return jsonObject;
        }
        jsonObject.put(Consts.CODE,0);
        jsonObject.put(Consts.MSG,"评价失败");
        return jsonObject;
    }

    /*
    * 均分儿
    * */
    @RequestMapping(value="/grade", method = RequestMethod.GET)
    public Object aveScore(HttpServletRequest request){
        String songListId = request.getParameter("songListId");
        return gradeService.aveScore(Integer.parseInt(songListId));
    }
    /*
    * 当前用户评分
    * */
    @RequestMapping(value="/self", method = RequestMethod.GET)
    public Object SelectSelfScore(HttpServletRequest request){
        String songListId = request.getParameter("songListId");
        String userId = request.getParameter("userId");
        return gradeService.SelectSelfScore(Integer.parseInt(songListId),Integer.parseInt(userId));
    }
}
