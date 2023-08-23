package com.asuka.music.domain;

import java.io.Serializable;
import java.util.Date;

/*
收藏
* */
public class Likes implements Serializable {
    private Integer id;
    private Integer userId;
    private Byte type;
    private Integer songId;
    private Integer SongListId;
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public Integer getSongId() {
        return songId;
    }

    public void setSongId(Integer songId) {
        this.songId = songId;
    }

    public Integer getSongListId() {
        return SongListId;
    }

    public void setSongListId(Integer songListId) {
        SongListId = songListId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
