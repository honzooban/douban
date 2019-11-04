package com.douban.service;

import com.douban.domain.Result;
import com.douban.domain.Transpond;

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
}
