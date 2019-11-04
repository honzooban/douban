package com.douban.service;

import com.douban.domain.UserAndArticle;
import com.github.pagehelper.PageInfo;

/**
 * 文章业务层
 * @author: 93231
 * @date: 2019/11/5 0:48
 * @version: 1.0
 */
public interface ArticleService {

    /**
     * 获取首页文章的数据
     * @param pn 当前页数
     * @return 封装首页文章数据的实体类
     */
    PageInfo<UserAndArticle> getUserAndArticle(Integer pn);
}
