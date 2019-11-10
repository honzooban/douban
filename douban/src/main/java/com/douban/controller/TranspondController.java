package com.douban.controller;

import com.douban.commons.Constant;
import com.douban.domain.Result;
import com.douban.domain.Transpond;
import com.douban.service.TranspondService;
import com.douban.service.UserService;
import com.douban.util.ValidateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * 转发控制层
 * @author: 93231
 * @date: 2019/11/5 0:39
 * @version: 1.0
 */
@RestController
@RequestMapping("transpond")
public class TranspondController {

    @Autowired
    private TranspondService transpondService;

    @Autowired
    private UserService userService;

    /**
     * 转发文章
     * @param transpond 转发内容
     * @param request
     * @return 转发结果
     */
    @RequestMapping("transpondArticle")
    public Result transpondArticle(@RequestBody Transpond transpond, HttpServletRequest request){
        return transpondService.transpondArticle(transpond, request);
    }

    /**
     * 获取首页转发页面的所有数据
     * @param pn 当前页数
     * @param request
     * @return 数据和页面
     */
    @RequestMapping("getTransponds")
    public ModelAndView getTranspond(@RequestParam(value="pn",defaultValue="1")Integer pn, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user_mainpage");
        mv.addObject("transpond", transpondService.getTranspond(pn));
        if(ValidateUtil.isSessionExist(request, Constant.USER)) {
            mv.addObject("userInfo", userService.getUserInfo(request, null));
        }
        return mv;
    }

    /**
     * 删除转发
     * @param transpond 转发内容
     * @param request
     * @return 删除结果
     */
    @RequestMapping("deleteTranspond")
    public Result deleteTranspond(@RequestBody Transpond transpond, HttpServletRequest request){
        return transpondService.deleteTranspond(transpond, request);
    }
}
