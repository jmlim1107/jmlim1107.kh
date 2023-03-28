package com.liclass.client.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.liclass.client.classes.vo.ClassVO;
import com.liclass.client.login.vo.UserVO;
import com.liclass.client.payment.vo.PaymentVO;
import com.liclass.client.qnaboard.vo.QnaVO;
import com.liclass.client.review.vo.ReviewVO;

@Mapper
public interface MypageDAO {
	
		/* 은아 */
		//1. 나의 관심클래스 조회
		public List<ClassVO> myLikesList(UserVO vo);
		
		//2. 나의 관심클래스 삭제
		public int delLikes(UserVO vo);
		
		//3. 나의 후기 조회
		public List<ReviewVO> myReviewList(UserVO vo); 
		
		//4. 나의 문의 조회
		public List<QnaVO> myQnaList(QnaVO vo); 
		
		//5. 나의 문의 갯수 
		public int myQnaCnt(UserVO vo);
		
		//5. 프로필사진 수정
		public int updateImg(UserVO vo) throws Exception;
	
		
		
		
		/* 웅배 */
       // 결제내역 불러오기
       public List<Map<String, String>> paymentList(PaymentVO paymentVO);

       public int paymentListCnt(PaymentVO paymentVO);
       
       public List<Map<String, String>> courseList(PaymentVO pvo);
}
