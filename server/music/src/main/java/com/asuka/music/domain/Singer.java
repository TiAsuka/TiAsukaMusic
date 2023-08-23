package com.asuka.music.domain;

import com.alibaba.druid.sql.visitor.functions.Char;

import java.io.Serializable;
import java.util.Date;

public class Singer implements Serializable {
    // id
    private Integer id;
    // 歌手姓名
    private String name;
    // 歌手性别
    private Byte gender;
    // 头像
    private String pic;
    // 歌手生日
    private Date birth;
    // 所在地区
    private String location;
    // 简介
    private String introduction;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Byte getGender() {
        return gender;
    }

    public void setGender(Byte gender) {
        this.gender = gender;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }
}
