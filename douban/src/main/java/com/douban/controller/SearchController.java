package com.douban.controller;

import com.douban.service.ArticleService;
import com.douban.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("search")
public class SearchController {

    @Autowired
    private UserService userService;
    @Autowired
    private ArticleService articleService;

    /**
     * 获取搜索页面及数据
     * @param request
     * @return 搜索页面及数据
     */
    @RequestMapping("getSearchResult")
    public ModelAndView getSearchResult(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user_search");
        mv.addObject("user",userService.searchUser(pn, request));
        mv.addObject("article",articleService.searchArticle(pn, request));
        return mv;
    }
}
