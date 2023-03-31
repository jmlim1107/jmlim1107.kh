package com.liclass.client.qnaboard.controller;

import com.liclass.admin.management.qnaboard.vo.QnaBoardVo;
import com.liclass.client.qnaboard.service.ClientQnaBoardService;
import com.liclass.common.vo.PageDTO;
import lombok.Setter;
import lombok.Value;
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

        return "client/qnaboard/qnaBoard";
    }

    //문의게시판 상세페이지
    @RequestMapping(value = "/qnaBoardDetail", method = RequestMethod.GET)
    public String qnaBoardDetail(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("qnaboarddetail 메서드 호출");

        QnaBoardVo detail = clientQnaBoardService.qnaBoardDetail(qnaBoard);
        model.addAttribute("detail", detail);

        return "client/qnaboard/qnaBoardDetail";
    }

    @RequestMapping(value = "/qnaInsertForm")
    public String qnaInsertForm(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("qnaInsertForm 호출");

        return "client/qnaboard/qnaInsertForm";
    }

    @RequestMapping(value = "qnaBoardInsert")
    public String qnaBoardInsert(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("문의글 작성 호출");

        int result = 0;
        String url = "";

        result = clientQnaBoardService.qnaBoardInsert(qnaBoard);
        if(result == 1){
            url = "/client/qnaboard/qnaBoard";
        } else{
            url = "/client/qnaboard/qnaInsertForm";
        }
        return "redirect:"+url;
    }

    @RequestMapping(value = "/qnaUpdateForm")
    public String updateForm(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("문의글 수정 폼 호출");

        QnaBoardVo updateData = clientQnaBoardService.updateForm(qnaBoard);
        model.addAttribute("updateData", updateData);

        return "client/qnaboard/qnaUpdateForm";
    }

    @RequestMapping(value="/qnaBoardUpdate")
    public String qnaBoardUpdate(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("문의글 수정 메서드 호출");

        int result = 0;
        String url = "";

        result = clientQnaBoardService.qnaBoardUpdate(qnaBoard);

        if(result == 1){
            url = "/client/qnaboard/qnaBoard";
        } else{
            url = "/client/qnaboard/qnaUpdateForm";
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
            url = "/client/qnaboard/qnaBoard";

        } else{
            url = "/client/qnaboard/qnaBoardDetail?qna_no="+qnaBoard.getQna_no();
        }
        return "redirect:"+url;

    }

    @RequestMapping(value = "/noticeBoard", method = RequestMethod.GET)
    public String noticeBoardList(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("noticeBoardList() 메소드 호출");

        //전체 레코드 조회
        List<QnaBoardVo> qnaBoardList = clientQnaBoardService.noticeBoardList(qnaBoard);
        model.addAttribute("qnaBoardList", qnaBoardList);
        //전체 레코드 수 구현
        int total = clientQnaBoardService.noticeBoardCnt(qnaBoard);
        model.addAttribute("pageMaker", new PageDTO(qnaBoard, total));

        return "client/qnaboard/noticeBoard";
    }

    @RequestMapping(value = "/noticeBoardDetail", method = RequestMethod.GET)
    public String noticeBoardDetail(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("qnaBoardDetail 호출");

        QnaBoardVo detail = clientQnaBoardService.noticeBoardDetail(qnaBoard);
        model.addAttribute("detail", detail);

        return "client/qnaboard/noticeBoardDetail";

    }

}
