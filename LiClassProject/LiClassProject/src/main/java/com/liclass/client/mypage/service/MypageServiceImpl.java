package com.liclass.client.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liclass.client.classes.vo.ClientClassVO;
import com.liclass.client.login.vo.UserVO;
import com.liclass.client.mypage.dao.MypageDAO;
import com.liclass.client.payment.vo.PaymentVO;
import com.liclass.client.qnaboard.vo.ClientQnaBoardVO;
import com.liclass.client.review.vo.ReviewVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MypageServiceImpl implements MypageService{
	
		@Setter(onMethod_ = @Autowired)
		private MypageDAO mypageDao;
	
		/* 은아 */
		//1. 나의 관심클래스 조회
		@Override
		public List<ClientClassVO> myLikesList(UserVO vo) {
			log.info("myLikesList() 호출");
			List<ClientClassVO> list = mypageDao.myLikesList(vo);
			return list;
		}
	
		//2. 나의 관심클래스 삭제
		@Override
		public int delLikes(UserVO vo) {
			int result = mypageDao.delLikes(vo);
			return result;
		}
		
		//3. 나의 후기 조회
		@Override
		public List<ReviewVO> myReviewList(UserVO vo) {
			log.info("myReviewList() 호출");
			List<ReviewVO> list = mypageDao.myReviewList(vo);
			return list;
		}
		
		//4. 나의 문의 조회
		@Override
		public List<ClientQnaBoardVO> myQnaList(ClientQnaBoardVO vo) {
			log.info("myQnaList() 호출");
			List<ClientQnaBoardVO> list = mypageDao.myQnaList(vo);
			return list;
		}
		//5. 나의 문의 갯수
		@Override
		public int myQnaCnt(UserVO vo) {
			int result = mypageDao.myQnaCnt(vo);
			return result;
		}
				
				
		//5. 프로필 사진 수정
		@Override
		public int updateImg(UserVO vo)throws Exception {
			log.info("updateImg() 호출");
			
			int result = mypageDao.updateImg(vo);
			return result;
		}
		
		
		
		
		
		
		
		
		/* 웅배파트 */
		// 결제내역 불러오기
	   @Override
	   public List<Map<String, String>> paymentList(PaymentVO paymentVO) {
		   List<Map<String, String>> pvo = mypageDao.paymentList(paymentVO);
	      return pvo;
	   }

	   @Override
	   public int paymentListCnt(PaymentVO paymentVO) {
	      int result = mypageDao.paymentListCnt(paymentVO);
	      return result;
	   }

	   @Override
      public List<Map<String, String>> courseList(PaymentVO paymentVO_forCourseList) {
         List<Map<String, String>> pvo = mypageDao.courseList(paymentVO_forCourseList);
         return pvo;
      }



	

	
}
