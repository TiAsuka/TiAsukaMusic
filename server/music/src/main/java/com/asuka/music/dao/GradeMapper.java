package com.asuka.music.dao;


import com.asuka.music.domain.Grade;
import org.springframework.stereotype.Repository;

/*
*评分儿Dao
* */
@Repository
public interface GradeMapper {
    // 增加
    public int insert(Grade grade);
    // 总分儿
    public int selectScoreSum(Integer songListId);
    // 评分人数
    public int SelectUserSum(Integer songListId);
    //当前用户评分
    public int SelectSelfScore(Integer songListId,Integer userId);
}
