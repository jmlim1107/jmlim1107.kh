package com.liclass.client.payment.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.http.MediaType;

import com.liclass.admin.episode.vo.EpisodeVO;
import com.liclass.client.classes.vo.ClientClassVO;
import com.liclass.client.login.vo.UserVO;
import com.liclass.client.payment.service.PaymentService;
import com.liclass.client.payment.vo.PaymentVO;
import com.liclass.client.payment.vo.RefundVO;
import com.liclass.client.reserve.vo.ReserveVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/payment/*")
@Slf4j
public class PaymentController {

   @Setter(onMethod_ = @Autowired)
   private PaymentService paymentSerivce;
   
   // 예약 페이지 가기
   /*@GetMapping(value="/reserve")
   public String reservePage() {
      log.info("reservePage() 호출 성공");
      
      return "reserve";
   }*/
   
   
   // 결제 페이지 가기(클래스 정보와 회원정보를 가져가야함)
   /*@RequestMapping(value="/paymentPage")
   public String paymentPage(UserVO userVO, ClientClassVO classVO, ReserveVO reserveVO, Model model){
      log.info("paymentPage() 호출 성공");
      
      // 유저정보 가져오기
      UserVO uvo = paymentSerivce.getUserInfo(userVO.getUser_no());
      model.addAttribute("uvo", uvo);
      
      // 클래스 정보 가져오기
      ClientClassVO cvo = paymentSerivce.getClassInfo(classVO.getC_no());
      model.addAttribute("cvo", cvo);
      
      // 예약정보 가져오기
      ReserveVO rvo = paymentSerivce.getPriceInfo(reserveVO.getR_no());
      model.addAttribute("rvo", rvo);
      
      return "payment";
   }*/
   
   // 결제 서버(db에 저장된 결제금액과 api에서 실제로 빠져나간 결제금액을 비교하여 검증 후 처리)
   @ResponseBody
   @RequestMapping(value="/callback_receive", consumes = "application/json", produces=MediaType.APPLICATION_JSON_VALUE)
   public Map<String, String> callback_receive(@RequestBody Map<String, Object> model, Model model2){
      log.info("callback_receive() 호출 성공");
      Map<String, String> paymentData = new HashMap<>();
      // 값 받아오기
      String goUrl = null;
      String pay_method = (String)model.get("pay_method");
      String merchant_uid = (String)model.get("merchant_uid");
      String pay_pg = (String)model.get("pay_pg");
      Long user_no = (Long)model.get("user_no");
      String pay_name = (String)model.get("pay_name");
      String pay_buyer_name = (String)model.get("pay_buyer_name");
      String pay_buyer_tel = (String)model.get("pay_buyer_tel");
      Integer r_no = (Integer)model.get("r_no");
      String pay_buyer_email = (String)model.get("pay_buyer_email");
      Integer pay_price = (Integer)model.get("pay_price");
      String imp_uid = (String)model.get("imp_uid");
      boolean success = (Boolean)model.get("success");
      String error_msg = (String)model.get("error_msg");
      
      // 결제 시스템
      int result = paymentSerivce.callback_receive(success, imp_uid, error_msg, pay_price);
      System.out.println("result="+result);
      
      // 실제 결제 금액 가져오기
      int price = paymentSerivce.getPrice(success, imp_uid, error_msg);
      
      // 받아온 값 vo에 넣어주기
      PaymentVO paymentVO = new PaymentVO();
      paymentVO.setPay_pg(pay_pg);
      paymentVO.setMerchant_uid(merchant_uid);
      paymentVO.setPay_method(pay_method);
      paymentVO.setPay_name(pay_name);
      paymentVO.setPay_price(price);
      paymentVO.setPay_buyer_email(pay_buyer_email);
      paymentVO.setPay_buyer_name(pay_buyer_name);
      paymentVO.setPay_buyer_tel(pay_buyer_tel);
      paymentVO.setUser_no(user_no);
      paymentVO.setR_no(r_no);
      
      paymentData.put("merchant_uid", paymentVO.getMerchant_uid());
      
      int pay_status = 0; // 결제 상태 바꿔주기 위한 변수  0:결제완료  1:결제실패  2:결제취소  3:환불
      int r_state = 1; // 예약 상태 바꿔주기 위한 변수  1:예약중  2:예약완료  3:예약실패취소환불 
      if(result == 0) { // *** 결제가 완료가 되면 결제내역에 merchant_uid을 hidden으로 남기기 ***   결제 완료
         // 결제 테이블 저장
         r_state = 2;
         paymentVO.setPay_status(pay_status);
         paymentSerivce.inserPayment(paymentVO);
         paymentSerivce.changeRerserveStatus(r_no, r_state);
         goUrl = "/payment/paySuccess"; // 결제 완료 페이지로 이동
         paymentData.put("goUrl", goUrl);
      }else if(result == 1){   // 결제 실패 1. db와 실페지불금액의 가격이 다름 2. 프로그램 상에 이유로 결제 실패(결제가 아마 안될거임)
         pay_status = 1;
         r_state = 3;
         paymentVO.setPay_status(pay_status);
         paymentSerivce.inserPayment(paymentVO);
         paymentSerivce.changeRerserveStatus(r_no, r_state);
         System.out.println("결제 실패"); 
         goUrl = "/"; // 다시 결제페이지로 이동 or 홈으로 이동
         paymentData.put("goUrl", goUrl);
      }else {               // 결제 취소 1. 결제 시스탬(아임포트)와 연결도중 실패로 인한 취소(결제가 아마 안될거임)
         pay_status = 2;
         r_state = 3;
         paymentVO.setPay_status(pay_status);
         paymentSerivce.inserPayment(paymentVO);
         paymentSerivce.changeRerserveStatus(paymentVO.getR_no(), r_state);
         System.out.println("결제 취소");
         goUrl = "/"; // 다시 결제페이지로 이동 or 홈으로 이동
         paymentData.put("goUrl", goUrl);
      }
      return paymentData;
   }
   
   // 결제 도중 취소
   @PostMapping("/justCancel")
   public String justCancel(@RequestParam("r_no") int r_no, Model model) {
      log.info("justCancel() 호출 성공");
      int r_state = 3;
      paymentSerivce.changeRerserveStatus(r_no, r_state);
      
      return "home"; // 리스트 상세페이지로 다시 이동
   }
   
   // 환불처리
   @RequestMapping(value="/payCencel")
   public String payCencel(@RequestParam("merchant_uid") String merchant_uid, @RequestParam("user_no") long user_no) { // 버튼 누른 그 목록의 merchant_uid를 가져와야함. 지금은 테스트라 내가 설정해줌
      log.info("payCencel() 호출 성공");
      String goUrl = null;
      RefundVO refundVO = new RefundVO();
      
      PaymentVO paymentInfo = paymentSerivce.getPaymentInfo(merchant_uid);
      
      int result = paymentSerivce.payCencel(merchant_uid, paymentInfo.getPay_price());
      refundVO.setMerchant_uid(merchant_uid);
      refundVO.setRefund_method(paymentInfo.getPay_method());
      refundVO.setRefund_price(paymentInfo.getPay_price());
      refundVO.setUser_no(user_no);
      int refund_status = 0;  // 결제 상태 0 = 환불 성공, 1 = 환불 실패
      
      if(result == 0) { // 환불상태 0 , 결제상태 3
         int r_state = 3;
         refundVO.setRefund_status(refund_status);
         paymentSerivce.changeRerserveStatus(paymentInfo.getR_no(), r_state);
         paymentSerivce.changePaymentStatus(merchant_uid);
         paymentSerivce.insertRefund(refundVO);
         goUrl = "mypage/userMypage"; // 환불 완료 페이지
      }else {
         refund_status = 1;
         refundVO.setRefund_status(refund_status);
         paymentSerivce.insertRefund(refundVO);
         System.out.println("환불 실패");
         goUrl = "/";
      }
      return goUrl; // 다시 mypage로 가면 데이터가 안나온다..
   }
   
   // 성공했을 때 페이지
   @RequestMapping(value="/paySuccess")
   public String paySuccess( ReserveVO reserveVO, Model model, PaymentVO paymentVO) {
      log.info("paySuccess() 호출 성공");
      
      // 유저정보 가져오기
      UserVO uvo = paymentSerivce.getUserInfo(reserveVO.getUser_no());
      model.addAttribute("uvo", uvo);
      
      // 클래스 정보 가져오기
      //ClientClassVO cvo = paymentSerivce.getClassInfo(classVO.getC_no());
      //model.addAttribute("cvo", cvo);
      
      // 예약정보 가져오기
      ReserveVO rvo = paymentSerivce.getPriceInfo(reserveVO.getR_no());
      model.addAttribute("rvo", rvo);
      
      // 회차정보 가져오기
      //EpisodeVO evo = paymentSerivce.getEpisodeInfo(rvo.getEp_no());
      //model.addAttribute("evo", evo);
      
      PaymentVO pvo = paymentSerivce.getPaymentInfo(paymentVO.getMerchant_uid());
      model.addAttribute("pvo", pvo);
      
      return "client/mypage/paySuccess";
   }
   
   @ResponseBody
   @RequestMapping(value="/getPaymentInfo", produces=MediaType.APPLICATION_JSON_VALUE)
   public Map<String, String> getPaymentInfo(@RequestParam("merchant_uid")String merchant_uid, Model model) {
      System.out.println(merchant_uid);
      
      PaymentVO payvo = paymentSerivce.getPaymentInfo(merchant_uid);
      Map<String, String> pvo1 = new HashMap<>();
      pvo1.put("merchant_uid", payvo.getMerchant_uid());
      pvo1.put("pay_name", payvo.getPay_name());
      pvo1.put("pay_pg", payvo.getPay_pg());
      pvo1.put("pay_method", payvo.getPay_method());
      pvo1.put("pay_date", payvo.getPay_date());
      
      return pvo1;
   }
   
}