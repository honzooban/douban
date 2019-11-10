package com.douban.util;

import com.douban.commons.Constant;
import com.douban.dao.PictureDao;
import com.douban.domain.Article;
import com.douban.domain.Picture;
import com.douban.domain.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author: 93231
 * @date: 2019/11/8 17:39
 * @version: 1.0
 */
public class ValidateUtil {

    private static final Logger logger = LoggerFactory.getLogger(ValidateUtil.class);

    /**
     * 校验当前当前session是否存有指定key所对应的数据
     * @param request
     * @param key 指定key
     * @return 校验结果
     */
    public static boolean isSessionExist(HttpServletRequest request, String key){
        return request.getSession().getAttribute(key) != null;
    }

    /**
     * 校验上传头像步骤是否成功
     * @param user 用户信息
     * @param file 用户头像
     * @param type 上传类别
     * @return 校验结果
     */
    public static boolean isUploadAvatarSuccess(User user, MultipartFile file, String type){
        String url = UploadFileUtil.uploadFile(file, type);
        if(notNull(url)){
            user.setAvatar(url);
            return true;
        }else{
            return false;
        }
    }

    /**
     * 校验用户发表文章时上传附带图片步骤是否成功
     * @param article 文章信息
     * @param pictureDao 上传文章图片所需接口
     * @param pictures 文章图片数组
     * @param type 上传类别
     * @return 校验结果
     */
    public static boolean isUploadPicturesSuccess(Article article, PictureDao pictureDao, MultipartFile[] pictures, String type){
        int count = 0;
        for(MultipartFile picture : pictures){
            Picture temp = new Picture(UploadFileUtil.uploadFile(picture,type),article.getId());
            if (isEqual(pictureDao.insertPicture(temp), Constant.ONE_LINE)) {
                count++;
            } else {
                logger.info("insert picture wrong");
            }
        }
        return isEqual(count, pictures.length);
    }

    /**
     * 校验传入对象引用或值是否为空
     * @param object 传入对象
     * @param <T>
     * @return 校验结果
     */
    public static <T> boolean notNull(T object){
        return object != null && !object.equals("");
    }

    /**
     * 判断传入两个整型参数是否相等
     * @param a 整型参数a
     * @param b 整型参数b
     * @return 校验结果
     */
    public static boolean isEqual(int a, int b){
        return a == b;
    }
}
