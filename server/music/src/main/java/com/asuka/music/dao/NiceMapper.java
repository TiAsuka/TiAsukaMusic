package com.asuka.music.dao;


import com.asuka.music.domain.Nice;
import org.springframework.stereotype.Repository;

/*
*评分儿Dao
* */
@Repository
public interface NiceMapper {
    // 初次点赞
    public int insert(Nice nice);
    // 取消点赞/点赞
    public int delete(Integer id);
    // 当前用户点赞
    public int SelectSelfNice(Integer commentId,Integer userId);
}
