package com.yzj.core.service;

import com.yzj.core.po.User;

import java.util.List;

/**
 * 用户Service层接口
 */
public interface UserService {
    // 获取个人信息
    User getUserInfo(Integer user_id);

    // 通过账号和密码查询用户
    User findUser(String usercode, String password);

    // 修改密码
    int updatePw(String user_id, String user_password);
}
