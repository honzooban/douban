package com.douban.service.impl;

import com.douban.commons.Constant;
import com.douban.dao.RelationDao;
import com.douban.domain.Relation;
import com.douban.domain.Result;
import com.douban.domain.User;
import com.douban.domain.UserAndRelation;
import com.douban.service.RelationService;
import com.douban.util.ValidateUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

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

    @Override
    public PageInfo<UserAndRelation> getMyFriends(Integer pn, HttpServletRequest request) {
        PageHelper.startPage(pn, Constant.PAGE_SIZE, true);
        User user = (User) request.getSession().getAttribute(Constant.USER);
        List<UserAndRelation> list = relationDao.selectAllFriend(user.getId());
        PageInfo<UserAndRelation> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public List<Relation> getAllRelation(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute(Constant.USER);
        return relationDao.selectAllRelation(user.getId());
    }

    @Override
    public List<User> getBlackList(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute(Constant.USER);
        return relationDao.selectAllBlackList(user.getId());
    }

    @Override
    public Result deleteFriend(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter(Constant.ID));
        String[] array = request.getParameterValues(Constant.BYID);
        int[] byId = new int[array.length];
        for(int i = 0; i < array.length; i++){
            byId[i] = Integer.parseInt(array[i]);
        }
        int count = 0;
        for(int i = 0; i < array.length; i++){
            count += relationDao.updateRelationStatus(id, byId[i], Constant.NOT_FRIEND);
        }
        return ValidateUtil.isEqual(count, array.length) ? new Result(200,"删除好友成功",null) :
                new Result(400,"删除好友失败，请重试",null);

    }

    @Override
    public Result blackListFriend(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter(Constant.ID));
        String[] array = request.getParameterValues(Constant.BYID);
        int[] byId = new int[array.length];
        for(int i = 0; i < array.length; i++){
            byId[i] = Integer.parseInt(array[i]);
        }
        int count = 0;
        for(int i = 0; i < array.length; i++){
            count += relationDao.updateRelationStatus(id, byId[i],Constant.BLACK_LIST);
        }
        return ValidateUtil.isEqual(count, array.length) ? new Result(200,"拉黑好友成功",null) :
                new Result(400,"拉黑好友失败，请重试",null);
    }
}
