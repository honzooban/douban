package com.douban.domain;

public class Comment {
    private Integer commentId;

    private String commentInfo;

    private String commentTime;

    private Integer commentAgreementnum;

    private Integer articleId;

    private Integer userId;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public String getCommentInfo() {
        return commentInfo;
    }

    public void setCommentInfo(String commentInfo) {
        this.commentInfo = commentInfo == null ? null : commentInfo.trim();
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime == null ? null : commentTime.trim();
    }

    public Integer getCommentAgreementnum() {
        return commentAgreementnum;
    }

    public void setCommentAgreementnum(Integer commentAgreementnum) {
        this.commentAgreementnum = commentAgreementnum;
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