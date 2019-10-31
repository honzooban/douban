package com.douban.domain;

public class Article {
    private Integer articleId;

    private String articleTitle;

    private String articleContent;

    private String articleTime;

    private Integer articleStatus;

    private String articleType;

    private Integer articleCommentnum;

    private Integer articleTranspondnum;

    private Integer articleAgreementnum;

    private Integer userId;

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle == null ? null : articleTitle.trim();
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent == null ? null : articleContent.trim();
    }

    public String getArticleTime() {
        return articleTime;
    }

    public void setArticleTime(String articleTime) {
        this.articleTime = articleTime == null ? null : articleTime.trim();
    }

    public Integer getArticleStatus() {
        return articleStatus;
    }

    public void setArticleStatus(Integer articleStatus) {
        this.articleStatus = articleStatus;
    }

    public String getArticleType() {
        return articleType;
    }

    public void setArticleType(String articleType) {
        this.articleType = articleType == null ? null : articleType.trim();
    }

    public Integer getArticleCommentnum() {
        return articleCommentnum;
    }

    public void setArticleCommentnum(Integer articleCommentnum) {
        this.articleCommentnum = articleCommentnum;
    }

    public Integer getArticleTranspondnum() {
        return articleTranspondnum;
    }

    public void setArticleTranspondnum(Integer articleTranspondnum) {
        this.articleTranspondnum = articleTranspondnum;
    }

    public Integer getArticleAgreementnum() {
        return articleAgreementnum;
    }

    public void setArticleAgreementnum(Integer articleAgreementnum) {
        this.articleAgreementnum = articleAgreementnum;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}