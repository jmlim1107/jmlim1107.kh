package com.liclass.client.classes.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liclass.admin.management.center.service.CenterService;
import com.liclass.admin.management.center.vo.CenterVO;
import com.liclass.client.classes.service.ClassService;
import com.liclass.client.classes.vo.ClassVO;
import com.liclass.client.likes.service.LikesService;
import com.liclass.client.likes.vo.LikesVO;
import com.liclass.client.login.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ClassController {
	
	@Setter(onMethod_ = @Autowired)
	private ClassService classService;
	@Setter(onMethod_ = @Autowired)
	private CenterService centerService;
	@Setter(onMethod_ = @Autowired)
	private LikesService likesService;
	
	/************************************************
	 * 게시판 전체조회 ->homecontroller에 포함시킴
	 * 요청 url : http://localhost:8080/class/classList
	************************************************
	@GetMapping("/class/classList")
	public String classList(Model model) {
		log.info("classList() 호출");
		
		List<ClassVO> classList =classService.classList();
		for(ClassVO vo : classList ) {
			log.info("classList : "+vo.toString());
		}
		
		model.addAttribute("classList",classList);
		
		return "class/classList";
	}*/
	
	/************************************************
	 * 클래스 상세조회
	 * 요청 url : http://localhost:8080/class/classList
	*************************************************/
	@GetMapping("/class/classDetail")
	public String classDetail(int c_no,Model model,HttpSession session) {
		log.info("classDetail() 호출");
		ClassVO cvo = new ClassVO();
		cvo.setC_no(c_no);
		
		//로그인 계정
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		model.addAttribute("loginUser",loginUser);
		
		//클래스 관심클래스 유무
		if(loginUser != null) {
			LikesVO lvo = new LikesVO();
			lvo.setUser_no(loginUser.getUser_no());
			lvo.setC_no(c_no);
			log.info("LikesVO vo : "+lvo.toString());
			int checkResult = likesService.checkLikes(lvo);
			log.info("checkResult : "+checkResult);
			model.addAttribute("checkResult",checkResult);
		}
		
		//클래스 상세정보
		ClassVO classDetail =classService.classDetail(cvo);
		log.info("classDetail.toString() : "+classDetail.toString());
		model.addAttribute("classDetail",classDetail);
		
		//센터 상세정보
		CenterVO centerDetail = centerService.centerDetail(classDetail);
		log.info("centerDetail.toString() : "+centerDetail.toString());
		model.addAttribute("centerDetail", centerDetail);
		
		return "class/classDetail";
	}
	
	/************************************************
	 * 클래스 상세조회 (최근 본 클래스)
	 * 요청 url : http://localhost:8080/class/classList2
	*************************************************/
	@ResponseBody
	@GetMapping("/class/classDetail2")
	public String classDetail2(int c_no) {
		log.info("classDetail2() 호출");
		ClassVO cvo = new ClassVO();
		cvo.setC_no(c_no);
		
		//클래스 상세정보
		ClassVO recentClass =classService.classDetail(cvo);
		String c_img_file = recentClass.getC_img_file();
		log.info("recentClass.toString() : "+recentClass.toString());
		
		return c_img_file;
	}
	
}
