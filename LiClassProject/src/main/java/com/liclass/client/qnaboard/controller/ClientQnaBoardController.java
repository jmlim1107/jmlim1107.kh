package com.liclass.client.qnaboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/client/qnaboard/*")
public class ClientQnaBoardController {

    @RequestMapping(value = "/qnaBoard")
    public String qnaBoardList(){
        return "client/qnaboard/qnaBoard";
    }

    @RequestMapping(value = "/qnaBoardDetail")
    public String qnaBoardDetail(){
        return "client/qnaboard/qnaBoardDetail";
    }

    @RequestMapping(value = "/qnaInsertForm")
    public String qnaBoardInsertForm(){
        return "client/qnaboard/qnaInsertForm";
    }

    @RequestMapping(value = "/qnaUpdateForm")
    public String qnaBoardUpdate(){
        return "client/qnaboard/qnaUpdateForm";
    }

    @RequestMapping(value = "/qnaDelete")
    public String qnaBoardDelete(){
        return "client/qnaboard/qnaDelete";
    }
}
