package com.douban.dao;

import com.douban.domain.Relation;
import com.douban.domain.User;
import com.douban.domain.UserAndRelation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

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

    /**
     * 根据用户id查找所有好友
     * @param id 用户id
     * @return 好友集合
     */
    List<UserAndRelation> selectAllFriend(int id);

    /**
     * 根据用户id查找所有的好友分类
     * @param id 用户id
     * @return 好友分类集合
     */
    List<Relation> selectAllRelation(int id);

    /**
     * 根据用户id查找黑名单用户
     * @param id 用户id
     * @return 黑名单用户集合
     */
    List<User> selectAllBlackList(int id);

    /**
     * 修改用户间关系状态
     * @param id 用户id
     * @param byId 用户id
     * @param status 状态码
     * @return 修改结果
     */
    int updateRelationStatus(@Param("id") int id, @Param("byId") int byId, @Param("status") int status);
}