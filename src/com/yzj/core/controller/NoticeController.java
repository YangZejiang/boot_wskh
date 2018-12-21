package com.yzj.core.controller;

import com.yzj.common.utils.Page;
import com.yzj.core.po.Notice;
import com.yzj.core.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 通知管理控制器类
 */
@Controller
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    /**
     * 查询通知列表
     */
    @RequestMapping(value = "/mark/noticelist.action")

    public String findNoticeList(@RequestParam(defaultValue = "1") Integer page,
                                 @RequestParam(defaultValue = "5") Integer rows, Model model) {
        // 条件查询所有通知
        Page<Notice> notices = noticeService.findNoticeList(page, rows);
        model.addAttribute("page", notices);
        return "notice";
    }

    /**
     * 发布通知
     */
    @RequestMapping("/mark/publish.action")
    @ResponseBody
    public String noticeCreate(Notice notice) {
        // 获取当前时间
        Date Time = new Date();
        //格式化输出
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        notice.setNotice_date(sdf.format(Time));
        int rows = noticeService.createNotice(notice);
        if (rows > 0) {
            return "OK";
        } else {
            return "FAIL";
        }
    }

    /**
     * 通过id获取通知内容
     */
    @RequestMapping("/mark/getNoticeById.action")
    @ResponseBody
    public Notice getMarkById(Integer id) {
        Notice notice = noticeService.getNoticeById(id);
        return notice;
    }

    /**
     * 修改通知
     */
    @RequestMapping("/mark/updateNotice.action")
    @ResponseBody
    public String noticeUpdate(Notice notice) {
        int rows = noticeService.updateNotice(notice);
        if (rows > 0) {
            return "OK";
        } else {
            return "FAIL";
        }
    }
    /**
     * 修改通知状态
     */
    @RequestMapping("/mark/editState.action")
    @ResponseBody
    public String stateUpdate(Integer id) {
        int rows = noticeService.stateUpdate(id);
        if (rows > 0) {
            return "OK";
        } else {
            return "FAIL";
        }
    }

}

