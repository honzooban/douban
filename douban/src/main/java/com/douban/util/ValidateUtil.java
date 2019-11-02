package com.douban.util;

import com.douban.commons.Constant;

import javax.servlet.http.HttpServletRequest;

/**
 * @author 93231
 */
public class ValidateUtil {

    public static boolean isPhoneAlive(HttpServletRequest request){
        return request.getSession().getAttribute(Constant.PHONE) != null;
    }
}
