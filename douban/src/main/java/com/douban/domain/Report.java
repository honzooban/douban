package com.douban.domain;

public class Report {
    private Integer reportId;

    private String reportContent;

    private String reportTime;

    private Integer userId;

    private Integer userByid;

    public Integer getReportId() {
        return reportId;
    }

    public void setReportId(Integer reportId) {
        this.reportId = reportId;
    }

    public String getReportContent() {
        return reportContent;
    }

    public void setReportContent(String reportContent) {
        this.reportContent = reportContent == null ? null : reportContent.trim();
    }

    public String getReportTime() {
        return reportTime;
    }

    public void setReportTime(String reportTime) {
        this.reportTime = reportTime == null ? null : reportTime.trim();
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