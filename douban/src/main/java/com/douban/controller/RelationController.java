package com.douban.controller;

import com.douban.domain.Relation;
import com.douban.domain.Result;
import com.douban.service.RelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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


}
