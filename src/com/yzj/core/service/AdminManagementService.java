package com.yzj.core.service;

import com.yzj.common.utils.Page;
import com.yzj.core.po.AdminManagement;
import com.yzj.core.po.User;

import java.util.List;

/**
 * 用户管理Service层接口
 */
public interface AdminManagementService {
    // 查询范围内用户列表总记录数
    Page<User> findAdminList(Integer page, Integer rows, String key_usercode);

    // 通过id查询用户
    User getAdminById(Integer id);

    // 修改用户表
    int updateAdmin(User user);

    // 修改寝室表
    int updateRoom(String roomidlist, Integer userid);

    // 表单内查询寝室
    List<AdminManagement> getRoomList(String key_roomLou, String key_roomCeng, String key_roomId);

    // 作寝室表删除修改
    int deleteRoom(String del_roomlist);
}
