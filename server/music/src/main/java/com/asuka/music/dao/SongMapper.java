package com.asuka.music.dao;


import com.asuka.music.domain.Song;
import org.springframework.stereotype.Repository;

import java.util.List;

/*
*歌曲Dao
* */
@Repository
public interface SongMapper {
    // 增加
    public int insert(Song song);
    // 修改
    public int update(Song song);
    // 删除
    public int delete(Integer id);
    // 根据主键查询
    public Song selectByPrimaryKey(Integer id);
    // 查询所有歌曲
    public List<Song> allSong();
    // 模糊查询根据歌手id
    public List<Song> songOfSingerId(Integer singerId);
    // 根据歌名查询
    public List<Song> songOfName(String name);

    // 根据歌名查询
    public List<Song> likeSongOfName(String name);
}
