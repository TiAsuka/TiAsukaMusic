package com.asuka.music.service;

import com.asuka.music.domain.User;

import java.util.List;

/*
* 前端用户service接口
* */
public interface UserService {
    // 增加
    public boolean insert(User user);
    // 修改
    public boolean update(User user);
    // 删除
    public boolean delete(Integer id);
    // 根据主键查询
    public User selectByPrimaryKey(Integer id);
    // 查询所有用户
    public List<User> allUser();
    // 验证密码
    public boolean verifyPassword(String phoneNumber,String password);
    // 根据账号查询
    public User getByUsername(String username);
    // 根据手机号查询
    public User getByPhoneNumber(String phoneNumber);
}
