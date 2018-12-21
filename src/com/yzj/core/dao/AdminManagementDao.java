package com.yzj.core.dao;

import com.yzj.core.po.AdminManagement;
import com.yzj.core.po.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * AdminManagementDAO层接口
 */
public interface AdminManagementDao {
    // 通过学号查询用户信息
    List<User> selectAdminList(User user);

    // 查询范围内成绩列表总记录数
    Integer selectAdminListCount(User user);

    // 通过id查询用户
    User getAdminById(Integer id);

    // 修改用户表
    int updateAdmin(User user);

    // 修改寝室表
    int updateRoom(@Param("roomidlist") String roomidlist,
                   @Param("userid") Integer userid);

    // 作寝室表修改
    int deleteroom(@Param("del_roomlist") String del_roomlist);

    // 表单内查询寝室
    List<AdminManagement> getRoomList(@Param("keyLou") String key_roomLou,
                                      @Param("keyCeng") String key_roomCeng,
                                      @Param("keyId") String key_roomId);


}


