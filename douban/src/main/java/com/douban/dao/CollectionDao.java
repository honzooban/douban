package com.douban.dao;

import com.douban.domain.Article;
import com.douban.domain.Collection;

import java.util.List;

public interface CollectionDao {

    /**
     * 收藏文章
     * @param collection 收藏信息
     * @return 收藏结果
     */
    int insertCollection(Collection collection);

    /**
     * 查找收藏记录
     * @param collection 收藏信息
     * @return 收藏记录
     */
    Collection selectCollectionById(Collection collection);

    /**
     * 获取我的收藏
     * @param id 用户id
     * @return 收藏文章数据
     */
    List<Article> getMyCollection(int id);
}