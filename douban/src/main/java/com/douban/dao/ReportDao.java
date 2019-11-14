package com.douban.dao;

import com.douban.domain.Report;
import com.douban.domain.UserAndReport;

import java.util.List;

public interface ReportDao {

    /**
     * 添加举报内容
     * @param report 举报数据
     * @return 添加结果
     */
    int insertReport(Report report);

    /**
     * 获取所有的举报内容
     * @return 用户及举报数据
     */
    List<UserAndReport> selectAllReport();

    /**
     * 删除举报
     * @param report 举报内容
     * @return 删除结果
     */
    int deleteReport(Report report);

}