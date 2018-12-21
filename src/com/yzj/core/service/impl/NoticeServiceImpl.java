package com.yzj.core.service.impl;

import com.yzj.common.utils.Page;
import com.yzj.core.dao.NoticeDao;
import com.yzj.core.po.Notice;
import com.yzj.core.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("noticeService")
@Transactional
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    private NoticeDao noticeDao;

    // 查找通知列表
    @Override
    public Page<Notice> findNoticeList(Integer page, Integer rows) {
        Notice notice = new Notice();
        // 当前页
        notice.setStart((page - 1) * rows);
        // 每页数
        notice.setRows(rows);
        // 查询列表
        List<Notice> notices = noticeDao.selectMarkList(notice);
        // 查询列表总记录数
        Integer count = noticeDao.selectMarkListCount(notice);
        // 创建Page返回对象
        Page<Notice> result = new Page<>();
        result.setPage(page);
        result.setRows(notices);
        result.setSize(rows);
        result.setTotal(count);
        return result;

    }

    // 发布通知
    @Override
    public int createNotice(Notice notice) {
        return noticeDao.createNotice(notice);
    }

    // 修改通知
    @Override
    public int updateNotice(Notice notice) {
        return noticeDao.updateNotice(notice);
    }

    //通过id获取通知容
    @Override
    public Notice getNoticeById(Integer id) {
        Notice notice = noticeDao.getNoticeById(id);
        return notice;
    }
    // 修改通知状态
    @Override
    public int stateUpdate(Integer id) {
        return noticeDao.updateState(id);
    }
}
