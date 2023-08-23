package com.asuka.music.service.impl;

import com.asuka.music.dao.SingerMapper;
import com.asuka.music.domain.Singer;
import com.asuka.music.service.SingerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/*
* 歌手service实现类
* */
@Service
public class SingerServiceImpl implements SingerService {

    @Autowired
    private SingerMapper singerMapper;
    /**
     * @param singer
     * @return
     */
    @Override
    public Boolean insert(Singer singer) {
        return singerMapper.insert(singer)>0;
    }

    /**
     * @param singer
     * @return
     */
    @Override
    public Boolean update(Singer singer) {
        return singerMapper.update(singer)>0;
    }

    /**
     * @param id
     * @return
     */
    @Override
    public Boolean delete(Integer id) {
        return singerMapper.delete(id)>0;
    }

    /**
     * @param id
     * @return
     */
    @Override
    public Singer selectByPrimaryKey(Integer id) {
        return singerMapper.selectByPrimaryKey(id);
    }

    /**
     * @return
     */
    @Override
    public List<Singer> allSinger() {
        return singerMapper.allSinger();
    }

    /**
     * @param name
     * @return
     */
    @Override
    public List<Singer> singerOfName(String name) {
        return singerMapper.singerOfName(name);
    }

    /**
     * @param gender
     * @return
     */
    @Override
    public List<Singer> singerOfGender(Integer gender) {
        return singerMapper.singerOfGender(gender);
    }
}
