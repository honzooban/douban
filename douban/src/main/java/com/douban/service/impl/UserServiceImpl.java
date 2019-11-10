package com.douban.service.impl;

import com.douban.commons.Constant;
import com.douban.dao.UserDao;
import com.douban.domain.Result;
import com.douban.domain.User;
import com.douban.service.UserService;
import com.douban.util.ValidateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 *
 * @auther: 93231
 * @date: 2019/11/3 23:20
 * @version: 1.0
 */
@Service
public class UserServiceImpl implements UserService {

    private Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserDao userDao;

    @Override
    public Result login(User user, HttpServletRequest request) {
        user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
        User result = userDao.login(user);
        if(result == null){
            return new Result(400,"用户名或密码有误，请重新输入",null);
        }
        if(result.getBanTime() == null){
            request.getSession().setAttribute(Constant.USER, result);
            return new Result(200,"登录成功，欢迎你的使用",null);
        }else{
            return new Result(403,"你的账号已被封禁至" + result.getBanTime() + "，请联系管理员", null);
        }
    }

    @Override
    public Result checkPhoneCode(Map<String, String> msg, HttpServletRequest request) {
        if(request.getSession().getAttribute(Constant.CODE).equals(msg.get(Constant.CODE))){
            request.getSession().setAttribute(Constant.PHONE, msg.get(Constant.PHONE));
            return new Result(200,"验证码正确",null);
        }else {
            return new Result(400, "验证码有误，请重新输入", null);
        }
    }

    @Override
    public Result updatePassword(Map<String, String> user, HttpServletRequest request) {
        if(!ValidateUtil.isSessionExist(request, Constant.PHONE)){
            return new Result(404,"找不到用户信息，请重新试试",null);
        }
        String password = DigestUtils.md5DigestAsHex(user.get(Constant.PASSWORD).getBytes());
        return userDao.updatePassword((String) request.getSession().getAttribute(Constant.PHONE), password) == 1?
                new Result(200,"修改密码成功",null) :
                new Result(400,"修改密码失败，请稍后重试",null);
    }

    @Override
    public Result register(User user) {
        if(userDao.selectUserByPhone(user.getPhone()) == null){
            user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
            return userDao.register(user) == 1 ? new Result(200,"注册成功",null) :
                    new Result(400,"注册失败，请重试",null);
        }else{
            return new Result(500, "该手机号码已被注册，请更换你的手机号码",null);
        }

    }

    @Override
    public User getUserInfo(HttpServletRequest request, Integer id) {
        if(ValidateUtil.notNull(id)) {
            return userDao.selectUserById(id);
        }
        User user = (User) request.getSession().getAttribute(Constant.USER);
        return userDao.selectUserByPhone(user.getPhone());
    }

    @Override
    public List<User> getFriendsById(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute(Constant.USER);
        return userDao.getFriendsById(user.getId());
    }

    @Override
    public Result updateUserInfo(MultipartFile file, HttpServletRequest request) {
        User user = new User(Integer.parseInt(request.getParameter(Constant.ID)),
                request.getParameter(Constant.GENDER), request.getParameter(Constant.SIGNATURE));
        if(ValidateUtil.isUploadAvatarSuccess(user, file, Constant.AVATAR)) {
            return userDao.updateUserInfo(user) == 1 ? new Result(200, "修改成功", null) :
                    new Result(400, "修改失败，请重试", null);
        }else{
            return new Result(400,"头像上传失败，请重试",null);
        }
    }

    @Override
    public Result getPhoneCode(Map<String, Object> user, HttpServletRequest request) {
        User result = userDao.selectUserByPhone((String) user.get(Constant.PHONE));
        if(result == null){
            return new Result(404,"该手机号码尚未注册，请重新输入",null);
        }
        String code = /*PhoneUtil.getRandomNum(Constant.CODE_LENGTH);*/ "123456";
        if(/*PhoneUtil.sendPhoneCode((String) user.get("phone"), code)*/true){
            request.getSession().setAttribute("code", code);
            return new Result(200,"验证码发送成功",null);
        }else{
            return new Result(400,"验证码发送失败，请稍后再试",null);
        }
    }
}
