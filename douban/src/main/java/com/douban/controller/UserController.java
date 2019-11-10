package com.douban.controller;

import com.douban.commons.Constant;
import com.douban.domain.Result;
import com.douban.domain.User;
import com.douban.service.ArticleService;
import com.douban.service.CollectionService;
import com.douban.service.RelationService;
import com.douban.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @author 康俊彬
 */
@RestController
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private CollectionService collectionService;
    @Autowired
    private RelationService relationService;

    /**
     * 用户登录
     * @param user 用户信息
     * @param request
     * @return 登录结果
     */
    @RequestMapping("login")
    public Result login(@RequestBody User user, HttpServletRequest request) {
        return userService.login(user, request);
    }

    /**
     * 发送验证码
     *
     * @param user 用户信息
     * @return 发送结果
     */
    @RequestMapping("sendCode")
    public Result getPhoneCode(@RequestBody Map<String, Object> user, HttpServletRequest request) {
        return userService.getPhoneCode(user, request);
    }

    /**
     * 验证验证码
     *
     * @param msg 手机号码和验证码
     * @return 验证结果
     */
    @RequestMapping("checkCode")
    public Result checkPhoneCode(@RequestBody Map<String, String> msg, HttpServletRequest request) {
        return userService.checkPhoneCode(msg, request);
    }

    /**
     * 修改密码
     *
     * @return
     */
    @RequestMapping("updatePassword")
    public Result updatePassword(@RequestBody Map<String, String> user, HttpServletRequest request) {
        return userService.updatePassword(user, request);
    }

    /**
     * 用户注册
     *
     * @param user 用户信息
     * @return 注册结果
     */
    @RequestMapping("register")
    public Result register(@RequestBody User user) {
        return userService.register(user);
    }

    /**
     * 获取用户个人中心页面的数据
     * @param request
     * @return
     */
    @RequestMapping("homepage")
    public ModelAndView getHomepageData(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user_homepage");
        mv.addObject("userInfo", userService.getUserInfo(request, null));
        mv.addObject("friends", userService.getFriendsById(request));
        return mv;
    }

    /**
     * 获取个人信息页面的数据
     * @param request
     * @return
     */
    @RequestMapping("updateInfo")
    public ModelAndView getUpdateInfoData(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user_updateinfo");
        mv.addObject("userInfo",userService.getUserInfo(request, null));
        return mv;
    }

    /**
     * 修改用户个人资料
     * @param file 头像
     * @param request
     * @return 修改结果
     */
    @RequestMapping("updateUser")
    public Result updateUserInfo(MultipartFile file, HttpServletRequest request){
        return userService.updateUserInfo(file, request);
    }

    /**
     * 获取用户主页及数据
     * @return
     */
    @RequestMapping("getUser")
    public ModelAndView getUser(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user_userpage");
        mv.addObject("user",userService.getUserInfo(null, Integer.parseInt(request.getParameter(Constant.ID))));
        mv.addObject("relation",relationService.getRelation(request));
        mv.addObject("myArticle",articleService.getMyArticle(request));
        mv.addObject("myCollection",collectionService.getMyCollection(request));
        return mv;
    }
}
