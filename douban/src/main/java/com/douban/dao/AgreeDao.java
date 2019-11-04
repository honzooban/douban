package com.douban.dao;

import com.douban.domain.Agree;
import org.apache.ibatis.annotations.Param;

public interface AgreeDao {

    /**
     * 根据用户id查询点赞记录
     * @param id 用户id
     * @param byId 被点赞对象的id
     * @return 点赞记录
     */
    Agree selectAgreeById(@Param("id") int id, @Param("byId") int byId, @Param("type") String type);

    /**
     * 点赞操作
     * @param agree 点赞信息
     * @return 点赞结果
     */
    int insertAgreeRecord(Agree agree);

}