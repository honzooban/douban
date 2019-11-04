package com.douban.service.impl;

import com.douban.commons.Constant;
import com.douban.dao.ArticleDao;
import com.douban.domain.UserAndArticle;
import com.douban.service.ArticleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleDao articleDao;

    @Override
    public PageInfo<UserAndArticle> getUserAndArticle(Integer pn) {
        PageHelper.startPage(pn, Constant.PAGE_SIZE, true);
        List<UserAndArticle> userAndArticleList = articleDao.getUserAndArticle();
        PageInfo<UserAndArticle> pageInfo = new PageInfo<>(userAndArticleList);
        return pageInfo;
    }

}
