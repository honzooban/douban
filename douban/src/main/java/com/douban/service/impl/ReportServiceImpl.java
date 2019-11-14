package com.douban.service.impl;

import com.douban.commons.Constant;
import com.douban.dao.ReportDao;
import com.douban.domain.Report;
import com.douban.domain.Result;
import com.douban.domain.UserAndReport;
import com.douban.service.ReportService;
import com.douban.util.ValidateUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

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

    @Override
    public PageInfo<UserAndReport> getReport(Integer pn) {
        PageHelper.startPage(pn, Constant.PAGE_SIZE, true);
        List<UserAndReport> list = reportDao.selectAllReport();
        PageInfo<UserAndReport> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public Result deleteReport(Report report) {
        return ValidateUtil.isEqual(reportDao.deleteReport(report), Constant.ONE_LINE) ?
                new Result(200, "删除成功", null) :
                new Result(400, "删除失败，请重试", null);
    }

}
