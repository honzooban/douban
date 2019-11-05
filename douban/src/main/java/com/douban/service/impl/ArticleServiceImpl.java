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

import java.io.File;
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
        return articleDao.getArticle(id);
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
        int count = 0;
        for(Picture picture : pictures){
            new File(Constant.URL_PREFIX + picture.getUrl()).delete();
            count += pictureDao.deletePicture(picture);
        }
        if(!ValidateUtil.isProcessSuccess(pictures, count)){
            return new Result(400,"删除文章失败，请重试",null);
        }
        return articleDao.deleteArticle(article) == 1 ? new Result(200,"删除成功",null) :
                new Result(400,"删除文章失败，请重试",null);

    }

}
