package com.douban.dao;

import com.douban.domain.Picture;

import java.util.List;

public interface PictureDao {

    /**
     * 获取文章附带图片的所有url
     * @param id 文章id
     * @return 所有图片的url集合
     */
    List<Picture> getPictures(int id);

    /**
     * 删除图片
     * @param picture 图片信息
     * @return 删除结果
     */
    int deletePicture(Picture picture);

    /**
     * 新增图片
     * @param picture 图片信息
     * @return 新增结果
     */
    int insertPicture(Picture picture);
}