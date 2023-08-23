package com.asuka.music.domain;

import java.io.Serializable;


// 歌单
public class SongList implements Serializable {
    // id
    private Integer id;
    // 歌单名字
    private String title;
    // 歌单封面
    private String pic;
    // 歌单简介
    private String introduction;
    // 歌单风格
    private String style;
    // 更新时间


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }
}
