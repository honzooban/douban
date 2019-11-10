package com.douban.dao;

import com.douban.domain.Relation;
import org.apache.ibatis.annotations.Param;

public interface RelationDao {

    /**
     * 获取两用户间关系
     * @param id 用户id
     * @param byId 用户id
     * @return 两用户间关系
     */
    Relation getRelation(@Param("id") int id, @Param("byId") int byId);

    /**
     * 修改好友分组
     * @param relation 好友关系数据
     * @return 修改结果
     */
    int updateRelationType(Relation relation);

    /**
     * 添加好友功能
     * @param relation 用户关系数据
     * @return 添加结果
     */
    int insertRelationStatus(Relation relation);

}