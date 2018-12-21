package com.yzj.core.dao;

import com.yzj.core.po.Notice;
import com.yzj.core.po.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * StudentDAO层接口
 */
public interface StudentDao {
    // 成绩列表
    List<Student> selectMarkList(Student student);

    // 查询指定范围内成绩总数
    Integer selectMarkListCount(Student student);

    // 查找对应字段数据
    List<String> selectBaseDict(@Param("field") String field, @Param("table") String table);

    // 查找通知栏信息}
    List<Notice> selectNotice();
}
