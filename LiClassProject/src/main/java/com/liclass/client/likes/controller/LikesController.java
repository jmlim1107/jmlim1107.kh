package com.liclass.client.likes.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.liclass.client.classes.service.ClassService;
import com.liclass.client.likes.service.LikesService;
import com.liclass.client.likes.vo.LikesVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes("loginUser")
public class LikesController {
	
	@Setter(onMethod_ = @Autowired)
	private LikesService likesService;
	
	@Setter(onMethod_ = @Autowired)
	private ClassService classService;
	
	/************************************************
	 * 관심클래스 추가
	 * 요청 url : http://localhost:8080/like
	************************************************/
	@ResponseBody
	@PostMapping("/like")
	public String like(long user_no,int c_no) {
		log.info("like() 호출");
		String result = "";
		
		if(user_no != 0) {
			log.info("loginUser.user_no: "+user_no);
			log.info("classList.c_no: "+c_no);
			
			LikesVO vo = new LikesVO();
			vo.setUser_no(user_no);
			vo.setC_no(c_no);
			log.info("LikesVO vo : "+vo.toString());
			int checkResult = likesService.checkLikes(vo);
			log.info("checkResult : "+checkResult);
			
			if(checkResult == 1) {
				likesService.delLikes(vo);
				//classService.delLikes(c_no);
				result = "삭제";
				log.info("result : "+result);
			}else if(checkResult == 0){
				likesService.addLikes(vo);
				//classService.addLikes(c_no);
				result = "추가";
				log.info("result : "+result);
			}
		}else {
			result = "error";
			log.info("result : "+result);
		}
		return result;
	}
}
