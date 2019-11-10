package com.douban.service;

import com.douban.domain.Article;
import com.douban.domain.Collection;
import com.douban.domain.Result;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface CollectionService {

    /**
     * 收藏文章
     * @param collection 收藏信息
     * @param request
     * @return 收藏结果
     */
    Result collectArticle(Collection collection, HttpServletRequest request);

    /**
     * 获取我的收藏
     * @param request
     * @return 文章数据
     */
    List<Article> getMyCollection(HttpServletRequest request);
}
