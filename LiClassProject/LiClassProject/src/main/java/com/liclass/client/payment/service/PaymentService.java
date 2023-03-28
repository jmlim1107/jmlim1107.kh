package com.liclass.client.payment.service;

import com.liclass.admin.episode.vo.EpisodeVO;
import com.liclass.client.classes.vo.ClassVO;
import com.liclass.client.payment.vo.PaymentVO;
import com.liclass.client.payment.vo.RefundVO;
import com.liclass.client.reserve.ReserveVO;
import com.liclass.client.login.vo.UserVO;

public interface PaymentService {
   
   public int callback_receive(boolean success, String imp_uid, String error_msg, Integer pay_price);

   public int getPrice(boolean success, String imp_uid, String error_msg);

   public int payCencel(String merchant_uid, int dbPrice);

   
   public UserVO getUserInfo(long user_no);
   public ClassVO getClassInfo(int c_no);
   public ReserveVO getPriceInfo(int r_no);

   
   public int inserPayment(PaymentVO paymentVO);

   public UserVO getUserId(String user_email);

   public int changeRerserveStatus(int r_no, int r_state);

   public PaymentVO getPaymentInfo(String merchant_uid);

   public int insertRefund(RefundVO refundVO);

   public int changePaymentStatus(String merchant_uid);

   public EpisodeVO getEpisodeInfo(int ep_no);


}