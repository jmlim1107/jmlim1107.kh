package com.liclass.admin.management.dashboard.controller;

import com.liclass.admin.management.dashboard.service.DashBoardService;
import com.liclass.admin.management.dashboard.vo.DashBoardVo;
import com.liclass.admin.management.qnaboard.vo.QnaBoardVo;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/management/*")
@AllArgsConstructor
@Slf4j
public class DashBoardController {

    @Setter(onMethod_ = @Autowired)
    private DashBoardService dashBoardService;
/*    @GetMapping(value = "/dashboard")
    public String dashBoard(){

        return "admin/management/dashboard";
    }*/
    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String noticeList(@ModelAttribute QnaBoardVo qnaBoard, DashBoardVo dashBoard,Model model) {
        log.info("boardList() 메서드 호출");
        log.info("QnaBoardVO"+qnaBoard);

        List<QnaBoardVo> noticeList = dashBoardService.noticeList(qnaBoard);
        List<QnaBoardVo> qnaList = dashBoardService.qnaList(qnaBoard);
        HashMap<String, Integer> userState = dashBoardService.userState(dashBoard);
        HashMap<String, Integer> userReserve = dashBoardService.userReserve(dashBoard);

        model.addAttribute("qnaList", qnaList);
        model.addAttribute("noticeList", noticeList);

        model.addAttribute("userState", userState);
        model.addAttribute("userReserve", userReserve);

/*        log.info("userState" + userState.values());
        for(String i : userState.keySet()){
            log.info("key : "+ i +"value : "+ userState.get(i));
        }*/

        return "admin/management/dashboard";
    }

    /*@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String qnaList(@ModelAttribute QnaBoardVo qnaBoard, Model model) {
        log.info("boardList() 메서드 호출");
        log.info("QnaBoardVO"+qnaBoard);
        List<QnaBoardVo> qnaList = dashBoardService.qnaList(qnaBoard);

        model.addAttribute("qnaList", qnaList);

        return "admin/management/dashboard";
    }*/

}
