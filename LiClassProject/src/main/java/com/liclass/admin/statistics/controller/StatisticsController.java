package com.liclass.admin.statistics.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/statistics/*")
public class StatisticsController {

    @RequestMapping(value = "/userstatistics")
    private String userStatistics(){
        return "admin/statistics/userstatistics";
    }

    @RequestMapping(value = "/reservestatistics", method = RequestMethod.GET)
    public String reserveStatistics(){
        return "admin/statistics/reservestatistics";
    }

    @RequestMapping(value = "/salesstatistics", method = RequestMethod.GET)
    public String salesStatistics(){
        return "admin/statistics/salesstatistics";
    }
}
