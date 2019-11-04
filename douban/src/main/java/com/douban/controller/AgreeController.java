package com.douban.controller;

import com.douban.domain.Agree;
import com.douban.domain.Result;
import com.douban.service.AgreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @auther: 93231
 * @date: 2019/11/4 14:31
 * @version: 1.0
 */
@RestController
@RequestMapping("agree")
public class AgreeController {

    @Autowired
    private AgreeService agreeService;

    /**
     * 点赞文章
     * @param agree 点赞信息
     * @param request
     * @return 点赞结果
     */
    @RequestMapping("agreeArticle")
    public Result agreeArticle(@RequestBody Agree agree, HttpServletRequest request){
        return agreeService.agree(agree, request);
    }

    /**
     * 点赞评论
     * @param agree 点赞信息
     * @param request
     * @return 点赞结果
     */
    @RequestMapping("agreeComment")
    public Result agreeComment(@RequestBody Agree agree, HttpServletRequest request){
        return agreeService.agree(agree, request);
    }

    /**
     * 点赞转发
     * @param agree 点赞信息
     * @param request
     * @return 点赞结果
     */
    @RequestMapping("agreeTranspond")
    public Result agreeTranspond(@RequestBody Agree agree, HttpServletRequest request){
        return agreeService.agree(agree, request);
    }
}
