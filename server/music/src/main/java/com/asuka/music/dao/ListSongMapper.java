package com.asuka.music.dao;


import com.asuka.music.domain.ListSong;
import org.springframework.stereotype.Repository;

import java.util.List;

/*
*歌单内容Dao
* */
@Repository
public interface ListSongMapper {
    // 增加
    public int insert(ListSong listSong);
    // 修改
    public int update(ListSong listSong);
    // 删除
    public int delete(Integer id);
    // 根据歌曲和歌单id删除
    public int deleteByTwo(Integer songId,Integer songListId);
    // 根据主键查询
    public ListSong selectByPrimaryKey(Integer id);
    // 查询所有歌曲
    public List<ListSong> allListSong();
    // 根据歌单id查询所有歌曲
    public List<ListSong> listSongOfAlbumId(Integer songListId);
}
