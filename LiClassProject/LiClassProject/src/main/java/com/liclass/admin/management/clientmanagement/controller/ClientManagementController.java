package com.liclass.admin.management.clientmanagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.liclass.admin.management.clientmanagement.service.ClientManagementService;
import com.liclass.client.login.vo.UserVO;
import com.liclass.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/clientmanagement/*")
@AllArgsConstructor
@Slf4j
public class ClientManagementController {
	
	@Setter(onMethod_ = @Autowired)
	private ClientManagementService clientManagementService;
	
	@RequestMapping("/clientList") 
	public String clientList(Model model, UserVO uservo) {
		log.info("clientList() 메소드 호출 성공");
		
		List<UserVO> userVO = clientManagementService.clientList(uservo);
		model.addAttribute("userVO", userVO);
		
		//uservo.setAmount(15);
		// 전체 레코드수 구현
		//int total = clientManagementService.clientListCnt(uservo);
		// 페이징 처리
		//model.addAttribute("pageMaker", new PageDTO(uservo, total));
		
		return "admin/management/clientManagement/clientList"; 
	}
	
	
}
