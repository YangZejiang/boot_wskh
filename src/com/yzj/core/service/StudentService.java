package com.yzj.core.service;

import com.yzj.common.utils.Page;
import com.yzj.core.po.Notice;
import com.yzj.core.po.Student;

import java.util.List;

public interface StudentService {
    // 查询成绩列表
    Page<Student> findMarkList(Integer page, Integer rows,
                               String key_mkPer, String key_roomLou,
                               String key_roomCeng, String key_roomId);


    // 查找对应字段数据
    List<String> findBaseDict(String field, String table);

    // 查询通知栏数据
    List<Notice> findNotice();

}
