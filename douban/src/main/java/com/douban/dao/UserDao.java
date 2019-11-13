package com.douban.dao;

import com.douban.commons.Constant;
import com.douban.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {

    /**
     * 用户登录
     * @param user 用户信息
     * @return 登录结果
     */
    User login(User user);

    /**
     * 通过用户手机号码来寻找用户信息
     * @param phone 手机号码
     * @return 用户信息
     */
    User selectUserByPhone(String phone);

    /**
     * 修改密码
     * @param phone 手机号码
     * @param password 密码
     * @return 修改结果
     */
    int updatePassword(@Param(Constant.PHONE) String phone, @Param(Constant.PASSWORD) String password);

    /**
     * 用户注册
     * @param user 用户信息
     * @return 注册结果
     */
    int register(User user);

    /**
     * 获取用户好友名单
     * @param id 用户id
     * @return
     */
    List<User> getFriendsById(int id);

    /**
     * 修改用户个人资料
     * @param user 用户信息
     * @return 修改结果
     */
    int updateUserInfo(User user);

    /**
     * 根据用户id来获取用户信息
     * @param id 用户id
     * @return 用户信息
     */
    User selectUserById(int id);

    /**
     * 获取私信页面的用户信息
     * @param user 用户信息
     * @return 用户信息
     */
    List<User> selectPrivateletterUser(User user);

    /**
     * 模糊查找相关用户
     * @param msg 查找内容
     * @return 用户信息
     */
    List<User> fuzzySearchUser(String msg);
}