package com.yzj.core.service.impl;

import com.yzj.core.dao.UserDao;
import com.yzj.core.po.User;
import com.yzj.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户Service接口实现类
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
    // 注入UserDao
    @Autowired
    private UserDao userDao;

    // 获取用户信息
    @Override
    public User getUserInfo(Integer user_id) {
        User user = userDao.getUserInfo(user_id);
        return user;
    }

    // 通过账号和密码查询用户
    @Override
    public User findUser(String usercode, String password) {
        User user = this.userDao.findUser(usercode, password);
        return user;
    }

    // 修改密码
    @Override
    public int updatePw(String user_id, String user_password) {
        return userDao.updatePw(user_id,user_password);
    }

}
