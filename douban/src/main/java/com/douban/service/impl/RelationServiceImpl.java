package com.douban.service.impl;

import com.douban.commons.Constant;
import com.douban.dao.RelationDao;
import com.douban.domain.Relation;
import com.douban.domain.Result;
import com.douban.domain.User;
import com.douban.service.RelationService;
import com.douban.util.ValidateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class RelationServiceImpl implements RelationService {

    @Autowired
    private RelationDao relationDao;

    @Override
    public Relation getRelation(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute(Constant.USER);
        return relationDao.getRelation(user.getId(), Integer.parseInt(request.getParameter(Constant.ID)));
    }

    @Override
    public Result updateRelationType(Relation relation) {
        return ValidateUtil.isEqual(relationDao.updateRelationType(relation),Constant.TWO_LINE) ?
                new Result(200,"添加好友分组成功",null) :
                new Result(400,"修改好友分组失败，请重试",null);
    }

    @Override
    public Result addFriend(Relation relation) {
        return ValidateUtil.isEqual(relationDao.insertRelationStatus(relation),Constant.ONE_LINE) ?
                new Result(200,"添加好友成功",null) :
                new Result(400,"添加好友失败，请重试", null);
    }
}
