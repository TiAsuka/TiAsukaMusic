package com.asuka.music.service.impl;

import com.asuka.music.dao.GradeMapper;
import com.asuka.music.domain.Grade;
import com.asuka.music.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GradeServiceImpl implements GradeService {

    @Autowired
    GradeMapper gradeMapper;
    /**
     * @param grade
     * @return
     */
    @Override
    public boolean insert(Grade grade) {
        return gradeMapper.insert(grade)>0;
    }

    /**
     * @param songListId
     * @return
     */
    @Override
    public int selectScoreSum(Integer songListId) {
        return gradeMapper.selectScoreSum(songListId);
    }

    /**
     * @param songListId
     * @return
     */
    @Override
    public int SelectUserSum(Integer songListId) {
        return gradeMapper.SelectUserSum(songListId);
    }

    /**
     * @param songListId
     * @return
     */
    @Override
    public int aveScore(Integer songListId) {
        int num = gradeMapper.SelectUserSum(songListId);
        if(num==0){
            return 0;
        }
        return gradeMapper.selectScoreSum(songListId)/num;
    }

    /**
     * @param userId
     * @param songListId
     * @return
     */
    @Override
    public int SelectSelfScore(Integer songListId, Integer userId) {
        return gradeMapper.SelectSelfScore(songListId,userId);
    }
}
