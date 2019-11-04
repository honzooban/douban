package com.douban.controller;

import com.douban.domain.Result;
import com.douban.domain.Transpond;
import com.douban.service.TranspondService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * 转发控制层
 * @author: 93231
 * @date: 2019/11/5 0:39
 * @version: 1.0
 */
@RestController
@RequestMapping("transpond")
public class TranspondController {

    @Autowired
    private TranspondService transpondService;

    /**
     * 转发文章
     * @param transpond 转发内容
     * @param request
     * @return 转发结果
     */
    @RequestMapping("transpondArticle")
    public Result transpondArticle(@RequestBody Transpond transpond, HttpServletRequest request){
        return transpondService.transpondArticle(transpond, request);
    }
}
