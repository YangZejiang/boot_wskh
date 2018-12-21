package com.yzj.core.dao;

import org.apache.ibatis.annotations.Param;
import com.yzj.core.po.User;

import java.util.List;

/**
 * 用户DAO层接口
 */
public interface UserDao {

    // 通过账号和密码查询用户

    User findUser(@Param("usercode") String usercode,
                  @Param("password") String password);

    // 获取用户信息
    User getUserInfo(Integer user_id);

    // 修改密码
    int updatePw(@Param("user_id") String user_id,
                 @Param("user_password") String user_password);
}
