package com.yzj.core.controller;

import com.yzj.common.utils.Page;
import com.yzj.core.po.Notice;
import com.yzj.core.po.Student;
import com.yzj.core.service.NoticeService;
import com.yzj.core.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class StudentController {
    // 依赖注入
    @Autowired
    private StudentService studentService;

    /**
     * 学生界面成绩列表
     */
    @RequestMapping(value = "/student/list.action")
    public String search(@RequestParam(defaultValue = "1") Integer page,
                         @RequestParam(defaultValue = "5") Integer rows,
                         String key_mkPer, String key_roomLou, String key_roomCeng,
                         String key_roomId, Model model) {
        // 条件查询所有成绩
        Page<Student> students = studentService.findMarkList(page, rows, key_mkPer,
                key_roomLou, key_roomCeng, key_roomId);
        model.addAttribute("page", students);

        // 所有周（期）
        List<String> allper = studentService.findBaseDict("mk_per", "mark");
        // 所有楼
        List<String> alllou = studentService.findBaseDict("room_lou", "room");
        // 所有层
        List<String> allceng = studentService.findBaseDict("room_ceng", "room");


        // 添加参数
        model.addAttribute("allPer", allper);
        model.addAttribute("allLou", alllou);
        model.addAttribute("allCeng", allceng);

        // 查询通知栏数据
        List<Notice> notice = studentService.findNotice();
        model.addAttribute("notice", notice);

        model.addAttribute("key_mkPer", key_mkPer);
        model.addAttribute("key_roomLou", key_roomLou);
        model.addAttribute("key_roomCeng", key_roomCeng);
        model.addAttribute("key_roomId", key_roomId);
        return "search";
    }


}
