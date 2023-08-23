package com.asuka.music.service;
import com.asuka.music.domain.Song;

import java.util.List;
/*
* 歌曲service
* */
public interface SongService {
    // 增加
    public boolean insert(Song song);
    // 修改
    public boolean update(Song song);
    // 删除
    public boolean delete(Integer id);
    // 根据主键查询
    public Song selectByPrimaryKey(Integer id);
    // 查询所有歌曲
    public List<Song> allSong();

    // 根据歌名查询
    public List<Song> songOfName(String name);
    public List<Song> likeSongOfName(String name);
    // 模糊查询根据歌曲id
    public List<Song> songOfSingerId(Integer singerId);

}
