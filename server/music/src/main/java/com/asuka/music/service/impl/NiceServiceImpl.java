package com.asuka.music.service.impl;

import com.asuka.music.dao.NiceMapper;
import com.asuka.music.domain.Nice;
import com.asuka.music.service.NiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NiceServiceImpl implements NiceService {

    @Autowired
    private NiceMapper niceMapper;
    /**
     * @param nice
     * @return
     */
    @Override
    public boolean insert(Nice nice) {
        return niceMapper.insert(nice)>0;
    }

    /**
     * @param id
     * @return
     */
    @Override
    public boolean delete(Integer id) {
        return niceMapper.delete(id)>0;
    }

    /**
     * @param commentId
     * @param userId
     * @return
     */
    @Override
    public int SelectSelfNice(Integer commentId, Integer userId) {
        return niceMapper.SelectSelfNice(commentId,userId);
    }
}
