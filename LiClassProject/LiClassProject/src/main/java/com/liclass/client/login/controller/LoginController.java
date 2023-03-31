package com.liclass.client.login.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.liclass.client.login.service.KakaoService;
import com.liclass.client.login.service.MailService;
import com.liclass.client.login.service.NaverService;
import com.liclass.client.login.service.UserService;
import com.liclass.client.login.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes("loginUser")
public class LoginController {
	
	@Setter(onMethod_ = @Autowired)
	private UserService userService;
	@Setter(onMethod_ = @Autowired)
	private KakaoService kakaoService;
	@Setter(onMethod_ = @Autowired)
	private NaverService naverService;
	@Setter(onMethod_ = @Autowired)
    private MailService mailService;
	
	
	/************************************************
	 * 1.회원가입 화면
	 * 요청 url : http://localhost:8080/user/signupForm
	************************************************/
	@GetMapping("/user/signupForm")
	public String signupForm() {
		log.info("signupForm() 호출");
		return "client/login/signupForm";
	}
	
	/************************************************
	 * 2.회원가입 처리
	 * 요청 url : http://localhost:8080/user/signup
	 * @throws MessagingException 
	 * @throws UnsupportedEncodingException 
	************************************************/
	@PostMapping(value ="/user/signup", produces="application/text; charset=UTF-8;")
	public String signup(@ModelAttribute UserVO vo,Model model) throws UnsupportedEncodingException, MessagingException {
		log.info("signup() 호출");
		String message ="";
		int result = userService.signup(vo);
		log.info("signup result : "+result);
		
		if(result == 1) {
			mailService.sendEmail(mailService.welcomeMessage(vo));
			message = "환영합니다, "+vo.getUser_name()+"님";
			UserVO loginUser = userService.login(vo);
			log.info("vo : " +vo.toString());
			model.addAttribute("loginUser", loginUser);
			log.info("loginUser : " +loginUser.toString());
			
			model.addAttribute("message", message);
			model.addAttribute("url", "/");
		}else {
			message = "죄송합니다. 회원가입을 다시 진행해주세요.";
			model.addAttribute("message", message);
			model.addAttribute("url", "/user/signupForm");
		}
		return "client/login/signupForm";
	}
	
	/************************************************
	 * 3.이메일 인증
	 * 요청 url : http://localhost:8080/mailCertify
	************************************************/
	@ResponseBody
	@PostMapping("/mailCertify")
	public String mailCertify(@RequestParam("email") String email,Model model) throws Exception {
		log.info("mailCertify() 호출");
		String authoKey ="";
		
		int result = userService.checkEmail(email);
		if(result == 1) {
			authoKey = "duplication";
		}else if (result == 0) {
			authoKey = mailService.sendSimpleMessage(email);
		}else {
			authoKey = "error";
		}
		return authoKey;
	}
	
	/************************************************
	 * 4.이용약관 화면
	 * 요청 url : http://localhost:8080/user/userTerms
	************************************************/
	@GetMapping("/user/userTerms")
	public String userTerms() {
		log.info("userTerms() 호출");
		return "client/login/userTerms";
	}
	
	/************************************************
	 * 5.개인정보 취급방침
	 * 요청 url : http://localhost:8080/user/userPolicy
	************************************************/
	@GetMapping("/user/userPolicy")
	public String userPolicy() {
		log.info("userPolicy() 호출");
		return "client/login/userPolicy";
	}
	
	/************************************************
	 * 6.비밀번호찾기 화면
	 * 요청 url : http://localhost:8080/user/userFindpw
	************************************************/
	@GetMapping("/user/userFindpw")
	public String userFindpw() {
		log.info("userFindpw() 호출");
		return "client/login/userFindpw";
	}
	
	/************************************************
	 * 7.비밀번호 찾으려는 이메일 확인
	 * 요청 url : http://localhost:8080/findEmail
	************************************************/
	@ResponseBody
	@PostMapping("/findEmail")
	public String findEmail(@RequestParam("email") String email,Model model) throws Exception {
		log.info("findEmail() 호출");
		String result ="";
		
		int check = userService.findEmail(email);
		if(check == 1) {
			result = "duplication";
		}else if (check == 0) {
			result = "none";
		}else {
			result = "error";
		}
		log.info("result : "+result);
		return result;
	}
	
