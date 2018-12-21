package com.yzj.core.po;

import java.io.Serializable;
import java.util.Date;

/**
 * 成绩持久化类
 */
public class Mark implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer mk_id;                //成绩唯一id
    private String mk_per;                //成绩所属周（期）
    private String mk_room_id;            //成绩所属寝室 例：050413（5号楼413）
    private String room_id;               //寝室号 例：050413（5号楼413）
    private String room_lou;              //楼号
    private String room_ceng;             //层号
    private String room_num;              //门牌
    private Integer mk_grade;             //成绩分数
    private Integer mk_user_id;           //审查人id
    private String mk_case;               //扣分说明
    private Integer mk_state;             //1：显示 0：隐藏
    private Integer start;                //起始行
    private Integer rows;                 //所取行数



    public String getRoom_num() {
        return room_num;
    }

    public void setRoom_num(String room_num) {
        this.room_num = room_num;
    }

    public Integer getMk_id() {
        return mk_id;
    }

    public String getRoom_id() {
        return room_id;
    }

    public void setRoom_id(String room_id) {
        this.room_id = room_id;
    }

    public String getRoom_lou() {
        return room_lou;
    }

    public void setRoom_lou(String room_lou) {
        this.room_lou = room_lou;
    }

    public String getRoom_ceng() {
        return room_ceng;
    }

    public void setRoom_ceng(String room_ceng) {
        this.room_ceng = room_ceng;
    }

    public void setMk_id(Integer mk_id) {
        this.mk_id = mk_id;
    }

    public String getMk_per() {
        return mk_per;
    }

    public void setMk_per(String mk_per) {
        this.mk_per = mk_per;
    }

    public String getMk_room_id() {
        return mk_room_id;
    }

    public void setMk_room_id(String mk_room_id) {
        this.mk_room_id = mk_room_id;
    }

    public Integer getMk_grade() {
        return mk_grade;
    }

    public void setMk_grade(Integer mk_grade) {
        this.mk_grade = mk_grade;
    }

    public Integer getMk_user_id() {
        return mk_user_id;
    }

    public void setMk_user_id(Integer mk_user_id) {
        this.mk_user_id = mk_user_id;
    }

    public String getMk_case() {
        return mk_case;
    }

    public void setMk_case(String mk_case) {
        this.mk_case = mk_case;
    }

    public Integer getMk_state() {
        return mk_state;
    }

    public void setMk_state(Integer mk_state) {
        this.mk_state = mk_state;
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




