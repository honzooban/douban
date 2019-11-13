package com.douban.controller;

import com.douban.domain.Relation;
import com.douban.domain.Result;
import com.douban.service.RelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * 好友互动控制层
 * @author: 93231
 * @date: 2019/11/5 10:21
 * @version: 1.0
 */
@RestController
@RequestMapping("relation")
public class RelationController {

    @Autowired
    private RelationService relationService;

    @RequestMapping("getPrivateletter")
    public ModelAndView getPrivateletter(){
        return null;
    }

    /**
     * 修改好友分组
     * @param relation 用户关系数据
     * @return 修改结果
     */
    @RequestMapping("updateRelation")
    public Result updateRelation(@RequestBody Relation relation){
        return relationService.updateRelationType(relation);
    }

    /**
     * 添加好友
     * @param relation 用户关系数据
     * @return 添加结果
     */
    @RequestMapping("addFriend")
    public Result addFriend(@RequestBody Relation relation){
        return relationService.addFriend(relation);
    }

    /**
     * 获取我的好友页面及数据
     * @param pn 页数
     * @param request
     * @return 我的好友页面及数据
     */
    @RequestMapping("getMyFriends")
    public ModelAndView getMyFriends(@RequestParam(value = "pn",defaultValue = "1") Integer pn, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user_myfriend");
        mv.addObject("relations",relationService.getAllRelation(request));
        mv.addObject("friends",relationService.getMyFriends(pn, request));
        return mv;
    }

    /**
     * 获取黑名单页面及数据
     * @param request
     * @return
     */
    @RequestMapping("getBlackList")
    public ModelAndView getBlackList(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user_blacklist");
        mv.addObject("blackList",relationService.getBlackList(request));
        return mv;
    }

    /**
     * 删除好友
     * @param request
     * @return 删除结果
     */
    @RequestMapping("deleteFriend")
    public Result deleteFriend(HttpServletRequest request){
        return relationService.deleteFriend(request);
    }

    /**
     * 拉黑好友
     * @param request
     * @return 拉黑结果
     */
    @RequestMapping("blackListFriend")
    public Result blackListFriend(HttpServletRequest request){
        return relationService.blackListFriend(request);
    }

}
