package com.yzj.core.service;

import com.yzj.common.utils.Page;
import com.yzj.core.po.Notice;

public interface NoticeService {
    // 查询通知列表
    Page<Notice> findNoticeList(Integer page, Integer rows);

    // 发布通知
    int createNotice(Notice notice);

    // 修改通知
    int updateNotice(Notice notice);
    // 通过id获取通知内容
    Notice getNoticeById(Integer id);
    // 修改通知状态
    int stateUpdate(Integer id);
}
