package com.liclass.client.likes.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liclass.client.classes.service.ClientClassService;
import com.liclass.client.likes.service.LikesService;
import com.liclass.client.likes.vo.LikesVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LikesController {
	
	@Setter(onMethod_ = @Autowired)
	private LikesService likesService;
	@Setter(onMethod_ = @Autowired)
	private ClientClassService classService;
	
	/************************************************
	 * 관심클래스 유무 확인
	 * 요청 url : http://localhost:8080/like
	************************************************/
	@ResponseBody
	@PostMapping("/like")
	public int like(long user_no,int c_no) {
		log.info("like() 호출");
		int checkResult = 0;
		if(user_no != 0) {
			log.info("loginUser.user_no: "+user_no);
			log.info("classList.c_no: "+c_no);
			
			LikesVO vo = new LikesVO();
			vo.setUser_no(user_no);
			vo.setC_no(c_no);
			log.info("LikesVO vo : "+vo.toString());
			checkResult = likesService.checkLikes(vo);
			log.info("checkResult : "+checkResult);
			
			/* 은아)0330 주석처리
			if(checkResult == 1) {
				likesService.delLikes(vo);
				//classService.delLikes(c_no);
				log.info("checkResult : "+checkResult);
			}else if(checkResult == 0){
				likesService.addLikes(vo);
				//classService.addLikes(c_no);
				log.info("checkResult : "+checkResult);
			}*/
		}
		return checkResult;
	}
}
