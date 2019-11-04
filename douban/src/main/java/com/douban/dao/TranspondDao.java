package com.douban.dao;

import com.douban.domain.Transpond;

public interface TranspondDao {

    /**
     * 用户转发文章
     * @param transpond 转发内容
     * @return 转发结果
     */
    int insertTranspond(Transpond transpond);
}
