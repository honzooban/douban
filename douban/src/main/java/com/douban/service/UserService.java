package com.douban.service;

import com.douban.domain.Result;
import com.douban.domain.User;
import com.github.pagehelper.PageInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 用户业务层
 * @author: 93231
 * @date: 2019/11/5 0:48
 * @version: 1.0
 */
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

    /**
     * 获取用户的个人信息
     * @param request
     * @param id 用户id
     * @return 用户信息
     */
    User getUserInfo(HttpServletRequest request, Integer id);

    /**
     * 获取用户好友名单
     * @param request
     * @return
     */
    List<User> getFriendsById(HttpServletRequest request);

    /**
     * 修改用户个人资料
     * @param file 用户头像
     * @param request
     * @return 修改结果
     */
    Result updateUserInfo(MultipartFile file, HttpServletRequest request);

    /**
     * 模糊查找相关用户
     * @param pn 页数
     * @param request
     * @return 用户信息集合
     */
    PageInfo<User> searchUser(Integer pn, HttpServletRequest request);

    /**
     * 封禁用户
     * @param request
     * @return 封禁结果
     */
    Result banUser(HttpServletRequest request);

    /**
     * 解封用户
     * @param user 用户信息
     * @return 解封结果
     */
    Result cancelBanUser(User user);
}
