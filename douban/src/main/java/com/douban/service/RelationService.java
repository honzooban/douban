package com.douban.service;

import com.douban.domain.Relation;
import com.douban.domain.Result;
import com.douban.domain.User;
import com.douban.domain.UserAndRelation;
import com.github.pagehelper.PageInfo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface RelationService {

    /**
     * 获取两用户间关系
     * @param request
     * @return 用户关系数据
     */
    Relation getRelation(HttpServletRequest request);

    /**
     * 修改好友分组
     * @param relation 用户关系数据
     * @return 修改结果
     */
    Result updateRelationType(Relation relation);

    /**
     * 添加好友
     * @param relation 用户关系数据
     * @return 添加结果
     */
    Result addFriend(Relation relation);

    /**
     * 获取我的好友页面数据
     * @param pn 页数
     * @param request
     * @return 好友数据
     */
    PageInfo<UserAndRelation> getMyFriends(Integer pn, HttpServletRequest request);

    /**
     * 获取所有的好友分类
     * @param request
     * @return 好友分类集合
     */
    List<Relation> getAllRelation(HttpServletRequest request);

    /**
     * 获取黑名单用户
     * @param request
     * @return 黑名单用户集合
     */
    List<User> getBlackList(HttpServletRequest request);

    /**
     * 删除好友
     * @param request
     * @return 删除结果
     */
    Result deleteFriend(HttpServletRequest request);

    /**
     * 拉黑好友
     * @param request
     * @return 拉黑结果
     */
    Result blackListFriend(HttpServletRequest request);
}
