package com.liclass.client.mypage.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.liclass.client.classes.vo.ClientClassVO;
import com.liclass.client.likes.service.LikesService;
import com.liclass.client.likes.vo.LikesVO;
import com.liclass.client.login.service.UserService;
import com.liclass.client.login.vo.UserVO;
import com.liclass.client.mypage.service.MypageService;
import com.liclass.client.payment.vo.PaymentVO;
import com.liclass.client.qnaboard.vo.ClientQnaBoardVO;
import com.liclass.client.review.vo.ReviewVO;
import com.liclass.common.file.UserFileUpload;
import com.liclass.common.vo.CommonVO;
//import com.liclass.common.file.FileUploadUtil;
import com.liclass.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes("loginUser")
public class MyPageController {
	@Setter(onMethod_ = @Autowired)
	private UserService userService;
	@Setter(onMethod_ = @Autowired)
	private MypageService mypageService;
	@Setter(onMethod_ = @Autowired)
	private LikesService likesService;
	@Setter(onMethod_ = @Autowired)
	private UserFileUpload fileUploadUtil;
	
	/************************************************
	 * 회원정보 화면
	 * 요청 url : http://localhost:8080/mypage
	************************************************/
	@RequestMapping("/mypage")
	public String mypage(UserVO vo,Model model,HttpSession session,PaymentVO pvo,ClientQnaBoardVO qvo) {
		log.info("mypage() 호출");
		
		/* 은아 */
		//로그인 세션
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		model.addAttribute("loginUser",loginUser);
		if(loginUser == null) {
			return "redirect:/";
		}
		
		//관심클래스 조회
		log.info("loginUser : " +loginUser.toString());
		List<ClientClassVO> myLikesList = mypageService.myLikesList(loginUser);
		model.addAttribute("myLikesList",myLikesList);
		
		//후기 조회
		List<ReviewVO> myReviewList = mypageService.myReviewList(loginUser);
		model.addAttribute("myReviewList",myReviewList);
		
		//문의 조회
		qvo.setUser_no(loginUser.getUser_no());
		log.info("qvo.getAmount : "+qvo.getAmount());
		log.info("qvo.getPageNum : "+qvo.getPageNum());
		/*
		 * loginUser.setAmount(ccvo.getAmount());
		 * loginUser.setPageNum(ccvo.getPageNum());
		 * log.info("loginUser.getPageNum() : "+loginUser.getPageNum());
		 */
		
		int qnaCnt = mypageService.myQnaCnt(loginUser); 
		PageDTO qnaPageDto = new PageDTO(qvo,qnaCnt);
		model.addAttribute("qnaPageMaker",qnaPageDto);
		log.info("qnaPageDto.getCvo().getPageNum() : "+qnaPageDto.getCvo().getPageNum());

		List<ClientQnaBoardVO> myQnaList = mypageService.myQnaList(qvo);
		model.addAttribute("myQnaList",myQnaList);
		
		//비밀번호 만료 알림
		int result = userService.checkPwExp(loginUser);
		log.info("checkPwExp result : " +result);
		if(result>90) {
			model.addAttribute("message", "pwOverExp");
		}

		
		/* 웅배 */
		pvo.setUser_no(loginUser.getUser_no());
		pvo.setAmount(5);
		List<Map<String, String>> pvo_paymentList = mypageService.paymentList(pvo);       
        model.addAttribute("pvo_paymentList", pvo_paymentList);
        // 전체 레코드수 구현 (payment)
        int total_payment = mypageService.paymentListCnt(pvo);
        // 페이징 처리
        model.addAttribute("pageMaker", new PageDTO(pvo, total_payment));
        
        // 수강내역
        List<Map<String, String>> pvo_courseList = mypageService.courseList(pvo);
	    model.addAttribute("pvo_courseList", pvo_courseList);
	        
	       
	    System.out.println("pvo="+pvo_courseList);
	        
		return "liuser/mypage/userMypage";
	}
	
	@RequestMapping("/courseHistory")
	public String courseHistory(Model model, PaymentVO pvo,HttpSession session) {
		// 수강내역
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		pvo.setUser_no(loginUser.getUser_no());
        List<Map<String, String>> pvo_courseList = mypageService.courseList(pvo);
        //System.out.println("pvo"+pvo_courseList.toString());
	    model.addAttribute("pvo_courseList", pvo_courseList);
	    
	    return "liuser/mypage/courseHistory";
	}
	
