package com.asuka.music.domain;

import java.io.Serializable;
import java.util.Date;

/*
* 评论
* */
public class Comment implements Serializable {
    private Integer id;
    private Integer userId;
    // 评论0歌曲||1歌单
    private Byte type;
    private Integer songId;
    private Integer songListId;
    private Date createTime;



    // 点赞数
    private Integer up;
    // 评论内容
    private String content;

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
        return songListId;
    }
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public void setSongListId(Integer songListId) {
        this.songListId = songListId;
    }

    public Integer getUp() {
        return up;
    }

    public void setUp(Integer up) {
        this.up = up;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
