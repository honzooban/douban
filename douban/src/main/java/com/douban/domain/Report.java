package com.douban.domain;

import java.sql.Timestamp;

public class Report {
    private Integer id;

    private String content;

    private Timestamp time;

    private Integer userId;

    private Integer userById;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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