package com.douban.service;

import com.douban.domain.Privateletter;
import com.douban.domain.Result;
import com.douban.domain.UserAndPrivateletter;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface PrivateletterService {

    /**
     * 获取私信页面数据
     * @param request
     * @return 私信页面数据
     */
    List<UserAndPrivateletter> getPrivateletterUser(HttpServletRequest request);

    /**
     * 获取豆邮页面数据
     * @param request
     * @return 豆邮页面数据
     */
    List<UserAndPrivateletter> getPrivateletters(HttpServletRequest request);

    /**
     * 发送豆邮
     * @param privateletter 豆邮信息
     * @return 发送结果
     */
    Result sendPrivateletter(Privateletter privateletter);
}
