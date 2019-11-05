package com.douban.service;

import com.douban.domain.Result;
import com.douban.domain.Transpond;
import com.douban.domain.UserAndArticle;
import com.github.pagehelper.PageInfo;

import javax.servlet.http.HttpServletRequest;

/**
 * 转发业务层
 * @author: 93231
 * @date: 2019/11/5 0:48
 * @version: 1.0
 */
public interface TranspondService {

    /**
     * 转发文章
     * @param transpond 转发内容
     * @param request
     * @return 转发结果
     */
    Result transpondArticle(Transpond transpond, HttpServletRequest request);

    /**
     * 获取转发文章的数据
     * @param pn 当前页面
     * @return 封装首页转发数据的实体类
     */
    PageInfo<UserAndArticle> getTranspond(Integer pn);

    /**
     * 删除转发
     * @param transpond 转发内容
     * @param request
     * @return 删除结果
     */
    Result deleteTranspond(Transpond transpond, HttpServletRequest request);

}
