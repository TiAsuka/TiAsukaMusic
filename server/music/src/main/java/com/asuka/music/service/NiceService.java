package com.asuka.music.service;

import com.asuka.music.domain.Nice;

/*
* 评分service
* */
public interface NiceService {
    // 增加
    public boolean insert(Nice nice);
    // 取消点赞
    public boolean delete(Integer id);
    // 当前用户点赞
    public int SelectSelfNice(Integer commentId,Integer userId);
}