	/************************************************
	 * 회원정보 수정화면
	 * 요청 url : http://localhost:8080/user/signupForm
	************************************************/
	@GetMapping("/mypage/updateForm")
	public String updateForm() {
		log.info("updateForm() 호출");
		return "liuser/mypage/updateForm";
	}
	
	/************************************************
	 * 기존비밀번호 확인
	 * 요청 url : http://localhost:8080/user/signupForm
	************************************************/
	@ResponseBody
	@PostMapping("/checkPw")
	public int checkPw(UserVO vo, Model model) {
		log.info("checkPw() 호출");
		log.info("user_email : "+vo.getUser_email()+", user_pw : "+vo.getUser_pw());
		int checkData = userService.checkPw(vo);
		model.addAttribute("checkData",checkData);
		log.info("checkPw() checkData"+checkData);
		return checkData;
	}
	
	/************************************************
	 * 회원정보 수정
	 * 요청 url : http://localhost:8080/mypage/userUpdate
	 * @throws MessagingException 
	 * @throws UnsupportedEncodingException 
	************************************************/
	@PostMapping(value ="/mypage/update")
	public String update(@ModelAttribute UserVO vo,Model model){
		log.info("update() 호출");
		
		String message ="";
		if(vo != null) {
			log.info("vo " + vo.toString()); 
			int result = userService.update(vo);
			log.info("update result : "+result);
			
			if(result == 1) {
				message = vo.getUser_name()+"님, 새로운 정보로 수정되었습니다.";
				model.addAttribute("message", message);
				model.addAttribute("url", "/mypage");
			}else {
				message = "죄송합니다. 잠시후 다시 시도해주세요.";
				model.addAttribute("message", message);
				model.addAttribute("url", "/mypage/updateForm");
			}
		}
		
		return "liuser/mypage/updateForm";
	}
	
	/************************************************
	 * 프로필사진 수정
	 * 요청 url : http://localhost:8080/mypage/imgUpdate
	 * @throws MessagingException 
	 * @throws UnsupportedEncodingException 
	************************************************/
	@PostMapping(value ="/mypage/imgUpdate")
	public String imgUpdate(@RequestParam("file") MultipartFile file, HttpSession session,Model model)throws Exception{
		log.info("imgUpdate() 호출");
		
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		log.info("loginUser : "+loginUser.toString());
		
		String originImg = loginUser.getUser_img();
		if(file != null) {
			
			//1. 기존 프로필 사진을 서버에서 지운다.
			if(originImg != "default-profile.png") {
				UserFileUpload.fileDelete(originImg);
			}
			
			//2. 새로 등록한 파일
			loginUser.setFile(file);
			
			if(loginUser.getFile().getSize() > 0) {
				String user_img = UserFileUpload.fileUpload(loginUser.getFile(),String.valueOf(loginUser.getUser_no()));
				loginUser.setUser_img(user_img);
			}
			
			int result = mypageService.updateImg(loginUser);
			log.info("imgUpdate result : "+result);
		}else {
			//3. 기본이미지로 변경
			loginUser.setUser_img("default-profile.png");
		}
		
		
		return "redirect:/mypage";
	}
	
	/************************************************
	 * 프로필사진 수정 (기본이미지로 변경)
	 * 요청 url : http://localhost:8080/mypage/delImg
	 * @throws MessagingException 
	 * @throws UnsupportedEncodingException 
	************************************************/
	@GetMapping(value ="/mypage/delImg")
	public String delImg(HttpSession session,Model model)throws Exception{
		log.info("delImg() 호출");
		
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		log.info("loginUser : "+loginUser.toString());
		
		//1. 기존 프로필 사진을 서버에서 지운다.
		UserFileUpload.fileDelete(loginUser.getUser_img());
		loginUser.setUser_img("default-profile.png");
		
		return "redirect:/mypage";
	}
	
	
	/************************************************
	 * 회원정보 탈퇴 화면
	 * 요청 url : http://localhost:8080/mypage/unregisterForm
	************************************************/
	@GetMapping("/mypage/unregisterForm")
	public String unregisterForm() {
		log.info("unregisterForm() 호출");
		return "liuser/mypage/unregisterForm";
	}
	
