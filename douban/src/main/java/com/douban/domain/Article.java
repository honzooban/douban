package com.douban.domain;

import java.sql.Timestamp;
import java.util.List;

public class Article {
    private Integer id;

    private String title;

    private String content;

    private Timestamp time;

    private Integer status;

    private String type;

    private Integer commentNum;

    private Integer transpondNum;

    private Integer agreementNum;

    private Integer userId;

    private List<Picture> pictures;

    public List<Picture> getPictures() {
        return pictures;
    }

    public void setPictures(List<Picture> pictures) {
        this.pictures = pictures;
    }

    public Article(){}

    public Article(Integer id) {
        this.id = id;
    }

    public Article(Integer id, String title, String content) {
        this.id = id;
        this.title = title;
        this.content = content;
    }

    public Article(String title, String content, Timestamp time, String type, Integer userId) {
        this.title = title;
        this.content = content;
        this.time = time;
        this.type = type;
        this.userId = userId;
    }

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

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
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