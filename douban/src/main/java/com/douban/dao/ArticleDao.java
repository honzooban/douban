package com.douban.dao;

import com.douban.domain.Article;
import com.douban.domain.UserAndArticle;

import java.util.List;

public interface ArticleDao {

    /**
     * 获取首页文章数据
     * @return
     */
    List<UserAndArticle> getArticles();

    /**
     * 获取转发内的文章数据
     * @param id 转发id
     * @return 转发内文章数据
     */
    UserAndArticle getTranspondArticle(int id);

    /**
     * 获取文章页面的所有数据
     * @param id 文章id
     * @return 文章页面的所有数据
     */
    UserAndArticle getArticle(int id);

    /**
     * 删除文章
     * @param article 文章信息
     * @return 删除结果
     */
    int deleteArticle(Article article);

    /**
     * 发表文章
     * @param article 文章信息
     * @return 发表结果
     */
    int publishArticle(Article article);

    /**
     * 获取我的文章
     * @param id 用户id
     * @return 文章数据
     */
    List<Article> getMyArticle(int id);

    /**
     * 模糊查找相关文章
     * @param msg 查找内容
     * @return 文章数据
     */
    List<Article> fuzzySearchArticle(String msg);

    /**
     * 修改文章状态
     * @param article 文章信息
     * @return 修改结果
     */
    int updateArticleStatus(Article article);
}