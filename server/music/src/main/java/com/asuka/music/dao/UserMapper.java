package com.asuka.music.dao;


import com.asuka.music.domain.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/*
*前端用户Dao
* */
@Repository
public interface UserMapper {
    // 增加
    public int insert(User user);
    // 修改
    public int update(User user);
    // 删除根据主键
    public int delete(Integer id);
    // 根据主键查询
    public User selectByPrimaryKey(Integer id);
    // 查询所有用户
    public List<User> allUser();
    // 验证密码
    public int verifyPassword(String phoneNumber,String password);
    // 根据账号查询
    public User getByUsername(String username);
    public User getByPhoneNumber(String phoneNumber);
}
