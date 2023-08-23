package com.asuka.music.service.impl;

import com.asuka.music.dao.UserMapper;
import com.asuka.music.domain.User;
import com.asuka.music.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*
* 前端用户service实现类
* */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    /**
     * @param user
     * @return
     */
    @Override
    public boolean insert(User user) {
        return userMapper.insert(user)>0;
    }

    /**
     * @param user
     * @return
     */
    @Override
    public boolean update(User user) {
        return userMapper.update(user)>0;
    }

    /**
     * @param id
     * @return
     */
    @Override
    public boolean delete(Integer id) {
        return userMapper.delete(id)>0;
    }

    /**
     * @param id
     * @return
     */
    @Override
    public User selectByPrimaryKey(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    /**
     * @return
     */
    @Override
    public List<User> allUser() {
        return userMapper.allUser();
    }

    /**
     * @param phoneNumber
     * @param password
     * @return
     */
    @Override
    public boolean verifyPassword(String phoneNumber, String password) {
        return userMapper.verifyPassword(phoneNumber,password)>0;
    }

    /**
     * @param username
     * @return
     */
    @Override
    public User getByUsername(String username) {
        return userMapper.getByUsername(username);
    }

    @Override
    public User getByPhoneNumber(String phoneNumber) {
        return userMapper.getByPhoneNumber(phoneNumber);
    }
}
