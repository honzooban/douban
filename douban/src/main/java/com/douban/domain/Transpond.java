package com.douban.domain;

import java.sql.Timestamp;

public class Transpond {

    private Integer id;

    private String info;

    private Timestamp time;

    private Integer agreementNum;

    private Integer articleId;

    private Integer userId;

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

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Integer getAgreementNum() {
        return agreementNum;
    }

    public void setAgreementNum(Integer agreementNum) {
        this.agreementNum = agreementNum;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
