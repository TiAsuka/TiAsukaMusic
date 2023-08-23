package com.asuka.music.service.impl;

import com.asuka.music.dao.ListSongMapper;
import com.asuka.music.domain.ListSong;
import com.asuka.music.service.ListSongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*
* 歌单内容实现类
* */
@Service
public class ListSongServiceImpl implements ListSongService {

    @Autowired
    private ListSongMapper listSongMapper;
    /**
     * @param listSong
     * @return
     */
    @Override
    public boolean insert(ListSong listSong) {
        return listSongMapper.insert(listSong)>0;
    }

    /**
     * @param listSong
     * @return
     */
    @Override
    public boolean update(ListSong listSong) {
        return listSongMapper.update(listSong)>0;
    }

    /**
     * @param id
     * @return
     */
    @Override
    public boolean delete(Integer id) {
        return listSongMapper.delete(id)>0;
    }

    @Override
    public boolean deleteByTwo(Integer songId,Integer songListId){
        return listSongMapper.deleteByTwo(songId,songListId)>0;
    }
    /**
     * @param id
     * @return
     */
    @Override
    public ListSong selectByPrimaryKey(Integer id) {
        return listSongMapper.selectByPrimaryKey(id);
    }

    /**
     * @return
     */
    @Override
    public List<ListSong> allListSong() {
        return listSongMapper.allListSong();
    }

    /**
     * @param songListId
     * @return
     */
    @Override
    public List<ListSong> listSongOfAlbumId(Integer songListId) {
        return listSongMapper.listSongOfAlbumId(songListId);
    }
}
