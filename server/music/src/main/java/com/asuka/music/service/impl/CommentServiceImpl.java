package com.asuka.music.service.impl;

import com.asuka.music.dao.CommentMapper;
import com.asuka.music.domain.Comment;
import com.asuka.music.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*
* 评论service实现类
* */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;
    /**
     * @param comment
     * @return
     */
    @Override
    public boolean insert(Comment comment) {
        return commentMapper.insert(comment)>0;
    }

    /**
     * @param comment
     * @return
     */
    @Override
    public boolean update(Comment comment) {
        return commentMapper.update(comment)>0;
    }

    /**
     * @param id
     * @return
     */
    @Override
    public boolean delete(Integer id) {
        return commentMapper.delete(id)>0;
    }

    /**
     * @param id
     * @return
     */
    @Override
    public Comment selectByPrimaryId(Integer id) {
        return commentMapper.selectByPrimaryId(id);
    }

    /**
     * @return
     */
    @Override
    public List<Comment> allComment() {
        return commentMapper.allComment();
    }

    /**
     * @param songId
     * @return
     */
    @Override
    public List<Comment> CommentOfSong(Integer songId) {
        return commentMapper.CommentOfSong(songId);
    }

    /**
     * @param songListId
     * @return
     */
    @Override
    public List<Comment> CommentOfAlbum(Integer songListId) {
        return commentMapper.CommentOfAlbum(songListId);
    }
}
