package com.douban.service;

import com.douban.domain.Result;
import com.douban.domain.User;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public interface UserService {

    /**
     * 用户登录
     * @param user 用户登录信息
     * @param request
     * @return 登录结果
     */
    Result login(User user, HttpServletRequest request);

    /**
     * 发送验证码
     * @param user 用户信息
     * @param request
     * @return
     */
    Result getPhoneCode(Map<String, Object> user, HttpServletRequest request);

    /**
     * 验证验证码
     * @param msg 手机号码和验证码
     * @param request
     * @return
     */
    Result checkPhoneCode(Map<String, String> msg, HttpServletRequest request);

    /**
     * 修改密码
     * @param user 用户信息
     * @param request
     * @return 修改结果
     */
    Result updatePassword(Map<String, String> user, HttpServletRequest request);

    /**
     * 用户注册
     * @param user 用户信息
     * @return 注册结果
     */
    Result register(User user);
}
