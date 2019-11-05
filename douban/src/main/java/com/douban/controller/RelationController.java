package com.douban.controller;

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

    @RequestMapping("getPrivateletter")
    public ModelAndView getPrivateletter(){
        return null;
    }
}
