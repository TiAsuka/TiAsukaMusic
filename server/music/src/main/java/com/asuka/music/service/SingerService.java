package com.asuka.music.service;

import com.asuka.music.domain.Singer;

import java.util.List;

public interface SingerService {
    // 增加
    public Boolean insert(Singer singer);
    // 修改
    public Boolean update(Singer singer);
    // 删除
    public Boolean delete(Integer id);
    // 根据主键查询
    public Singer selectByPrimaryKey(Integer id);
    // 查询所有歌手
    public List<Singer> allSinger();
    // 模糊查询
    public List<Singer> singerOfName(String name);
    // 性别查询
    public List<Singer> singerOfGender(Integer gender);
}
