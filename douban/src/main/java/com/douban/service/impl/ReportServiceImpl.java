package com.douban.service.impl;

import com.douban.commons.Constant;
import com.douban.dao.ReportDao;
import com.douban.domain.Report;
import com.douban.domain.Result;
import com.douban.service.ReportService;
import com.douban.util.ValidateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;

@Service
public class ReportServiceImpl implements ReportService {

    @Autowired
    private ReportDao reportDao;

    @Override
    public Result reportUser(Report report) {
        report.setTime(new Timestamp(System.currentTimeMillis()));
        return ValidateUtil.isEqual(reportDao.insertReport(report), Constant.ONE_LINE) ?
                new Result(200,"举报成功",null) :
                new Result(400,"举报失败，请重试",null);
    }
}
