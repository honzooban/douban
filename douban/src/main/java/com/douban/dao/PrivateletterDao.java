package com.douban.dao;

import com.douban.domain.Privateletter;
import com.douban.domain.UserAndPrivateletter;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PrivateletterDao {

    /**
     * 根据id查找最近一次豆邮记录
     * @param id 用户id
     * @param byId 用户id
     * @return 最近一次豆邮记录
     */
    Privateletter selectLastPrivateletter(@Param("id") int id,@Param("byId") int byId);

    /**
     * 获取用户间的所有豆邮记录
     * @param id
     * @param byId
     * @return 用户间的所有豆邮记录
     */
    List<UserAndPrivateletter> selectAllPrivateletter(@Param("id") int id,@Param("byId") int byId);
}