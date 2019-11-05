package com.douban.domain;

/**
 *
 * @author: 93231
 * @date: 2019/11/5 8:49
 * @version: 1.0
 */
public class UserAndArticle {

    private User user;

    private Article article;

    private Transpond transpond;

    private User ArticleUser;

    public User getArticleUser() {
        return ArticleUser;
    }

    public void setArticleUser(User articleUser) {
        ArticleUser = articleUser;
    }

    public Transpond getTranspond() {
        return transpond;
    }

    public void setTranspond(Transpond transpond) {
        this.transpond = transpond;
    }

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
