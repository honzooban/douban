package com.douban.controller;

import com.douban.domain.Report;
import com.douban.domain.Result;
import com.douban.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("report")
public class ReportController {

    @Autowired
    private ReportService reportService;

    /**
     * 举报用户
     * @param report 举报内容
     * @return 举报结果
     */
    @RequestMapping("reportUser")
    public Result reportUser(@RequestBody Report report){
        return reportService.reportUser(report);
    }

    /**
     * 获取管理员管理用户页面及数据
     * @param pn 页数
     * @return
     */
    @RequestMapping("operateReport")
    public ModelAndView operateReport(@RequestParam(value = "pn", defaultValue = "1") Integer pn){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin_operate_user");
        mv.addObject("userAndReport",reportService.getReport(pn));
        return mv;
    }

    /**
     * 删除举报
     * @param report 举报数据
     * @return 删除结果
     */
    @RequestMapping("deleteReport")
    public Result deleteReport(@RequestBody Report report){
        return reportService.deleteReport(report);
    }

}
