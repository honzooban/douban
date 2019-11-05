package com.douban.service.impl;

import com.douban.commons.Constant;
import com.douban.dao.CommentDao;
import com.douban.domain.Comment;
import com.douban.domain.Result;
import com.douban.domain.User;
import com.douban.service.CommentService;
import com.douban.util.TimeUtil;
import com.douban.util.ValidateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDao commentDao;

    @Override
    public Result commentArticle(Comment comment, HttpServletRequest request) {
        if(!ValidateUtil.isSessionExist(request, Constant.USER)){
            return new Result(404,"你暂未登录，请前往登录",null);
        }
        User user = (User) request.getSession().getAttribute(Constant.USER);
        comment.setUserId(user.getId());
        comment.setTime(TimeUtil.createTimestamp());
        return commentDao.insertComment(comment) == 1 ? new Result(200,"评论成功",null) :
                new Result(400,"评论失败，请重试",null);
    }
}
