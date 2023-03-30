package com.liclass.client.likes.controller;

import javax.servlet.http.HttpSession;

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
	private ClientClassService clientClassService;
	
	/************************************************
	 * 1.관심클래스 유무 확인
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
		}
		return checkResult;
	}
	
	/************************************************
	 * 2.관심클래스 추가 처리
	 * 요청 url : http://localhost:8080/addLikes
	************************************************/
	@ResponseBody
	@PostMapping("/addLikes")
	public int addLikes(LikesVO lvo,HttpSession session) {
		log.info("addLikes() 호출");
		int result;
		result = likesService.addLikes(lvo);
		// 0: 입력실패 1 : 입력성공
		return result;
	}
	
	/************************************************
	 * 3.관심클래스 추가 처리
	 * 요청 url : http://localhost:8080/addLikes
	************************************************/
	@ResponseBody
	@PostMapping("/delLikes")
	public int delLikes(LikesVO lvo,HttpSession session) {
		log.info("addLikes() 호출");
		int result;
		result = likesService.delLikes(lvo);
		// 0: 삭제실패 1 : 삭제성공
		return result;
	}
}
