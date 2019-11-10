package com.douban.domain;

import java.sql.Timestamp;

public class User {
    private Integer id;

    private String name;

    private String password;

    private String phone;

    private String avatar;

    private String gender;

    private String signature;

    private String status;

    private Timestamp banTime;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getBanTime() {
        return banTime;
    }

    public void setBanTime(Timestamp banTime) {
        this.banTime = banTime;
    }

    public User(){}

    public User(int id, String gender, String signature) {
        this.id = id;
        this.gender = gender;
        this.signature = signature;
    }
}