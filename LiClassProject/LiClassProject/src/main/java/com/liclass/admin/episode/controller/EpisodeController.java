package com.liclass.admin.episode.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liclass.admin.episode.service.EpisodeService;
import com.liclass.admin.episode.vo.EpisodeVO;
import com.liclass.client.login.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/*")
@Slf4j
public class EpisodeController {
	
	@Setter(onMethod_=@Autowired )
	private EpisodeService episodeService;
	
	@ResponseBody
	@GetMapping( value="/episode/episodeList", produces = MediaType.APPLICATION_JSON_VALUE /*produces = "application/json;charset=utf-8"*/  )
	public List<EpisodeVO> episodeList( @RequestParam int c_no){
		log.info("episodeList 호출...");
		List<EpisodeVO> list = null;
		list = episodeService.epList(c_no);
		return list;
	}
	
	@GetMapping("/episode/writeForm")
	public String wirteForm( @ModelAttribute EpisodeVO vo  ) {
		log.info("회차등록폼 호출");
		return "/episode/episodeForm";
	}
	
	@PostMapping("/episode/insertEpisode")
	public String insertEpisode( @ModelAttribute EpisodeVO vo ) {
		log.info("회차등록합니다..");
		int result = episodeService.epInsert(vo);
		if(result==1) {
			return "redirect:/admin/class/classDetail?c_no="+vo.getC_no();
		} else {
			return "redirect:/admin/episode/writeForm?c_no="+vo.getC_no();
		}
	}
	
	@ResponseBody
	@PostMapping( value="/episode/dateChk", produces = "text/plain;charset=utf-8")
	public String dateChk( @ModelAttribute EpisodeVO vo ) {
		log.info("중복 시간대 확인합니다...");
		int result = episodeService.chkDate(vo);
		return (result==1) ? "중복발생" : "중복없음";
		}
	
	@PostMapping("/episode/deleteEpisode")
	public String deleteEpisode(@ModelAttribute EpisodeVO vo) {
		log.info("삭제합니다...");
		int result = episodeService.epDelete(vo.getEp_no());
		if(result==1) {
			return "redirect:/admin/class/classDetail?c_no="+vo.getC_no();
		} else {
			return "redirect:/admin/class/classDetail?c_no="+vo.getC_no();
		}
	}
	
	@ResponseBody
	@GetMapping( value="/episode/countEpisode", produces = "text/plain;charset=utf-8" )
	public String countEpisode( @RequestParam int c_no ) {
		log.info("숫자셉니다..");
		int cnt = episodeService.epCnt(c_no);
		return (cnt>=1) ? "회차존재" : "회차없음";
	}
	
	/***************************예약화면에서 불러올 회차정보들**************************/
	@GetMapping("/episode/goReserve")
	public String goReserve( @RequestParam int c_no, @RequestParam Long user_no /*HttpSession session, Model model*/ ) {
		log.info("예약페이지로 넘어갑니다...");
		//UserVO loginUser = (UserVO)session.getAttribute("loginUser");
	    //model.addAttribute("loginUser",loginUser);
		return "reserve/reserve";
	}
	//클래스 디테일 controller에서 만들것임..
	
	@ResponseBody
	@GetMapping( value="/episode/epDateList", produces = "application/json;charset=utf-8" )
	public String[] epDateList( @RequestParam int c_no ) {
		log.info("클래스에서회차가 있는 날짜를 가져옵니다..");
		String[] epDateList = episodeService.epDateList(c_no);
		return epDateList;
	}
	
	@ResponseBody
	@PostMapping( value="/episode/epListOfDay", produces = "application/json;charset=utf-8" )
	public List<EpisodeVO> epListOfDay( @ModelAttribute EpisodeVO vo ){ //회차번호, 날짜를 가진 ep
		log.info("클래스에서 해당날짜의 회차리스트를 가져옵니다..");
		List<EpisodeVO> epDateList = episodeService.epInfo(vo);
		return epDateList;
	}
	
	@ResponseBody
	@GetMapping( value="/episode/epReserve", produces = "application/json;charset=utf-8" )
	public EpisodeVO epReserve( @RequestParam int ep_no ) {
		log.info("예약을 위한 회차정보를 불러옵니다..");
		EpisodeVO ep = episodeService.reservInfo(ep_no);
		return ep;
	}
	
}
	

