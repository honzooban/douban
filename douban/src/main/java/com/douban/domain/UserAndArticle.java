package com.douban.domain;

/**
 * @author 93231
 */
public class UserAndArticle {

    private User user;

    private Article article;

    private Integer pageNum;

    private Integer pageSize;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }
}
