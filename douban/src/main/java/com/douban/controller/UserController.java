package com.douban.controller;

import com.douban.domain.Result;
import com.douban.domain.User;
import com.douban.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
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

    /**
     * 用户登录
     * @param user 用户信息
     * @param request
     * @return 登录结果
     */
    @RequestMapping("login")
    public Result login(@RequestBody User user, HttpServletRequest request){
        return userService.login(user, request);
    }

    /**
     * 发送验证码
     * @param user 用户信息
     * @return 发送结果
     */
    @RequestMapping("sendCode")
    public Result getPhoneCode(@RequestBody Map<String, Object> user, HttpServletRequest request){
        return userService.getPhoneCode(user, request);
    }

    /**
     * 验证验证码
     * @param msg 手机号码和验证码
     * @return 验证结果
     */
    @RequestMapping("checkCode")
    public Result checkPhoneCode(@RequestBody Map<String, String> msg, HttpServletRequest request){
        return userService.checkPhoneCode(msg, request);
    }

    /**
     * 修改密码
     * @return
     */
    @RequestMapping("updatePassword")
    public Result updatePassword(@RequestBody Map<String, String> user, HttpServletRequest request){
        return userService.updatePassword(user, request);
    }

    /**
     * 用户注册
     * @param user 用户信息
     * @return 注册结果
     */
    @RequestMapping("register")
    public Result register(@RequestBody User user){
        return userService.register(user);
    }

    @RequestMapping("/homepage")
    public ModelAndView getHomepageData(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user_homepage");
        //mv.add
        return mv;
    }
}
