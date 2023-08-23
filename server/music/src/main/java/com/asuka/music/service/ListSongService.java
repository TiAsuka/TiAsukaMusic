package com.asuka.music.service;

import com.asuka.music.domain.ListSong;

import java.util.List;

/*
* 歌单内容service接口
* */
public interface ListSongService {
    public boolean insert(ListSong listSong);
    // 修改
    public boolean update(ListSong listSong);
    // 删除
    public boolean delete(Integer id);


    public boolean deleteByTwo(Integer songId, Integer songListId);

    // 根据主键查询
    public ListSong selectByPrimaryKey(Integer id);
    // 查询所有歌曲
    public List<ListSong> allListSong();
    // 根据歌单id查询所有歌曲
    public List<ListSong> listSongOfAlbumId(Integer songListId);
}
