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
	
	@GetMapping("/")
	public String home(Locale locale, Model model) {
		log.info("home() 호출");
		/*
		 * List<ClientClassVO> classList = classService.clientClassList();
		 * for(ClientClassVO vo : classList) { log.info(vo.toString()); }
		 * model.addAttribute("classList",classList);
		 */
		
		return "home";
	}
	
}
