package com.douban.domain;

public class Relation {
    private Integer relationId;

    private String relationType;

    private String relationStatus;

    private Integer userId;

    private Integer userByid;

    public Integer getRelationId() {
        return relationId;
    }

    public void setRelationId(Integer relationId) {
        this.relationId = relationId;
    }

    public String getRelationType() {
        return relationType;
    }

    public void setRelationType(String relationType) {
        this.relationType = relationType == null ? null : relationType.trim();
    }

    public String getRelationStatus() {
        return relationStatus;
    }

    public void setRelationStatus(String relationStatus) {
        this.relationStatus = relationStatus == null ? null : relationStatus.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getUserByid() {
        return userByid;
    }

    public void setUserByid(Integer userByid) {
        this.userByid = userByid;
    }
}