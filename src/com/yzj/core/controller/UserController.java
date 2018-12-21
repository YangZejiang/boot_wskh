package com.yzj.core.controller;

import javax.servlet.http.HttpSession;

import com.sun.xml.internal.ws.api.ha.StickyFeature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.yzj.core.po.User;
import com.yzj.core.service.UserService;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;

/**
 * 用户控制器类
 */
@Controller
public class UserController {
    // 依赖注入
    @Autowired
    private UserService userService;

    /**
     * 用户登录
     */
    @RequestMapping(value = "/login.action", method = RequestMethod.POST)
    public String login(String usercode, String password, Model model,
                        HttpSession session) {
        // 通过账号和密码查询用户
        User user = userService.findUser(usercode, password);
        if (user != null) {
            // 将用户对象添加到Session
            session.setAttribute("USER_SESSION", user);
            // 跳转到主页面
            return "redirect:mark/list.action";
        }
        model.addAttribute("msg", "账号或密码错误，请重新输入！");
        // 返回到登录页面
        return "login";
    }

    /**
     * 模拟其他类中跳转到成绩管理页面的方法
     */
    @RequestMapping(value = "/toMark.action")
    public String toMark() {
        return "mark";
    }

    /**
     * 退出登录
     */
    @RequestMapping(value = "/logout.action")
    public String logout(HttpSession session) {
        // 清除Session
        session.invalidate();
        // 重定向到登录页面的跳转方法
        return "redirect:student/list.action";
    }

    /**
     * 向用户登陆页面跳转
     */
    @RequestMapping(value = "/login.action", method = RequestMethod.GET)
    public String toLogin() {
        return "login";
    }

    /**
     * 获取用户信息
     */
    @RequestMapping(value = "/mark/userinfo.action")
    public String getUserInfo(Model model, HttpSession session) {
        User user = (User) session.getAttribute("USER_SESSION");
        Integer id = user.getUser_id();
        User data = userService.getUserInfo(id);
        List<String> roomlist = Arrays.asList(data.getUser_checkroom().split(","));
        model.addAttribute("user", data);
        model.addAttribute("roomlist", roomlist);
        return "profile";
    }

    /**
     * 修改密码
     */
    @RequestMapping("/mark/updatepw.action")
    @ResponseBody
    public String updatePw(String user_id, String user_password) {
        int rows = userService.updatePw(user_id, user_password);
        if (rows > 0) {
            return "OK";
        } else {
            return "FAIL";
        }
    }
}
