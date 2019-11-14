package com.douban.service;

import com.douban.domain.Report;
import com.douban.domain.Result;
import com.douban.domain.UserAndReport;
import com.github.pagehelper.PageInfo;

public interface ReportService {

    /**
     * 举报用户
     * @param report 举报数据
     * @return 举报结果
     */
    Result reportUser(Report report);

    /**
     * 获取管理员管理用户页面及数据
     * @param pn 页数
     * @return 管理用户页面及数据
     */
    PageInfo<UserAndReport> getReport(Integer pn);

    /**
     * 删除举报
     * @param report 举报内容
     * @return 删除结果
     */
    Result deleteReport(Report report);
}
