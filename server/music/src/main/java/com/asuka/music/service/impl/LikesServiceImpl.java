package com.asuka.music.service.impl;

import com.asuka.music.dao.LikesMapper;
import com.asuka.music.domain.Likes;
import com.asuka.music.service.LikesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LikesServiceImpl implements LikesService {

    @Autowired
    private LikesMapper likesMapper;
    /**
     * @param like
     * @return
     */
    @Override
    public boolean insert(Likes like) {
        return likesMapper.insert(like)>0;
    }

    /**
     * @param id
     * @return
     */
    @Override
    public boolean delete(Integer id) {
        return likesMapper.delete(id)>0;
    }

    /**
     * @param songId
     * @return
     */
    @Override
    public boolean deleteSongLikes(Integer songId) {
        return likesMapper.deleteSongLikes(songId)>0;
    }

    /**
     * @return
     */
    @Override
    public List<Likes> allLikes() {
        return likesMapper.allLikes();
    }

    /**
     * @param userId
     * @return
     */
    @Override
    public List<Likes> LikesOfUserId(Integer userId) {
        return likesMapper.LikesOfUserId(userId);
    }

    /**
     * @param userId
     * @param songId
     * @return
     */
    @Override
    public int existLikes(Integer userId, Integer songId) {
        return likesMapper.existLikes(userId,songId);
    }

    @Override
    public int existAlbums(Integer userId, Integer songListId) {return likesMapper.existAlbums(userId,songListId);}
}
