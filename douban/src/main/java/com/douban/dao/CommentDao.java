package com.douban.dao;

import com.douban.domain.Comment;

public interface CommentDao {

    /**
     * 用户评论文章
     * @param comment 评论内容
     * @return 评论结果
     */
    int insertComment(Comment comment);

}