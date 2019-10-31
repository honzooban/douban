package com.douban.dao;

import domain.Privateletter;

public interface PrivateletterDao {
    int deleteByPrimaryKey(Integer privateletterId);

    int insert(Privateletter record);

    int insertSelective(Privateletter record);

    Privateletter selectByPrimaryKey(Integer privateletterId);

    int updateByPrimaryKeySelective(Privateletter record);

    int updateByPrimaryKey(Privateletter record);
}