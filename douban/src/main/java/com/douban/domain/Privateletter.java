package com.douban.domain;

import java.sql.Timestamp;

public class Privateletter {
    private Integer id;

    private String info;

    private String status;

    private Timestamp time;

    private Integer userId;

    private Integer userById;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getUserById() {
        return userById;
    }

    public void setUserById(Integer userById) {
        this.userById = userById;
    }
}