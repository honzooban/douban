package com.douban.util;

import com.douban.domain.User;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 * @author 93231
 */
public class ValidateUtil {

    public static boolean isSessionExist(HttpServletRequest request, String msg){
        return request.getSession().getAttribute(msg) != null;
    }

    public static boolean isUploadAvatarSuccess(User user, MultipartFile file, String type){
        String url = UploadFileUtil.uploadFile(file, type);
        if(url != null){
            user.setAvatar(url);
            return true;
        }else{
            return false;
        }
    }
}
