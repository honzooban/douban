package com.douban.service.impl;

import com.douban.commons.Constant;
import com.douban.dao.AgreeDao;
import com.douban.domain.Agree;
import com.douban.domain.Result;
import com.douban.domain.User;
import com.douban.service.AgreeService;
import com.douban.util.TimeUtil;
import com.douban.util.ValidateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Service
public class AgreeServiceImpl implements AgreeService {

    @Autowired
    private AgreeDao agreeDao;

    @Override
    public Result agree(Agree agree, HttpServletRequest request) {
        if(!ValidateUtil.isSessionExist(request, Constant.USER)){
            return new Result(404,"你暂未登录，请前往登录",null);
        }
        User user = (User) request.getSession().getAttribute(Constant.USER);
        Map<String, Object> map = agree.getById();
        if(agreeDao.selectAgreeById(user.getId(),(int) map.get(Constant.ID), (String) map.get(Constant.TYPE)) != null){
            return new Result(400,"请勿重复点赞",null);
        }
        agree.setUserId(user.getId());
        agree.setTime(TimeUtil.createTimestamp());
        return agreeDao.insertAgreeRecord(agree) == 1? new Result(200,"点赞成功",null):
                new Result(400,"点赞失败，请重试",null);
    }
}
