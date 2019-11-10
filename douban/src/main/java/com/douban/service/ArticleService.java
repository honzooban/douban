package com.douban.service;

import com.douban.domain.*;
import com.github.pagehelper.PageInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 文章业务层
 * @author: 93231
 * @date: 2019/11/5 0:48
 * @version: 1.0
 */
public interface ArticleService {

    /**
     * 获取首页文章的数据
     * @param pn 当前页数
     * @return 封装首页文章数据的实体类
     */
    PageInfo<UserAndArticle> getArticles(Integer pn);

    /**
     * 获取文章页面的所有数据
     * @param id 文章id
     * @return 文章页面的所有数据
     */
    UserAndArticle getArticle(int id);

    /**
     * 获取文章附带图片的所有url
     * @param id 文章id
     * @return 所有图片的url集合
     */
    List<Picture> getPictures(int id);

    /**
     * 获取文章的所有评论
     * @param id 文章id
     * @return 文章所有评论集合
     */
    List<UserAndComment> getComments(int id);

    /**
     * 删除文章
     * @param article 文章信息
     * @return 删除结果
     */
    Result deleteArticle(Article article);

    /**
     * 发表文章
     * @param images 文章图片
     * @param request
     * @return 发表结果
     */
    Result publishArticle(MultipartFile[] images, HttpServletRequest request);

    /**
     * 获取我的文章
     * @param request 用户id
     * @return 文章数据
     */
    List<Article> getMyArticle(HttpServletRequest request);
}
