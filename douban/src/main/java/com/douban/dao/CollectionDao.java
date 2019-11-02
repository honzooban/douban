package com.douban.dao;

import com.douban.domain.Collection;

public interface CollectionDao {
    int deleteByPrimaryKey(Integer collectionId);

    int insert(Collection record);

    int insertSelective(Collection record);

    Collection selectByPrimaryKey(Integer collectionId);

    int updateByPrimaryKeySelective(Collection record);

    int updateByPrimaryKey(Collection record);
}