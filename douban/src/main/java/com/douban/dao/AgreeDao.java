package com.douban.dao;

import domain.Agree;

public interface AgreeDao {
    int deleteByPrimaryKey(Integer agreeId);

    int insert(Agree record);

    int insertSelective(Agree record);

    Agree selectByPrimaryKey(Integer agreeId);

    int updateByPrimaryKeySelective(Agree record);

    int updateByPrimaryKey(Agree record);
}