package com.yzj.core.controller;


import com.yzj.common.utils.Page;
import com.yzj.core.po.Mark;
import com.yzj.core.po.User;
import com.yzj.core.service.AdminManagementService;
import com.yzj.core.service.MarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 管理员成绩管理控制器类
 */
@Controller
public class MarkController {
    // 依赖注入
    @Autowired
    private MarkService markService;
    @Autowired
    private AdminManagementService adminManagementService;

    /**
     * 管理员界面成绩列表
     */
    @RequestMapping(value = "/mark/list.action")
    public String list(@RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "5") Integer rows,
                       String key_mkPer, String key_roomLou, String key_roomCeng,
                       String key_roomId, Model model, HttpSession session) {
        // 条件查询所有成绩
        Page<Mark> marks = markService
                .findMarkList(page, rows, key_mkPer,
                        key_roomLou, key_roomCeng, key_roomId);
        model.addAttribute("page", marks);
        // 所有周（期）
        List<String> allper = markService.findBaseDict("mk_per", "mark");
        // 所有楼
        List<String> alllou = markService.findBaseDict("room_lou", "room");
        // 所有层
        List<String> allceng = markService.findBaseDict("room_ceng", "room");

        // 获取Session中的当前用户信息
        User user = (User) session.getAttribute("USER_SESSION");
        List<String> myroom = markService.getUserCheckRoom(user.getUser_id());
        model.addAttribute("myRoom", myroom);
        // 添加参数
        model.addAttribute("allPer", allper);
        model.addAttribute("allLou", alllou);
        model.addAttribute("allCeng", allceng);

        model.addAttribute("key_mkPer", key_mkPer);
        model.addAttribute("key_roomLou", key_roomLou);
        model.addAttribute("key_roomCeng", key_roomCeng);
        model.addAttribute("key_roomId", key_roomId);
        return "mark";
    }

    /**
     * 添加成绩
     */
    @RequestMapping("/mark/create.action")
    @ResponseBody
    public String markCreate(Mark mark, HttpSession session) {
        // 获取Session中的当前用户信息
        User user = (User) session.getAttribute("USER_SESSION");
        // 将当前用户id存储在客户对象中
        mark.setMk_user_id(user.getUser_id());
        // 执行Service层中的创建方法，返回的是受影响的行数
        int rows = markService.createMark(mark);
        if (rows > 0) {
            return "OK";
        } else if (rows == -1) {
            return "EXIST";
        } else {
            return "FAIL";
        }
    }

    /**
     * 通过id获取寝室卫生成绩信息
     */
    @RequestMapping("/mark/getMarkById.action")
    @ResponseBody
    public Mark getMarkById(Integer id) {
        Mark mark = markService.getMarkById(id);
        return mark;
    }

    /**
     * 修改成绩
     */
    @RequestMapping("/mark/update.action")
    @ResponseBody
    public String markUpdate(Mark mark) {
        int rows = markService.updateMark(mark);
        if (rows > 0) {
            return "OK";
        } else {
            return "FAIL";
        }
    }

    /**
     * 删除成绩
     */
    @RequestMapping("/mark/delete.action")
    @ResponseBody
    public String markDelete(Integer id) {
        int rows = markService.deleteMark(id);
        if (rows > 0) {
            return "OK";
        } else {
            return "FAIL";
        }
    }

}
