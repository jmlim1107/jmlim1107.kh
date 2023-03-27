package com.liclass;


import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.liclass.client.classes.service.ClassService;
import com.liclass.client.classes.vo.ClassVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
	@Setter(onMethod_ = @Autowired)
	private ClassService classService;
	
	@GetMapping("/")
	public String home(Locale locale, Model model) {
		log.info("home() 호출");
		
		List<ClassVO> classList = classService.classList();
		for(ClassVO vo : classList) {
			log.info(vo.toString());
		}
		model.addAttribute("classList",classList);
		
		return "home";
	}
	
}
