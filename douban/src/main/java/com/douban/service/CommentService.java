package com.douban.service;

import com.douban.domain.Comment;
import com.douban.domain.Result;

import javax.servlet.http.HttpServletRequest;

/**
 * 转发业务层
 * @author: 93231
 * @date: 2019/11/5 0:48
 * @version: 1.0
 */
public interface CommentService {

    /**
     * 评论文章
     * @param comment 评论内容
     * @param request
     * @return 评论结果
     */
    Result commentArticle(Comment comment, HttpServletRequest request);
}
