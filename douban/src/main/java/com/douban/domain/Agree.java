package com.douban.domain;

import com.douban.commons.Constant;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

public class Agree {

    private Integer id;

    private Timestamp time;

    private Integer commentId;

    private Integer transpondId;

    private Integer articleId;

    private Integer userId;

    public Map<String, Object> getById(){
        Map<String, Object> map = new HashMap<>(2);
        if(this.articleId != null){
            map.put(Constant.ID,this.articleId);
            map.put(Constant.TYPE,Constant.ARTICLE_ID);
            return map;
        }
        if(this.commentId != null){
            map.put(Constant.ID,this.commentId);
            map.put(Constant.TYPE,Constant.COMMENT_ID);
            return map;
        }
        if(this.transpondId != null) {
            map.put(Constant.ID,this.transpondId);
            map.put(Constant.TYPE,Constant.TRANSPOND_ID);
            return map;
        }
        return null;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getTranspondId() {
        return transpondId;
    }

    public void setTranspondId(Integer transpondId) {
        this.transpondId = transpondId;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}