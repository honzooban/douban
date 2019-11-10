package com.douban.service;

import com.douban.domain.Report;
import com.douban.domain.Result;

public interface ReportService {

    /**
     * 举报用户
     * @param report 举报数据
     * @return 举报结果
     */
    Result reportUser(Report report);
}
