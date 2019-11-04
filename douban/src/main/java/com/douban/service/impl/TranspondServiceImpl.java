package com.douban.service.impl;

import com.douban.commons.Constant;
import com.douban.dao.TranspondDao;
import com.douban.domain.Result;
import com.douban.domain.Transpond;
import com.douban.domain.User;
import com.douban.service.TranspondService;
import com.douban.util.ValidateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;

@Service
public class TranspondServiceImpl implements TranspondService {

    @Autowired
    private TranspondDao transpondDao;

    @Override
    public Result transpondArticle(Transpond transpond, HttpServletRequest request) {
        if(!ValidateUtil.isSessionExist(request, Constant.USER)){
            return new Result(404,"你暂未登录，请前往登录",null);
        }
        User user = (User) request.getSession().getAttribute(Constant.USER);
        transpond.setUserId(user.getId());
        transpond.setTime(new Timestamp(System.currentTimeMillis()));
        return transpondDao.insertTranspond(transpond) == 1 ? new Result(200,"转发成功",null) :
                new Result(400,"转发失败，请重试",null);

    }
}
