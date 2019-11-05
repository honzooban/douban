package com.douban.service.impl;

import com.douban.commons.Constant;
import com.douban.dao.CollectionDao;
import com.douban.domain.Collection;
import com.douban.domain.Result;
import com.douban.domain.User;
import com.douban.service.CollectionService;
import com.douban.util.TimeUtil;
import com.douban.util.ValidateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class CollectionServiceImpl implements CollectionService {

    @Autowired
    private CollectionDao collectionDao;

    @Override
    public Result collectArticle(Collection collection, HttpServletRequest request) {
        if(!ValidateUtil.isSessionExist(request, Constant.USER)){
            return new Result(404,"你暂未登录，请前往登录",null);
        }
        User user = (User) request.getSession().getAttribute(Constant.USER);
        collection.setUserId(user.getId());
        if(collectionDao.selectCollectionById(collection) != null){
            return new Result(400,"请勿重复收藏",null);
        }
        collection.setTime(TimeUtil.createTimestamp());
        collection.setUserId(user.getId());
        return collectionDao.insertCollection(collection) == 1? new Result(200,"收藏成功", null) :
                new Result(400,"收藏失败，请重试",null);
    }
}
