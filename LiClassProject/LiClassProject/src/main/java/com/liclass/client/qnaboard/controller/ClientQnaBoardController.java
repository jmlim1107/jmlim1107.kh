package com.liclass.client.qnaboard.controller;

import com.liclass.admin.management.qnaboard.vo.QnaBoardVo;
import com.liclass.client.qnaboard.service.ClientQnaBoardService;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/client/qnaboard/*")
public class ClientQnaBoardController {
    @Setter(onMethod_ = @Autowired)
    private ClientQnaBoardService clientQnaBoardService;

    @RequestMapping(value = "/qnaBoard", method = RequestMethod.GET)
    public String qnaBoardList(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("qnaboard 메서드 호출");
        List<QnaBoardVo> qnaBoardList = clientQnaBoardService.qnaBoardList(qnaBoard);
        model.addAttribute("qnaBoardList", qnaBoardList);

        return "admin/management/qnaboard/qnaBoard";
    }

    //문의게시판 상세페이지
    @RequestMapping(value = "/qnaBoardDetail", method = RequestMethod.GET)
    public String qnaBoardDetail(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("qnaboarddetail 메서드 호출");

        QnaBoardVo detail = clientQnaBoardService.qnaBoardDetail(qnaBoard);
        model.addAttribute("detail", detail);

        return "admin/management/qnaboard/qnaBoardDetail";
    }

    //문의 답변글 작성 메서드
    @RequestMapping(value = "/qnaAnswerForm")
    public String qnaAnswerForm(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("qnaAnswerForm 호출");

        QnaBoardVo answerData = clientQnaBoardService.qnaAnswerForm(qnaBoard);
        model.addAttribute("answerData", answerData);

        return "admin/management/qnaboard/qnaAnswerForm";
    }

    @RequestMapping(value = "/qnaInsertForm")
    public String qnaInsertForm(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("qnaInsertForm 호출");

        return "admin/management/qnaboard/qnaInsertForm";
    }

    @RequestMapping(value = "qnaBoardInsert")
    public String qnaBoardInsert(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("문의글 작성 호출");

        int result = 0;
        String url = "";


        result = clientQnaBoardService.qnaBoardInsert(qnaBoard);
        if(result == 1){
            url = "/management/qnaboard/qnaBoard";
        } else{
            url = "/management/qnaboard/qnaInsertForm";
        }
        return "redirect:"+url;
    }


    @RequestMapping(value = "qnaAnswerInsert")
    public String qnaAnswerInsert(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("문의글 작성 메서드 호출");

        int result = 0;
        String url = "";


        result = clientQnaBoardService.qnaAnswerInsert(qnaBoard);
        if(result == 1){
            url = "/management/qnaboard/qnaBoard";
        } else{
            url = "/management/qnaboard/qnaAnswerForm";
        }
        return "redirect:"+url;
    }

    @RequestMapping(value = "/qnaBoardDelete", method = RequestMethod.POST)
    public String qnaBoardDelete(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("문의글 삭제 메서드 호출");
        int result = 0;
        String url = "";

        result = clientQnaBoardService.qnaBoardDelete(qnaBoard);
        if(result == 1){
            url = "/management/qnaboard/qnaBoard";

        } else{
            url = "/management/qnaboard/qnaBoardDetail?qna_no="+qnaBoard.getQna_no();
        }
        return "redirect:"+url;

    }
}
