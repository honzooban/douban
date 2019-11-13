package com.douban.controller;

import com.douban.domain.Privateletter;
import com.douban.domain.Result;
import com.douban.service.PrivateletterService;
import com.douban.service.RelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author: 93231
 * @date: 2019/11/10 11:05
 * @version: 1.0
 */
@RestController
@RequestMapping("privateletter")
public class PrivateletterController {

    @Autowired
    private RelationService relationService;
    @Autowired
    private PrivateletterService privateletterService;

    /**
     * 获取我的豆邮页面及数据
     * @param request
     * @return 私信页面及数据
     */
    @RequestMapping("getPrivateletter")
    public ModelAndView getPrivateletter(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user_mydoumail");
        mv.addObject("userAndPrivateletter",privateletterService.getPrivateletterUser(request));
        return mv;
    }

    /**
     * 获取用户间豆邮交流页面及数据
     * @param request
     * @return 用户间豆邮交流页面及数据
     */
    @RequestMapping("getUserPrivateletter")
    public ModelAndView getUserPrivateletter(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user_doumail");
        mv.addObject("privateletter",privateletterService.getPrivateletters(request));
        mv.addObject("relation",relationService.getRelation(request));
        return mv;
    }

    /**
     * 发送豆邮
     * @param privateletter 豆邮信息
     * @return 发送结果
     */
    @RequestMapping("sendPrivateletter")
    public Result sendPrivateletter(@RequestBody Privateletter privateletter){
        return privateletterService.sendPrivateletter(privateletter);
    }
}
