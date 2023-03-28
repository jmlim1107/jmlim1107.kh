package com.liclass.client.reserve.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.liclass.client.login.vo.UserVO;
import com.liclass.client.payment.service.PaymentService;
import com.liclass.client.reserve.service.ReserveService;
import com.liclass.client.reserve.vo.ReserveVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/client/*")
@Slf4j
public class ReserveController {
	
	@Setter(onMethod_=@Autowired)
	private ReserveService reserveService;
	
	@Setter(onMethod_=@Autowired)
	private PaymentService paymentService;
	
	@PostMapping("/reserve/makeReserve")
	public String makeReserve( @ModelAttribute ReserveVO rvo, RedirectAttributes ras, Model model ) {
		log.info("예약시작합니다...");
		int result = reserveService.reservInsert(rvo); 
		log.info(result+"라네..");
		if(result==1) {
			log.info("예약성공");
			ReserveVO reserve = reserveService.reservSelect(rvo.getR_no());
			UserVO uvo = paymentService.getUserInfo(reserve.getUser_no());
			model.addAttribute("uvo", uvo);
			model.addAttribute("rvo", reserve);
			return "payment"; //결제 화면
		} else {
			log.info("예약실패");
			ras.addFlashAttribute("errorMsg", "예약실패");
			return "redirect:/class/classDetail";
		}
		
	}
}
