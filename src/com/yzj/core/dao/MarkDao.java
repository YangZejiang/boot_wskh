package com.yzj.core.dao;

import com.yzj.core.po.Mark;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * MarkDAO层接口
 */
public interface MarkDao {
    // 成绩列表
    List<Mark> selectMarkList(Mark mark);

    // 查询范围内成绩列表总记录数
    Integer selectMarkListCount(Mark mark);

    // 添加成绩
    int createMark(Mark mark);

    // 作成绩是否已存在判断
    Integer createMarkCheck(Mark mark);

    // 通过id查询寝室卫生成绩
    Mark getMarkById(Integer id);

    // 更新寝室卫生成绩信息
    int updateMark(Mark mark);

    // 删除成绩
    int deleteMark(Integer id);

    // 查找对应字段数据
    List<String> selectBaseDict(@Param("field") String field, @Param("table") String table);

    String getUserCheckRoom(Integer user_id);
}
