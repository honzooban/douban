package com.douban.controller;

import com.douban.commons.Constant;
import com.douban.domain.Article;
import com.douban.domain.Result;
import com.douban.service.ArticleService;
import com.douban.service.UserService;
import com.douban.util.ValidateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
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
     * @return 数据和页面
     */
    @RequestMapping("getArticles")
    public ModelAndView getArticles(@RequestParam(value="pn",defaultValue="1")Integer pn, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user_mainpage");
        mv.addObject("article", articleService.getArticles(pn));
        if(ValidateUtil.isSessionExist(request, Constant.USER)) {
            mv.addObject("userInfo", userService.getUserInfo(request, null));
        }
        return mv;
    }

    /**
     * 获取文章页面及所有数据
     * @param request 文章信息
     * @return 文章页面及数据
     */
    @RequestMapping("getArticle")
    public ModelAndView getArticle(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user_article");
        int id = Integer.parseInt(request.getParameter(Constant.ID));
        mv.addObject("article",articleService.getArticle(id));
        mv.addObject("comments",articleService.getComments(id));
        return mv;
    }

    /**
     * 删除文章
     * @param article 文章信息
     * @return 删除结果
     */
    @RequestMapping("deleteArticle")
    public Result deleteArticle(@RequestBody Article article){
        return articleService.deleteArticle(article);
    }

    /**
     * 跳转文章编辑页面
     * @return
     */
    @RequestMapping("publishArticlePage")
    public ModelAndView getPublishArticlePage(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user_publish_article");
        return mv;
    }

    /**
     * 编辑文章
     * @param request
     * @return 编辑文章页面及数据
     */
    @RequestMapping("editArticle")
    public ModelAndView editArticle(HttpServletRequest request){
        Article article = new Article(Integer.parseInt(request.getParameter(Constant.ID)),
                request.getParameter(Constant.TITLE), request.getParameter(Constant.CONTENT));
        ModelAndView mv = new ModelAndView();
        mv.addObject("article",article);
        mv.setViewName("user_publish_article");
        return mv;
    }

    /**
     * 发表文章
     * @param images 图片数组
     * @param request
     * @return 发表结果
     */
    @RequestMapping("publishArticle")
    public Result publishArticle(MultipartFile[] images,HttpServletRequest request){
        return articleService.publishArticle(images, request);
    }
}
