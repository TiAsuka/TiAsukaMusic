package com.asuka.music.service;

import com.asuka.music.domain.Comment;

import java.util.List;

public interface CommentService {
    // 增
    public boolean insert(Comment comment);
    // 改
    public boolean update(Comment comment);
    // 删
    public boolean delete(Integer id);
    // 查 - id
    public Comment selectByPrimaryId(Integer id);
    // 查 - 所有
    public List<Comment> allComment();
    // 查 - 某个歌曲
    public List<Comment> CommentOfSong(Integer songId);
    // 查 - 某个歌单
    public List<Comment> CommentOfAlbum(Integer songListId);
}
