package com.asuka.music.service;

import com.asuka.music.domain.Grade;

/*
* 评分service
* */
public interface GradeService {
    // 增加
    public boolean insert(Grade grade);
    // 总分儿
    public int selectScoreSum(Integer songListId);
    // 评分人数
    public int SelectUserSum(Integer songListId);
    // 均分儿
    public int aveScore(Integer songListId);
    // 当前用户评分
    public int SelectSelfScore(Integer songListId,Integer userId);
}
