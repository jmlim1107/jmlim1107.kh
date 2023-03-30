package com.liclass.client.classes.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liclass.admin.management.center.service.CenterService;
import com.liclass.admin.management.center.vo.CenterVO;
import com.liclass.client.classes.service.ClientClassService;
import com.liclass.client.classes.vo.ClientClassVO;
import com.liclass.client.likes.service.LikesService;
import com.liclass.client.likes.vo.LikesVO;
import com.liclass.client.login.vo.UserVO;
import com.liclass.client.review.service.ReviewService;
import com.liclass.client.review.vo.ReviewVO;
import com.liclass.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ClientClassController {
	
	@Setter(onMethod_ = @Autowired)
	private ClientClassService classService;
	@Setter(onMethod_ = @Autowired)
	private CenterService centerService;
	@Setter(onMethod_ = @Autowired)
	private LikesService likesService;
	@Setter(onMethod_ = @Autowired)
	private ReviewService reviewService;
	
	/************************************************
	 * 클래스 전체 조회 
	 * 요청 url : http://localhost:8080/class/classList
	*************************************************/
	@GetMapping("/class/classList")
	public String classList(Model model) {
		log.info("classList() 호출");
		
		List<ClientClassVO> classList =classService.clientClassList();
		for(ClientClassVO vo : classList ) {
			log.info("classList : "+vo.toString());
		}
		
		model.addAttribute("classList",classList);
		
		return "class/classList";
	}
	

	/************************************************
	 * 클래스 상세조회
	 * 요청 url : http://localhost:8080/class/classList
	 * @throws Exception 
	*************************************************/
	@GetMapping("/class/classDetail")
	public String classDetail(int c_no,Model model,HttpSession session, @ModelAttribute ReviewVO vo) throws Exception {
		log.info("classDetail() 호출");
		ClientClassVO cvo = new ClientClassVO();
		cvo.setC_no(c_no);
		
		//로그인 계정
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		model.addAttribute("loginUser",loginUser);
		
		//클래스 관심클래스 유무 확인
		if(loginUser != null) {
			LikesVO lvo = new LikesVO();
			lvo.setUser_no(loginUser.getUser_no());
			lvo.setC_no(c_no);
			log.info("LikesVO vo : "+lvo.toString());
			int checkResult = likesService.checkLikes(lvo);
			log.info("checkResult : "+checkResult);
			model.addAttribute("checkResult",checkResult);
			model.addAttribute("lvo",lvo);
		}
		
		//클래스 상세정보
		ClientClassVO classDetail =classService.clientClassDetail(cvo);
		log.info("classDetail.toString() : "+classDetail.toString());
		model.addAttribute("classDetail",classDetail);
		
		//해당 클래스의 센터 상세정보
		CenterVO centerDetail = classService.clientCenterDetail(classDetail);
		if(centerDetail != null) {
			log.info("centerDetail.toString() : "+centerDetail.toString());
			model.addAttribute("centerDetail", centerDetail);
		}
		
		/** 후기 관련 코드 */
		// 전체 레코드 조회
		List<ReviewVO> reviewList = reviewService.reviewList(vo);
		model.addAttribute("reviewList" , reviewList);
		
		// 전체 레코드 수 구현
		int total = reviewService.reviewListCnt(vo);
		// 페이징 처리
		model.addAttribute("pageMaker" , new PageDTO(vo, total));
		
		// vo.c_no 로 변경해주기
		double ratingAvg = reviewService.setRating(vo.getC_no());
		HashMap<String,Integer> tongRating = reviewService.tongRating(vo);
		
		model.addAttribute("tongRating", tongRating);
		model.addAttribute("ratingAvg", ratingAvg);
		
		
		for(String i : tongRating.keySet()) {
			log.info("Key ::::::::::::::::::::::::::::: "+ i);
			log.info("Value ::::::::::::::::::::::::::::: "+ tongRating.get(i));
		}
				

		return "class/classDetail";
	}
	
	/************************************************
	 * 클래스 대표 이미지 조회
	 * 요청 url : http://localhost:8080/class/getClassImg
	*************************************************/
	@ResponseBody
	@GetMapping("/class/getClassImg")
	public String getClassImg(ClientClassVO cvo) {
		log.info("getClassImg() 호출");

		//클래스 상세정보
		ClientClassVO recentClass =classService.clientClassDetail(cvo);
		String c_img_file = recentClass.getC_img_file();
		
		return c_img_file;
	}
	
	
	/* 예약하기 */
	@RequestMapping("/admin/episode/goReserve")
	public String goReserve(@RequestParam int c_no, HttpSession session, Model model) {
		log.info("예약페이지로 넘어갑니다...");
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
	    model.addAttribute("loginUser",loginUser);
		return "reserve/reserve";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
