package com.asuka.music.service;


import com.asuka.music.domain.SongList;

import java.util.List;

/*
* 歌单接口
* */
public interface SongListService {
    // 增加
    public boolean insert(SongList songList);
    // 修改
    public boolean update(SongList songList);
    // 删除
    public boolean delete(Integer id);
    // 根据主键查询
    public SongList selectByPrimaryKey(Integer id);
    // 查询所有歌单
    public List<SongList> allSongList();
    // 精确查询根据歌单标题
    public List<SongList> songListOfTitle(String title);
    // 模糊查询根据歌单标题
    public List<SongList> likeTitle(String title);
    // 模糊查询根据风格
    public List<SongList> likeStyle(String style);
}
