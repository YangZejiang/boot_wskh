package com.yzj.core.service.impl;

import com.yzj.common.utils.Page;
import com.yzj.core.dao.MarkDao;
import com.yzj.core.po.Mark;
import com.yzj.core.service.MarkService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;

/**
 * 成绩管理
 */
@Service("markService")
@Transactional
public class MarkServiceImpl implements MarkService {
    // 声明DAO属性并注入
    @Autowired
    private MarkDao markDao;

    // 成绩列表
    public Page<Mark> findMarkList(Integer page, Integer rows,
                                   String key_mkPer, String key_roomLou, String key_roomCeng,
                                   String key_roomId) {
        // 创建成绩对象
        Mark mark = new Mark();

        if (StringUtils.isNotBlank(key_mkPer)) {
            mark.setMk_per(key_mkPer);
        }

        if (StringUtils.isNotBlank(key_roomLou)) {
            mark.setRoom_lou(key_roomLou);
        }

        if (StringUtils.isNotBlank(key_roomCeng)) {
            mark.setRoom_ceng(key_roomCeng);
        }

        if (StringUtils.isNotBlank(key_roomId)) {
            mark.setRoom_id(key_roomId);
        }
        // 当前页
        mark.setStart((page - 1) * rows);
        // 每页数
        mark.setRows(rows);
        // 查询成绩列表
        List<Mark> marks = markDao.selectMarkList(mark);
        // 查询成绩列表总记录数
        Integer count = markDao.selectMarkListCount(mark);
        // 创建Page返回对象
        Page<Mark> result = new Page<>();
        result.setPage(page);
        result.setRows(marks);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    /**
     * 添加成绩
     */
    @Override
    public int createMark(Mark mark) {
        // 作成绩是否已存在判断
        if (markDao.createMarkCheck(mark) != 0) {
            return -1;
        }
        return markDao.createMark(mark);
    }

    /**
     * 通过id查询寝室卫生成绩
     */
    @Override
    public Mark getMarkById(Integer id) {
        Mark mark = markDao.getMarkById(id);
        return mark;
    }

    /**
     * 修改成绩
     */
    @Override
    public int updateMark(Mark mark) {
        return markDao.updateMark(mark);
    }

    /**
     * 删除成绩
     */
    @Override
    public int deleteMark(Integer id) {
        return markDao.deleteMark(id);
    }

    /**
     * 查找对应字段数据
     */
    @Override
    public List<String> findBaseDict(String field, String table) {
        return markDao.selectBaseDict(field, table);
    }

    @Override
    public List<String> getUserCheckRoom(Integer user_id) {
        List myroom = Arrays.asList(markDao.getUserCheckRoom(user_id).split(","));
        return myroom;
    }

}
