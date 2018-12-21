package com.yzj.core.controller;


import com.yzj.common.utils.Page;
import com.yzj.core.po.AdminManagement;
import com.yzj.core.po.User;
import com.yzj.core.service.AdminManagementService;
import com.yzj.core.service.MarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 人员管理
 */
@Controller
public class AdminManagementController {
    // 依赖注入
    @Autowired
    private AdminManagementService adminmanagementService;
    @Autowired
    private MarkService markService;


    /**
     * 人员信息列表
     */
    @RequestMapping(value = "/mark/adminlist.action")
    public String adminlist(@RequestParam(defaultValue = "1") Integer page,
                            @RequestParam(defaultValue = "5") Integer rows, String key_usercode,
                            Model model) {
        // 条件查询所有成绩
        Page<User> Users = adminmanagementService.findAdminList(page, rows, key_usercode);
        model.addAttribute("page", Users);

        // 所有周（期）
        List<String> allper = markService.findBaseDict("mk_per", "mark");
        // 所有楼
        List<String> alllou = markService.findBaseDict("room_lou", "room");
        // 所有层
        List<String> allceng = markService.findBaseDict("room_ceng", "room");

        // 添加参数
        model.addAttribute("allPer", allper);
        model.addAttribute("allLou", alllou);
        model.addAttribute("allCeng", allceng);

        return "adminmanagement";
    }

    /**
     * 通过id获取用户信息
     */
    @RequestMapping("/mark/getAdminByUserid.action")
    @ResponseBody
    public User getAdminById(Integer id) {
        User user = adminmanagementService.getAdminById(id);
        return user;
    }

    /**
     * 表单内查询寝室
     */
    @RequestMapping("/mark/roomlist.action")
    @ResponseBody
    public List<AdminManagement> RoomList(String key_roomLou, String key_roomCeng, String key_roomId) {
        List<AdminManagement> room = adminmanagementService.getRoomList(key_roomLou, key_roomCeng, key_roomId);
        return room;
    }

    /**
     * 修改用户信息
     */
    @RequestMapping("/mark/updateadmin.action")
    @ResponseBody
    public String adminUpdate(User user, String del_roomlist) {
        //修改用户表
        int rows = adminmanagementService.updateAdmin(user);
        //修改寝室表
        if (user.getUser_checkroom() != null && user.getUser_checkroom() != "") {
            int rows2 = adminmanagementService.updateRoom(user.getUser_checkroom(), user.getUser_id());
        }
        if (del_roomlist != null && del_roomlist != "") {
            int rows3 = adminmanagementService.deleteRoom(del_roomlist);
        }
        if (rows > 0) {
            return "OK";
        } else {
            return "FAIL";
        }
    }
}
