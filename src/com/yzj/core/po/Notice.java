package com.yzj.core.po;

import java.io.Serializable;

public class Notice implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer notice_id;            //信息编号
    private String notice_text;           //文本
    private String notice_date;           //创建时间
    private String notice_state;          //1：显示 0：隐藏
    private Integer start;                //起始行
    private Integer rows;                 //所取行数

    public Integer getNotice_id() {
        return notice_id;
    }

    public void setNotice_id(Integer notice_id) {
        this.notice_id = notice_id;
    }

    public String getNotice_text() {
        return notice_text;
    }

    public void setNotice_text(String notice_text) {
        this.notice_text = notice_text;
    }

    public String getNotice_date() {
        return notice_date;
    }

    public void setNotice_date(String notice_date) {
        this.notice_date = notice_date;
    }

    public String getNotice_state() {
        return notice_state;
    }

    public void setNotice_state(String notice_state) {
        this.notice_state = notice_state;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }
}
