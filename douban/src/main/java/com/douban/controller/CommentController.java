package com.douban.controller;

import com.douban.domain.Comment;
import com.douban.domain.Result;
import com.douban.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("comment")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("commentArticle")
    public Result commentArticle(@RequestBody Comment comment, HttpServletRequest request){
        return commentService.commentArticle(comment, request);
    }
}
