package com.douban.service.impl;

import com.douban.commons.Constant;
import com.douban.dao.ArticleDao;
import com.douban.dao.CommentDao;
import com.douban.dao.PictureDao;
import com.douban.domain.*;
import com.douban.service.ArticleService;
import com.douban.util.ValidateUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.sql.Timestamp;
import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleDao articleDao;
    @Autowired
    private PictureDao pictureDao;
    @Autowired
    private CommentDao commentDao;

    @Override
    public PageInfo<UserAndArticle> getArticles(Integer pn) {
        PageHelper.startPage(pn, Constant.PAGE_SIZE, true);
        List<UserAndArticle> userAndArticleList = articleDao.getArticles();
        PageInfo<UserAndArticle> pageInfo = new PageInfo<>(userAndArticleList);
        return pageInfo;
    }

    @Override
    public UserAndArticle getArticle(int id) {
        UserAndArticle userAndArticle = articleDao.getArticle(id);
        userAndArticle.getArticle().setPictures(pictureDao.getPictures(id));
        return userAndArticle;
    }

    @Override
    public List<Picture> getPictures(int id) {
        return pictureDao.getPictures(id);
    }

    @Override
    public List<UserAndComment> getComments(int id) {
        return commentDao.getComments(id);
    }

    @Override
    public Result deleteArticle(Article article) {
        List<Picture> pictures = pictureDao.getPictures(article.getId());
        if(ValidateUtil.notNull(pictures)) {
            int count = 0;
            for (Picture picture : pictures) {
                new File(Constant.URL_PREFIX + picture.getUrl()).delete();
                count += pictureDao.deletePicture(picture);
            }
            if (ValidateUtil.isEqual(count, pictures.size())) {
                return new Result(400, "删除文章失败，请重试", null);
            }
        }
        return ValidateUtil.isEqual(articleDao.deleteArticle(article), Constant.ONE_LINE) ? new Result(200,"删除成功",null) :
                new Result(400,"删除文章失败，请重试",null);

    }

    @Override
    public Result publishArticle(MultipartFile[] images, HttpServletRequest request) {
        if(!ValidateUtil.isSessionExist(request, Constant.USER)){
            return new Result(404,"你暂未登录，请前往登录",null);
        }
        if(ValidateUtil.notNull(request.getParameter(Constant.ID))){
            //如果此文章存在，则删除该文章并重新发表文章
            this.deleteArticle(new Article(Integer.parseInt(request.getParameter(Constant.ID))));
        }
        User user = (User) request.getSession().getAttribute(Constant.USER);
        //将请求中的信息封装到Article对象中
        Article article = new Article(request.getParameter(Constant.TITLE),
                request.getParameter(Constant.CONTENT), new Timestamp(System.currentTimeMillis()),
                request.getParameter(Constant.TYPE), user.getId());
        if(ValidateUtil.isEqual(articleDao.publishArticle(article), Constant.ONE_LINE)){
            return ValidateUtil.isUploadPicturesSuccess(article, pictureDao, images, Constant.ARTICLE_PICTURE) ?
                    new Result(200,"发表文章成功",null):
                    new Result(400,"上传图片失败，请重试",null);
        }
        return new Result(400,"发表文章失败，请重试",null);
    }

    @Override
    public List<Article> getMyArticle(HttpServletRequest request) {
        return articleDao.getMyArticle(Integer.parseInt(request.getParameter(Constant.ID)));
    }

    @Override
    public PageInfo<Article> searchArticle(Integer pn, HttpServletRequest request) {
        PageHelper.startPage(pn, Constant.PAGE_SIZE, true);
        List<Article> articles = articleDao.fuzzySearchArticle(request.getParameter(Constant.MESSAGE));
        PageInfo<Article> pageInfo = new PageInfo<>(articles);
        return pageInfo;
    }

    @Override
    public Result topArticle(Article article) {
        article.setStatus(Constant.TOP_STATUS);
        return ValidateUtil.isEqual(articleDao.updateArticleStatus(article), Constant.ONE_LINE) ?
                new Result(200,"置顶文章成功", null) :
                new Result(400,"置顶文章失败，请重试", null);
    }

    @Override
    public Result cancelTopArticle(Article article) {
        article.setStatus(Constant.NOT_TOP_STATUS);
        return ValidateUtil.isEqual(articleDao.updateArticleStatus(article), Constant.ONE_LINE) ?
                new Result(200,"取消置顶文章成功", null) :
                new Result(400,"取消置顶文章失败，请重试", null);
    }
}
