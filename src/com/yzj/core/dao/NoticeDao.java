package com.yzj.core.dao;

import com.yzj.core.po.Notice;

import java.util.List;

/**
 * NoticeDAO层接口
 */
public interface NoticeDao {
    // 查询通知列表
    List<Notice> selectMarkList(Notice notice);

    // 查询通知列表总数
    Integer selectMarkListCount(Notice notice);

    // 发布通知
    int createNotice(Notice notice);

    // 修改通知
    int updateNotice(Notice notice);

    // 通过id获取通知内容
    Notice getNoticeById(Integer id);

    // 修改通知状态
    int updateState(Integer id);
}
