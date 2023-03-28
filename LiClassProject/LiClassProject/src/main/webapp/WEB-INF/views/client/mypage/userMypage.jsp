<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/resources/client/mypage/assets/js/pwExp.js"></script>
<link rel="stylesheet" href="/resources/client/mypage/assets/css/pwExp.css" />
<style type="text/css">
  .mypageLi{display:none;}
  .active{display:block;}
  .nacc{width:900px;} 
</style> 
<script>
	$(function(){
		// alert message
		if('${message}' != ""){
			var message = "${message}" ;
			console.log(message);
			if(message == "pwOverExp"){
					var popup1 = getCookie('popup1');

		            // 변수가 없을경우 팝업 출력 
		            if (!popup1) {
		                popUpAction('popup1');
		            }
			}else{
				alert(message);
			}
		}
	});
</script>
	<!--password expiration alert modal start  -->
	<div class="modal" id="pwOverExp-modal" >
	   <a id="kakao-link-btn" href="javascript:kakaoShare()"><i class="fa-solid fa-comment" style="color:#FAE64D;"></i></a>
	   <a id="twitter-link-btn" href="javascript:shareTwitter()"><i class="fa-brands fa-twitter"></i></a>
	   <a id="facebook-link-btn" href="javascript:shareFacebook()"><i class="fa-brands fa-facebook-f" style="color:#415893;"></i></a>
	   <a id="naver-link-btn" href="javascript:shareNaver()" ><i class="fa-solid fa-n" style="color:#5ECC69;"></i></a>
	   <a id="copy-btn" href="javascript:copy()"><i class="fa-solid fa-link" style="color:#555;"></i></a>
	</div>
	<div class="main_notice_pop" name="popup1" style="position:fixed; left:60%; top:10%; display:none; z-index:999;">
	    <div id="alert-popup" style="">
	    	<h3><i class="fa-solid fa-bell" style="font-size: 16px;"></i> ${loginUser.user_name}님, </h3>
	    	<p>비밀번호 변경일로부터 90일이 경과되었습니다.</p> 
	    	<p>소중한 개인정보를 보호하기 위해 안전한 <br/>비밀번호로 변경해 주세요.</p>
	    </div>         
	    <a href="#" class="btn_close"><i class="fa-solid fa-circle-xmark" style="font-size: 20px; color:black;"></i></a> <br> 
	    <input type="checkbox" name="today_close1" /> 오늘만 이 창을 열지 않음
	</div> 
	<!--password expiration alert modal end  -->  
		 
	<div class="popular-categories">
	    <div class="container">
	      <div class="row">
		  <div class="popular-categories">
		       <div class="col-lg-12">
		         <div class="section-heading">
		         </div>
		       </div>
		       <div class="col-lg-12">
		         <div class="naccs">
		           <div class="grid">
		             <div class="row">
		               <div class="col-lg-3">
		                 <div class="menu">
		                   <div class="first-thumb active point">
		                  	<div class="thumb">
		                       <span class="icon"><img class="icon-img" src="/resources/client/mypage/assets/images/search-icon-01.png" alt=""></span>
		                       Profile
		                  	</div>
		                   </div>
		                   <div class="point">
		                     <div class="thumb">                 
		                       <span class="icon"><img class="icon-img" src="/resources/client/mypage/assets/images/search-icon-03.png" alt=""></span>
		                       Payment
		                     </div>
		                   </div>
		                   <div class="point">
		                     <div class="thumb">                 
		                       <span class="icon"><img class="icon-img" src="/resources/client/mypage/assets/images/search-icon-05.png" alt=""></span>
		                       Review
		                     </div>
		                   </div>
		                  <div class="point">
		                     <div class="thumb" id="myLikes">                 
		                       <span class="icon"><img class="icon-img" src="/resources/client/mypage/assets/images/search-icon-04.png" alt=""></span>
		                       Likes
		                     </div>
		                   </div>
		                   <div class="last-thumb point">
		                     <div class="thumb">                 
		                       <span class="icon"><img class="icon-img" src="/resources/client/mypage/assets/images/search-icon-06.png" alt=""></span>
		                       Q&A
		                     </div>
		                   </div>
		                 </div>
		               </div> 
		               <div class="col-lg-9 align-self-center">
		                 <ul class="nacc">
		                 
	                 	   <!-- 1. my profile start -->
	                   	   <li class="mypageLi active">
	                  			<%@ include file="/WEB-INF/views/client/mypage/myProfileHistory.jsp" %>
	                       </li>
	                       <!-- 1. my profile end -->
		                     
		                   <!-- 2. my payment start -->
		                   <li class="mypageLi">
		                     <%@ include file="/WEB-INF/views/client/mypage/myPaymentHistory.jsp" %>
		                   </li>
		                   <!-- 2. my payment end -->
		                   
		                   <!-- 3. my review start -->
		                   <li class="mypageLi">
		                     <%@ include file="/WEB-INF/views/client/mypage/myReviewHistory.jsp" %>
		                   </li>
		                   <!-- 3. my review end -->
		                   
		                   <!-- 4. my likes start -->
		                    <li class="mypageLi">
		                     <%@ include file="/WEB-INF/views/client/mypage/myLikesHistory.jsp" %>
		                   </li>
		                   <!-- 4. my likes end -->
		                   
		                   <!-- 5. my QnA start -->
		                   <li class="mypageLi">
		                      <%@ include file="/WEB-INF/views/client/mypage/myQnAHistory.jsp" %>
	                  	  </li>
	                  	  <!-- 5. my QnA end -->
	         		   </ul>
	               </div>          
	             </div>
	           </div>
	         </div>
	 		</div> 
		 </div>
	   </div>
	  </div>
	</div>
	<!-- -------------------------------------------------------------------------------- -->
	<!-- jQuery Modal -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />