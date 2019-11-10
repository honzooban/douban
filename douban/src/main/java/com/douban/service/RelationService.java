package com.douban.service;

import com.douban.domain.Relation;
import com.douban.domain.Result;

import javax.servlet.http.HttpServletRequest;

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

}
