package com.douban.service;

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
}
