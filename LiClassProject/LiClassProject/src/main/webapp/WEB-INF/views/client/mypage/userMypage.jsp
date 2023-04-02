<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 마이페이지 - 1. 첫화면 -->
<!--은아) 비밀번호 만료 알림 js,css  -->
<script src="/resources/client/mypage/assets/js/pwExp.js"></script>
<link rel="stylesheet" href="/resources/client/mypage/assets/css/pwExp.css" />
<style type="text/css">
  .mypageLi{display:none;}
  .active{display:block;}
  .nacc{width:900px;} 
</style> 
<script>
	$(function(){
		/* 은아)마이페이지 redirect 시 전달메시지 있을 때 */
		if('${message}' != ""){
			var message = "${message}" ;
			console.log("message : "+message);
			
			/* 은아) 비밀번호 만료시 알림 */	
			if(message == "pwOverExp"){
					var pwOverExp = getCookie('pwOverExp');
					console.log("pwOverExp : " +pwOverExp);
		            if (!pwOverExp) 
		                popUpAction('pwOverExp');
			}else
				alert(message);
		
			// 닫기버튼 클릭 이벤트 
	        $('.btn_close').click(function () {
	            $(this).parent('.main_notice_pop').fadeOut();

	            // 오늘하루 보지않기 체크 확인 
	            if ($("input:checkbox[name=today_close1]").is(":checked") == true) {
	                setCookie00('pwOverExp', "notoday", 1);
	            }

	            // name으로 해당 팝업창 닫기 
	            $(this).parent("div[name=" + name + "]").fadeOut();
	        })
	        
		}
	
		//마이페이지 로딩 시 activePosition에 따라 보여질 시작메뉴 지정
		var activePosition = localStorage.getItem("activePosition");
		console.log("get activePosition : "+activePosition);
		
		if(typeof activePosition != "undefined" && activePosition != null && activePosition != ""){
		      if (!$(this).is("active")) {
		          $(".naccs .menu div").removeClass("active");
		          $(".naccs ul .mypageLi").removeClass("active");
		
		          $(this).addClass("active");
		          $(".naccs ul").find(".mypageLi:eq(" + activePosition + ")").addClass("active");
		          $(".naccs .menu").find(".point:eq(" + activePosition + ")").addClass("active");
		
		          var listItemHeight = $(".naccs ul")
		            .find(".mypageLi:eq(" + activePosition + ")")
		            .innerHeight();
		          $(".naccs ul").height(listItemHeight + "px");
		        }
		}
	});
</script>
<div id="gotop"></div>
	<!--은아) 비밀번호 만료알림창  -->
	<!--password expiration alert modal start  -->
	<div class="main_notice_pop" name="pwOverExp" style="position:fixed; left:60%; top:25%; display:none; z-index:1;">
	    <div id="alert-popup" style="">
	    	<h3><i class="fa-solid fa-bell" style="font-size: 16px;"></i> ${loginUser.user_name}님, </h3>
	    	<p>비밀번호 변경일로부터 90일이 경과되었습니다.</p> 
	    	<p>소중한 개인정보를 보호하기 위해 안전한 <br/>비밀번호로 변경해 주세요.</p>
	    </div>         
	    <a href="#" class="btn_close"><i class="fa-solid fa-circle-xmark" style="font-size: 20px; color:black;"></i></a> <br> 
	    <label class="nottoday"><input type="checkbox" class="nottoday" name="today_close1" /> 오늘만 이 창을 열지 않음</label>
	</div> 
	<!--password expiration alert modal end  -->  
	
	<!--은아)마이페이지 좌측 메뉴 nav  -->
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
		             
		               <div class="col-lg-3" style="margin-top : -49px;">
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
		           <!--은아)마이페이지 좌측 메뉴 nav  -->  
		            
	               <!-- 우측 탭메뉴 시작 -->
	               <div class="col-lg-9 align-self-center" style="top: -280px;">
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
	               <!-- 우측 탭메뉴 종료 -->      
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