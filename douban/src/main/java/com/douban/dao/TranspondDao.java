package com.douban.dao;

import com.douban.domain.Transpond;
import com.douban.domain.UserAndArticle;

import java.util.List;

public interface TranspondDao {

    /**
     * 用户转发文章
     * @param transpond 转发内容
     * @return 转发结果
     */
    int insertTranspond(Transpond transpond);

    /**
     * 获取首页转发的所有数据
     * @return 首页转发的所有数据
     */
    List<UserAndArticle> getTranspond();

    /**
     * 删除转发
     * @param transpond 转发内容
     * @return 删除结果
     */
    int deleteTranspond(Transpond transpond);
}
