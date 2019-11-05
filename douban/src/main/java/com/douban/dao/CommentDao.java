package com.douban.dao;

import com.douban.domain.Comment;
import com.douban.domain.UserAndComment;

import java.util.List;

public interface CommentDao {

    /**
     * 用户评论文章
     * @param comment 评论内容
     * @return 评论结果
     */
    int insertComment(Comment comment);

    /**
     * 获取文章的所有评论
     * @param id 文章id
     * @return 文章所有评论集合
     */
    List<UserAndComment> getComments(int id);

}