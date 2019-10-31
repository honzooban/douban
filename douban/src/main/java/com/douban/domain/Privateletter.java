package com.douban.domain;

import java.util.Date;

public class Privateletter {
    private Integer privateletterId;

    private String privateletterInfo;

    private String privateletterInfostatus;

    private Date privateletterTime;

    private Integer userId;

    private Integer userByid;

    public Integer getPrivateletterId() {
        return privateletterId;
    }

    public void setPrivateletterId(Integer privateletterId) {
        this.privateletterId = privateletterId;
    }

    public String getPrivateletterInfo() {
        return privateletterInfo;
    }

    public void setPrivateletterInfo(String privateletterInfo) {
        this.privateletterInfo = privateletterInfo == null ? null : privateletterInfo.trim();
    }

    public String getPrivateletterInfostatus() {
        return privateletterInfostatus;
    }

    public void setPrivateletterInfostatus(String privateletterInfostatus) {
        this.privateletterInfostatus = privateletterInfostatus == null ? null : privateletterInfostatus.trim();
    }

    public Date getPrivateletterTime() {
        return privateletterTime;
    }

    public void setPrivateletterTime(Date privateletterTime) {
        this.privateletterTime = privateletterTime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getUserByid() {
        return userByid;
    }

    public void setUserByid(Integer userByid) {
        this.userByid = userByid;
    }
}