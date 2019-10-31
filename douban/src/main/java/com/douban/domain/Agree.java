package com.douban.domain;

public class Agree {
    private Integer agreeId;

    private String agreeTime;

    private Integer commentId;

    private Integer transpondId;

    private Integer articleId;

    private Integer userId;

    public Integer getAgreeId() {
        return agreeId;
    }

    public void setAgreeId(Integer agreeId) {
        this.agreeId = agreeId;
    }

    public String getAgreeTime() {
        return agreeTime;
    }

    public void setAgreeTime(String agreeTime) {
        this.agreeTime = agreeTime == null ? null : agreeTime.trim();
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getTranspondId() {
        return transpondId;
    }

    public void setTranspondId(Integer transpondId) {
        this.transpondId = transpondId;
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