	/************************************************
	 * 8.비밀번호찾기 처리
	 * 요청 url : http://localhost:8080/findPw
	************************************************/
	@PostMapping("/findPw")
	public String findPw(@RequestParam("user_email") String user_email,Model model) throws Exception{
		log.info("findPw() 호출");
		
		String user_pw = mailService.createKey();
		log.info("임시비밀번호 user_pw : "+user_pw);
		
		UserVO pwUpdateVo= new UserVO();
		pwUpdateVo.setUser_email(user_email);
		pwUpdateVo.setUser_pw(user_pw);
		
		int result = userService.updatePw(pwUpdateVo);
		log.info("임시비밀번호로 수정결과 result : "+result);
		
		String message ="";
		
		if(result == 1) {
			mailService.sendEmail(mailService.findPwMessage(user_pw,user_email));
			message = "발급된 임시비밀번호를 전송하였습니다. 메일을 확인해주세요. ";
			model.addAttribute("message", message);
			model.addAttribute("url", "/");
		}else {
			message = "죄송합니다. 잠시후 다시 시도해주세요.";
			model.addAttribute("message", message);
			model.addAttribute("url", "/user/userFindpw");
		}
		return "client/login/userFindpw";
	}
	
	/************************************************
	 * 9.아이디 비밀번호 확인 (로그인)
	 * 요청 url : http://localhost:8080/user/checkIdPwd
	************************************************/
	@ResponseBody
	@RequestMapping("/user/checkIdPw")
	public int checkIdPw(@ModelAttribute UserVO vo, Model model) {
		log.info("checkIdPw() 호출");
		
		int checkData = userService.checkIdPw(vo);
		model.addAttribute("checkData",checkData);
		log.info("checkIdPwd() checkData"+checkData);
		return checkData;
	}

	/************************************************
	 * 10.로그인 처리
	 * 요청 url : http://localhost:8080/user/login
	************************************************/
	@PostMapping("/user/login")
	public String login(UserVO vo,Model model,RedirectAttributes ras) {
		log.info("login() 호출");
		UserVO loginUser = userService.login(vo);
		
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
		}else {
			ras.addFlashAttribute("errorMsg", "로그인 실패");
		}
		
		log.info("loginUser : " +loginUser);
		
