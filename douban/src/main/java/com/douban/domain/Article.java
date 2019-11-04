package com.douban.domain;

public class Article {
    private Integer id;

    private String title;

    private String content;

    private String time;

    private Integer status;

    private String type;

    private Integer commentNum;

    private Integer transpondNum;

    private Integer agreementNum;

    private Integer userId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(Integer commentNum) {
        this.commentNum = commentNum;
    }

    public Integer getTranspondNum() {
        return transpondNum;
    }

    public void setTranspondNum(Integer transpondNum) {
        this.transpondNum = transpondNum;
    }

    public Integer getAgreementNum() {
        return agreementNum;
    }

    public void setAgreementNum(Integer agreementNum) {
        this.agreementNum = agreementNum;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}