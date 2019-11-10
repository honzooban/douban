package com.douban.dao;

import com.douban.domain.Report;

public interface ReportDao {

    /**
     * 添加举报内容
     * @param report 举报数据
     * @return 添加结果
     */
    int insertReport(Report report);

}