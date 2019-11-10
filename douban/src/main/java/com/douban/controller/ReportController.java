package com.douban.controller;

import com.douban.domain.Report;
import com.douban.domain.Result;
import com.douban.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("report")
public class ReportController {

    @Autowired
    private ReportService reportService;

    @RequestMapping("reportUser")
    public Result reportUser(@RequestBody Report report){
        return reportService.reportUser(report);
    }
}