		return "redirect:/";
	}
	
	/************************************************
	 * 11.카카오톡 로그인
	 * 요청 url : http://localhost:8080/user/kakaoLogin
	***********************************************/
	@RequestMapping(value = "/user/kakaoLogin", method = RequestMethod.GET)
    public String kakaoLogin(@RequestParam String code, HttpSession session,Model model,RedirectAttributes ras) throws IOException {
			log.info("kakaoLogin() 호출");    
			log.info("code :: " +code);    
            
            //접속토큰 get
            String snsToken = kakaoService.getReturnAccessToken(code);
            
            //접속자 정보 get
            Map<String, Object> result = kakaoService.getUserInfo(snsToken);
            log.info("result:: " + result);
            String user_email = (String) result.get("user_email");
            String user_pw = (String) result.get("user_pw");
            String user_name = (String) result.get("user_name");
            String user_img = (String) result.get("user_img");
            int user_type = (int) result.get("user_type");
            //새 객체,UserVO새거 하나를 만들어 놓고,
            UserVO loginUser = new UserVO();
            
            //로그인 하려는 이메일이 회원테이블에 없을 시 회원가입
            if (userService.SNSLogin(user_email) == null) {
                log.warn("카카오 신규연동");
                //새객체에 신규연동한 카카오계정의 정보를 담는다.
                loginUser.setUser_email(user_email);
                loginUser.setUser_pw(user_pw);
                loginUser.setUser_name(user_name);
                loginUser.setUser_img(user_img);
                loginUser.setUser_type(user_type);
                log.info("신규연동한 카카오계정을 담은 UserVO : "+loginUser.toString());
                
                //새로 탄생한 UserVO를 테이블에 insert한다.
                userService.SNSInsert(loginUser);
                log.info("SNSInsert() 호출");
                session.setAttribute("loginUser", loginUser);
                
                //추후 로그아웃을 위한 setAttribute
                session.setAttribute("snsToken", snsToken);
             
            }else if (userService.SNSLogin(user_email) != null) { //기존연동했을 경우
            	UserVO vo = userService.SNSLogin(user_email);
            	loginUser = userService.login(vo);
            	log.info("login() 호출");
            	  session.setAttribute("loginUser", loginUser);
            	//추후 로그아웃을 위한 setAttribute
            	  session.setAttribute("snsToken", snsToken);
            }else {
            	ras.addFlashAttribute("errorMsg", "로그인 실패");
            }
            
            log.info("snsToken(kakao) : "+session.getAttribute("snsToken"));
            
        return "redirect:/";
    }
	
	
	
	/************************************************
	 * 12.네이버 로그인 화면
	 * 요청 url : http://localhost:8080/user/getNaverAuthUrl
	************************************************/
	
	// 네이버 로그인창 호출
	@RequestMapping(value = "/user/getNaverAuthUrl")
	public @ResponseBody String getNaverAuthUrl(HttpSession session) throws Exception {
		log.info("getNaverAuthUrl() 호출");
	    String reqUrl = naverService.getAuthorizationUrl(session);
	    log.info("reqUrl :: " + reqUrl);
	    return reqUrl;
	}
	
	/************************************************
	 * 13.네이버 로그인
	 * 요청 url : http://localhost:8080/user/naverLogin
	************************************************/
	//네이버 로그인 처리
	 @RequestMapping(value = "/user/naverLogin",method = { RequestMethod.GET, RequestMethod.POST })
	 public String naverLogin(HttpServletRequest request, HttpServletResponse response,RedirectAttributes ras) throws Exception{
		 log.info("naverLogin() 호출");
		 
		    HttpSession session = request.getSession();
		    String code = request.getParameter("code");
		    String state = request.getParameter("state");
		    String error = request.getParameter("error");

		    // 네이버 로그인창에서 취소버튼 눌렀을경우
		    if ( error != null ){
		        if(error.equals("access_denied")){
		            return "redirect:/";
		        }
		    }

		    OAuth2AccessToken fullToken;
		    fullToken = naverService.getAccessToken(session, code, state);
		    log.info("fullToken(naver) :: "+fullToken);
		    String snsToken = fullToken.getAccessToken();
		    String loginInfo = naverService.getUserProfile(session, fullToken);
		    log.info("loginInfo :: "+loginInfo);
		    
		    //JSON 형태로 변환
		    JSONParser jsonParser = new JSONParser();
		    JSONObject jsonobj = (JSONObject)jsonParser.parse(loginInfo);
		    JSONObject response_obj=(JSONObject)jsonobj.get("response");
		    
		    String user_email = (String)response_obj.get("email");
			String user_pw = (String)response_obj.get("id");
			String user_name = (String)response_obj.get("name");
			String user_img = (String)response_obj.get("profile_image");
		    
			UserVO loginUser = new UserVO();
			 if (userService.SNSLogin(user_email) == null) {
			 	loginUser.setUser_email(user_email);
				loginUser.setUser_pw(user_pw);
				loginUser.setUser_name(user_name);
				loginUser.setUser_img(user_img);
				loginUser.setUser_type(2);
				
				log.info("신규연동한 네이버계정 UserVO :: "+loginUser.toString());
				
				 //새로 탄생한 UserVO를 테이블에 insert한다.
	            userService.SNSInsert(loginUser);
	            log.info("SNSInsert() 호출");
	            session.setAttribute("loginUser", loginUser);
	            
			 }else if (userService.SNSLogin(user_email) != null) { //기존연동했을 경우
	            	UserVO vo = userService.SNSLogin(user_email);
	            	loginUser = userService.login(vo);
	            	log.info("login() 호출");
	            	session.setAttribute("loginUser", loginUser);
	            	 
	            	session.setAttribute("snsToken", snsToken);
	            	log.info("snsToken(naver) : "+session.getAttribute("snsToken"));
	            	
	          }else {
	            	ras.addFlashAttribute("errorMsg", "로그인 실패");
	          }
		 
		 return "redirect:/"; 
	 }
	 
	 	/************************************************
		 * 14.로그아웃
		 * 요청 url : http://localhost:8080/user/logout
		*************************************************/
		@RequestMapping("/user/logout")
		public String logout(HttpSession session,Model model) {
			log.info("logout() 호출");
			UserVO vo =(UserVO) model.getAttribute("loginUser");
			if(vo != null) {
				int user_type = vo.getUser_type();
				log.info("user_type : "+user_type);
				if(user_type == 0) { //이메일
					model.addAttribute("loginUser",null);
					session.invalidate();
				}else if(user_type == 1){ //카카오
					String access_Token = (String)session.getAttribute("snsToken");
					kakaoService.logout(access_Token);
					model.addAttribute("loginUser",null);
					session.invalidate();
				}else if(user_type == 2){ //네이버
					session.removeAttribute("snsToken");
					session.invalidate();
				}
			}
			 return "redirect:/";  
		}
		
}
