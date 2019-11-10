package com.douban.domain;

public class Relation {
    private Integer id;

    private String type;

    private String status;

    private Integer userId;

    private Integer userById;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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