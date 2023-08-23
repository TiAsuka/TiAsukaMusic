package com.asuka.music.service;

import com.asuka.music.domain.Likes;

import java.util.List;

public interface LikesService {
    // 增
    public boolean insert(Likes like);
    // 删
    public boolean delete(Integer id);
    public boolean deleteSongLikes(Integer songId);
    // 查 - 所有
    public List<Likes> allLikes();
    // 查 - 某个用户收藏
    public List<Likes> LikesOfUserId(Integer userId);
    // 查 - 是否已收藏
    public int existLikes(Integer userId, Integer songId);
    public int existAlbums(Integer userId, Integer songListId);
}