	/************************************************
	 * 회원정보 탈퇴 처리
	 * 요청 url : http://localhost:8080/unregister
	************************************************/
	@PostMapping("/unregister")
	public String unregister(@ModelAttribute UserVO vo,Model model,HttpSession session) {
		log.info("unregister() 호출");
		log.info("vo " + vo.toString());
		
		String message ="";
		int result = userService.unregister(vo);
		log.info("unregister result : "+result);
		
		if(result == 1) {
			message = "탈퇴되었습니다. 그동안 LiClass를 이용해주셔서 감사합니다. 다음에 다시 만나요. ";
			model.addAttribute("loginUser",null);
			session.invalidate();
			model.addAttribute("message", message);
			model.addAttribute("url", "/");
		}else {
			message = "죄송합니다. 잠시후 다시 시도해주세요.";
			model.addAttribute("message", message);
			model.addAttribute("url", "/mypage/unregisterForm");
		}
		return "liuser/mypage/unregisterForm";
	}
	
	/************************************************
	 * 나의 관심클래스 조회
	 * 요청 url : http://localhost:8080/myLikesList
	***********************************************
	@GetMapping("/myLikesList")
	public String myLikesList(Model model,HttpSession session) {
		log.info("myLikesList() 호출 ");
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		List<ClassVO> myLikesList = mypageService.myLikesList(loginUser);
		model.addAttribute("myLikesList",myLikesList);
		model.addAttribute("activePosition","4");
	
		return "mypage/userMypage";
	}
	*/
	/************************************************
	 * 나의 관심클래스 삭제
	 * 요청 url : http://localhost:8080/mypage/delLikes
	************************************************/
	@GetMapping("/mypage/delLikes")
	public String delLikes(int c_no,Model model,HttpSession session) {
		log.info("delLikes() 호출 ");
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		LikesVO lvo = new LikesVO();
		lvo.setUser_no(loginUser.getUser_no());
		lvo.setC_no(c_no);
		log.info("LikesVO lvo : "+lvo.toString());
		
		likesService.delLikes(lvo);
		
		return "redirect:/mypage";
	}
	

	/************************************************
	 * 나의 후기 조회
	 * 요청 url : http://localhost:8080/myLikesList
	***********************************************
	@GetMapping("/myReviewList")
	public String myReviewList(Model model,HttpSession session) {
		log.info("myReviewList() 호출 ");
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		List<ReviewVO> myReviewList = mypageService.myReviewList(loginUser);
		model.addAttribute("myReviewList",myReviewList);
	
		return "mypage/userMypage";
	}*/
	
	/************************************************
	 * 나의 문의 조회
	 * 요청 url : http://localhost:8080/myQnaList
	***********************************************
	@GetMapping("/myQnaList")
	public String myQnaList(@RequestParam("pageNum") int pageNum,Model model,HttpSession session) {
		log.info("myQnaList() 호출 ");
		/* 은아
		//로그인 세션
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		model.addAttribute("loginUser",loginUser);
		if(loginUser == null) {
			return "redirect:/";
		}
		
		//관심클래스 조회
		log.info("loginUser : " +loginUser.toString());
		List<ClassVO> myLikesList = mypageService.myLikesList(loginUser);
		model.addAttribute("myLikesList",myLikesList);
		
		//후기 조회
		List<ReviewVO> myReviewList = mypageService.myReviewList(loginUser);
		model.addAttribute("myReviewList",myReviewList);
		
		loginUser.setAmount(10);
		loginUser.setPageNum(pageNum);
		log.info("pageNum : "+pageNum);
		
		int qnaCnt = mypageService.myQnaCnt(loginUser);
		List<QnaVO> myQnaList = mypageService.myQnaList(loginUser);
		model.addAttribute("myQnaList",myQnaList);
		PageDTO qnaPageDto = new PageDTO(loginUser,qnaCnt);
		model.addAttribute("qnaPageMaker",qnaPageDto);
		
		
		return "mypage/userMypage";
	}*/
	
	
	
}
