package com.douban.controller;

import com.douban.domain.Collection;
import com.douban.domain.Result;
import com.douban.service.CollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * 收藏控制层
 * @author: 93231
 * @date: 2019/11/5 22:48
 * @version: 1.0
 */
@RestController
@RequestMapping("collection")
public class CollectionController {

    @Autowired
    private CollectionService collectArticle;

    /**
     * 收藏文章
     * @param collection 收藏信息
     * @return 收藏结果
     */
    @RequestMapping("collectArticle")
    public Result collectArticle(@RequestBody Collection collection, HttpServletRequest request){
        return collectArticle.collectArticle(collection,request);
    }
}
