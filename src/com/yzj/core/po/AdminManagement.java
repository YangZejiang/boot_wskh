package com.yzj.core.po;

import java.io.Serializable;

public class AdminManagement implements Serializable {
    private static final long serialVersionUID = 1L;
    private String room_id;
    private Integer room_user_id;

    public String getRoom_id() {
        return room_id;
    }

    public void setRoom_id(String room_id) {
        this.room_id = room_id;
    }

    public Integer getRoom_user_id() {
        return room_user_id;
    }

    public void setRoom_user_id(Integer room_user_id) {
        this.room_user_id = room_user_id;
    }
}
