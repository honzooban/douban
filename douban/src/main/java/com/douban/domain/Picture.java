package com.douban.domain;


public class Picture {

    private Integer id;

    private String url;

    private Integer articleId;

    public Picture(String url, Integer articleId) {
        this.url = url;
        this.articleId = articleId;
    }

    public Picture(){}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }
}