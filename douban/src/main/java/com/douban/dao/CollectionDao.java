package com.douban.dao;

import com.douban.domain.Collection;

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
}