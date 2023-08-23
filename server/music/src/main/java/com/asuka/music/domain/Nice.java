package com.asuka.music.domain;

import java.io.Serializable;

/*
* 点赞
* */
public class Nice implements Serializable {
    private Integer id;
    private Integer userId; // 用户id
    private Integer commentId;  // 评论id
//    private Byte one;   // 是否点赞/

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

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

//    public Byte getOne() {
//        return one;
//    }

//    public void setOne(Byte one) {
//        this.one = one;
//    }
}
