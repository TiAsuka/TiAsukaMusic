package com.asuka.music.dao;

import com.asuka.music.domain.Likes;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LikesMapper {
    // 增
    public int insert(Likes like);
    // 删-根据主键删除
    public int delete(Integer id);
    // 删-根据歌曲被删除后将附带的收藏数据删除
    public int deleteSongLikes(Integer songId);
    // 查 - 所有
    public List<Likes> allLikes();
    // 查 - 某个用户收藏
    public List<Likes> LikesOfUserId(Integer userId);
    // 查 - 是否已收藏
    public int existLikes(Integer userId, Integer songId);
    public int existAlbums(Integer userId, Integer songListId);
}
