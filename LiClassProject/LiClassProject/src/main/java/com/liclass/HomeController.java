package com.liclass;


import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.liclass.client.classes.service.ClientClassService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
	@Setter(onMethod_ = @Autowired)
	private ClientClassService classService;
	
	/************************************************
	 * 1. 홈화면
	 * 요청 url : http://localhost:8080/
	************************************************/
	@GetMapping("/")
	public String home(Locale locale, Model model) {
		log.info("home() 호출");

		return "home";
	}
	
	/************************************************
	 * 2. 팀 소개 화면
	 * 요청 url : http://localhost:8080/team
	************************************************/
	@GetMapping("/team")
	public String team() {
		log.info("team() 호출");

		return "team";
	}
}
