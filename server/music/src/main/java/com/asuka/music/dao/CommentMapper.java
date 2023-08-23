package com.asuka.music.dao;

import com.asuka.music.domain.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentMapper {
    // 增
    public int insert(Comment comment);
    // 改
    public int update(Comment comment);
    // 删
    public int delete(Integer id);
    // 查 - id
    public Comment selectByPrimaryId(Integer id);
    // 查 - 所有
    public List<Comment> allComment();
    // 查 - 某个歌曲
    public List<Comment> CommentOfSong(Integer songId);
    // 查 - 某个歌单
    public List<Comment> CommentOfAlbum(Integer songListId);
}
