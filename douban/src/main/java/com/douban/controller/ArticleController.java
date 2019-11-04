package com.douban.controller;

import com.douban.commons.Constant;
import com.douban.service.ArticleService;
import com.douban.service.UserService;
import com.douban.util.ValidateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * 文章接口控制层
 * @auther: 93231
 * @date: 2019/11/3 23:14
 * @version: 1.0
 */
@RestController
@RequestMapping("article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;
    @Autowired
    private UserService userService;

    /**
     * 获取首页的所有数据
     * @param request
     * @return
     */
    @RequestMapping("mainpage")
    public ModelAndView getMainPageData(@RequestParam(value="pn",defaultValue="1")Integer pn, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user_mainpage");
        mv.addObject("pageInfo", articleService.getUserAndArticle(pn));
        if(ValidateUtil.isSessionExist(request, Constant.USER)) {
            mv.addObject("userInfo", userService.getUserInfo(request));
        }
        return mv;
    }
}
