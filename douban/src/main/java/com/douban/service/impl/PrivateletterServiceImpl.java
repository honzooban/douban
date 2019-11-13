package com.douban.service.impl;

import com.douban.commons.Constant;
import com.douban.dao.PrivateletterDao;
import com.douban.dao.UserDao;
import com.douban.domain.Privateletter;
import com.douban.domain.Result;
import com.douban.domain.User;
import com.douban.domain.UserAndPrivateletter;
import com.douban.service.PrivateletterService;
import com.douban.util.ValidateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Service
public class PrivateletterServiceImpl implements PrivateletterService {

    @Autowired
    private PrivateletterDao privateletterDao;

    @Autowired
    private UserDao userDao;

    @Override
    public List<UserAndPrivateletter> getPrivateletterUser(HttpServletRequest request) {
        User self = (User) request.getSession().getAttribute(Constant.USER);
        List<User> users = userDao.selectPrivateletterUser(self);
        List<UserAndPrivateletter> list = new ArrayList<>();
        if(ValidateUtil.notNull(users)){
            for(User user : users){
                list.add(new UserAndPrivateletter(user, privateletterDao.selectLastPrivateletter(self.getId(), user.getId())));
            }
        }
        return list;
    }

    @Override
    public List<UserAndPrivateletter> getPrivateletters(HttpServletRequest request) {
        return privateletterDao.selectAllPrivateletter(Integer.parseInt(request.getParameter(Constant.ID)),
                Integer.parseInt(request.getParameter(Constant.BYID)));
    }

    @Override
    public Result sendPrivateletter(Privateletter privateletter) {
        privateletter.setTime(new Timestamp(System.currentTimeMillis()));
        return ValidateUtil.isEqual(privateletterDao.insertPrivateletter(privateletter),Constant.ONE_LINE) ?
                new Result(200,"发送成功",null) :
                new Result(400,"发送失败",null);
    }
}
