package com.douban.service.impl;

import com.douban.commons.Constant;
import com.douban.dao.ArticleDao;
import com.douban.dao.TranspondDao;
import com.douban.domain.Result;
import com.douban.domain.Transpond;
import com.douban.domain.User;
import com.douban.domain.UserAndArticle;
import com.douban.service.TranspondService;
import com.douban.util.TimeUtil;
import com.douban.util.ValidateUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class TranspondServiceImpl implements TranspondService {

    @Autowired
    private TranspondDao transpondDao;

    @Autowired
    private ArticleDao articleDao;

    @Override
    public Result transpondArticle(Transpond transpond, HttpServletRequest request) {
        if(!ValidateUtil.isSessionExist(request, Constant.USER)){
            return new Result(404,"你暂未登录，请前往登录",null);
        }
        User user = (User) request.getSession().getAttribute(Constant.USER);
        transpond.setUserId(user.getId());
        transpond.setTime(TimeUtil.createTimestamp());
        return transpondDao.insertTranspond(transpond) == 1 ? new Result(200,"转发成功",null) :
                new Result(400,"转发失败，请重试",null);

    }

    @Override
    public PageInfo<UserAndArticle> getTranspond(Integer pn) {
        PageHelper.startPage(pn, Constant.PAGE_SIZE, true);
        List<UserAndArticle> userAndArticleList = transpondDao.getTranspond();
        for(UserAndArticle userAndArticle : userAndArticleList){
            UserAndArticle var = articleDao.getTranspondArticle(userAndArticle.getTranspond().getId());
            userAndArticle.setArticle(var.getArticle());
            userAndArticle.setArticleUser(var.getUser());
        }
        PageInfo<UserAndArticle> pageInfo = new PageInfo<>(userAndArticleList);
        return pageInfo;
    }

    @Override
    public Result deleteTranspond(Transpond transpond, HttpServletRequest request) {
        if(!ValidateUtil.isSessionExist(request, Constant.USER)){
            return new Result(404,"你暂未登录，请前往登录",null);
        }
        return transpondDao.deleteTranspond(transpond) == 1? new Result(200,"删除成功",null) :
                new Result(400,"删除失败，请重试",null);
    }
}
