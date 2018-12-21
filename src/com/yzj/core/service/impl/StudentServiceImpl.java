package com.yzj.core.service.impl;

import com.yzj.common.utils.Page;
import com.yzj.core.dao.StudentDao;
import com.yzj.core.po.Notice;
import com.yzj.core.po.Student;
import com.yzj.core.service.StudentService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * 成绩管理
 */
@Service("studentService")
@Transactional
public class StudentServiceImpl implements StudentService {
    // 声明DAO属性并注入
    @Autowired
    private StudentDao studentDao;

    // 成绩列表
    public Page<Student> findMarkList(Integer page, Integer rows,
                                      String key_mkPer, String key_roomLou, String key_roomCeng,
                                      String key_roomId) {
        // 创建成绩对象
        Student student = new Student();
        // 创建寝室对象


        if (StringUtils.isNotBlank(key_mkPer)) {
            student.setMk_per(key_mkPer);
        }

        if (StringUtils.isNotBlank(key_roomLou)) {
            student.setRoom_lou(key_roomLou);
        }

        if (StringUtils.isNotBlank(key_roomCeng)) {
            student.setRoom_ceng(key_roomCeng);
        }

        if (StringUtils.isNotBlank(key_roomId)) {
            student.setRoom_id(key_roomId);
        }
        // 当前页
        student.setStart((page - 1) * rows);
        // 每页数
        student.setRows(rows);
        // 查询成绩列表
        List<Student> students = studentDao.selectMarkList(student);
        // 查询成绩列表总记录数
        Integer count = studentDao.selectMarkListCount(student);
        // 创建Page返回对象
        Page<Student> result = new Page<>();
        result.setPage(page);
        result.setRows(students);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    /**
     * 查找对应字段数据
     */
    @Override
    public List<String> findBaseDict(String field, String table) {
        return studentDao.selectBaseDict(field, table);
    }

    /**
     * 查找通知栏数据
     */
    @Override
    public List<Notice> findNotice() {
        List<Notice> notice = studentDao.selectNotice();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        for (int i = 0; i < notice.size(); i++) {
            Notice s = notice.get(i);
            try {
                s.setNotice_date(dateFormat.format(dateFormat.parse(notice.get(i).getNotice_date())));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            notice.set(i, s);
        }
        return notice;
    }


}
