package com.yzj.core.service;

import com.yzj.common.utils.Page;
import com.yzj.core.po.Mark;

import java.util.List;
import java.util.Map;

public interface MarkService {
    // 查询成绩列表
    Page<Mark> findMarkList(Integer page, Integer rows,
                            String key_mkPer, String key_roomLou,
                            String key_roomCeng, String key_roomId);

    // 创建成绩
    int createMark(Mark mark);

    // 通过id查询成绩
    Mark getMarkById(Integer id);

    // 修改成绩
    int updateMark(Mark customer);

    // 删除成绩
    int deleteMark(Integer id);

    // 查找对应字段数据
    List<String> findBaseDict(String field, String table);

    List<String> getUserCheckRoom(Integer user_id);
}
