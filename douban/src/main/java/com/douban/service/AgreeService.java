package com.douban.service;

import com.douban.domain.Agree;
import com.douban.domain.Result;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 点赞业务层
 * @author: 93231
 * @date: 2019/11/5 0:48
 * @version: 1.0
 */
public interface AgreeService {

    /**
     * 点赞操作
     * @param agree 点赞信息
     * @param request
     * @return 点赞结果
     */
    Result agree(@RequestBody Agree agree, HttpServletRequest request);
}
