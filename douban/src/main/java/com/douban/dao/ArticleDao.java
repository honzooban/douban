package com.douban.dao;

import com.douban.domain.UserAndArticle;

import java.util.List;

public interface ArticleDao {

    /**
     * 获取首页
     * @return
     */
    List<UserAndArticle> getUserAndArticle();


}