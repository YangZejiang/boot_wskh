package com.yzj.core.service.impl;

import com.yzj.common.utils.Page;
import com.yzj.core.dao.AdminManagementDao;
import com.yzj.core.po.AdminManagement;
import com.yzj.core.po.User;
import com.yzj.core.service.AdminManagementService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 人员管理
 */
@Service("adminmanagementService")
@Transactional
public class AdminManagementImpl implements AdminManagementService {
    @Autowired
    private AdminManagementDao adminManagementDao;

    //  查询成绩列表
    @Override
    public Page<User> findAdminList(Integer page, Integer rows, String key_usercode) {
        User user = new User();
        if (StringUtils.isNotBlank(key_usercode)) {
            user.setUser_code(key_usercode);
        }
        // 当前页
        user.setStart((page - 1) * rows);
        // 每页数
        user.setRows(rows);
        // 查询成绩列表
        List<User> users = adminManagementDao.selectAdminList(user);
        // 查询成绩列表总记录数
        Integer count = adminManagementDao.selectAdminListCount(user);
        // 创建Page返回对象
        Page<User> result = new Page<>();
        result.setPage(page);
        result.setRows(users);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    /**
     * 通过id查询用户信息
     */
    @Override
    public User getAdminById(Integer id) {
        User user = adminManagementDao.getAdminById(id);
        return user;
    }


    /**
     * 修改用户表
     */
    @Override
    public int updateAdmin(User user) {
        return adminManagementDao.updateAdmin(user);
    }

    /**
     * 修改寝室表
     */
    @Override
    public int updateRoom(String roomidlist, Integer userid) {
        return adminManagementDao.updateRoom(roomidlist, userid);

    }

    // 作寝室表删除修改
    @Override
    public int deleteRoom(String del_roomlist) {
        return adminManagementDao.deleteroom(del_roomlist);
    }

    /**
     * 表单内查询寝室
     *
     * @param key_roomLou
     * @param key_roomCeng
     * @param key_roomId
     * @return room
     */
    @Override
    public List<AdminManagement> getRoomList(String key_roomLou, String key_roomCeng, String key_roomId) {
        List<AdminManagement> room = adminManagementDao.getRoomList(key_roomLou, key_roomCeng, key_roomId);
        return room;
    }


}
