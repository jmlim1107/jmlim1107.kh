<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 지민 클래스 리스트 관련 설정 -->
<link rel="stylesheet" href="/resources/class/css/classList.css" />
<script type = "text/javascript" src = "/resources/class/js/classList.js" /></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link href='https://fonts.googleapis.com/css?family=Lato:400,300,700' rel='stylesheet' type='text/css'>
	<style>
		.classContent{
			margin-top: 10px;
			text-overflow: ellipsis;  
			overflow : hidden;
			display: -webkit-box;
		        -webkit-line-clamp: 2;
		        -webkit-box-orient: vertical;
		}
		.goClassDetail{
			cursor: pointer;
		}
	
	</style>
	<script>
    	$(function(){
    		//클래스 리스트에서 제목 클릭 시 이동
    		$(".goClassDetail").click(function(){
    			let c_no = $(this).data('num');
    			location.href="/class/classDetail?c_no="+c_no;
    		});
    	});
    </script>
    <script> 
	
	// 채팅봇 플러그인
	(function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.")}var ch=function(){ch.c(arguments)};ch.q=[];ch.c=function(args){ch.q.push(args)};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x)}}if(document.readyState==="complete"){l()}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l)}})();

	  ChannelIO('boot', {
	    "pluginKey": "4674cd17-2f5e-4a53-bbd2-53cd1c600040"
	  });

	//heart 좋아요 클릭시! 하트 애니메이션
	  $(function(){
		  
		  let user_no = $(".login-info").data("num");
		  let c_no = $(".goClassDetail").data("num");
		  console.log("loginUser.user_no : "+user_no);
		  console.log("classes.c_no : "+c_no);
		  
		  $('.icon.heart').click(function(){
		  		if(user_no != ""){
	        	  var $likeBtn = $(this);
    			  $.ajax({
    					type : "POST",
    					url : "/like",
    					data : {
    						"c_no" : c_no,
    						"user_no" : user_no
    					},success : function(checkResult){
    						console.log(" checkResult : "+checkResult);
    						 if(checkResult == 0){ //추가
    							 $likeBtn.find('img').attr({
    					                'src': 'https://cdn-icons-png.flaticon.com/512/803/803087.png',
    					                 alt:'찜하기 완료'
  					                  });
    						}else if(checkResult == 1){//삭제
    							$likeBtn.find('i').removeClass('fas').addClass('far')
  					             	$likeBtn.find('img').attr({
  					                	'src': 'https://cdn-icons-png.flaticon.com/512/812/812327.png',
  					                	alt:"찜하기"
  					            	 });
    						}else{
    							alert("잠시후에 다시 시도해주세요.");
    						} 
    					}
  					 });
    		  }else{
    			  alert("로그인 후 이용해주세요.");
    		  }
		  });
		 
	  });
	</script>
	<style>
	
	
	</style>
	
	<!-- 은아) 로그인 유저 확인용 -->
    <input type="hidden" class="login-info" data-num="${loginUser.user_no }" />
    
    <!-- 지민) 클래스 리스트 시작 -->
    <div class="container pt-5">
    	<div class="row">
        	<div class="col-md-8 order-md-2 col-lg-9">
            	<div class="container-fluid">
	           	<!-- 드롭다운 메뉴 시작 -->
	             <div class="row   mb-5">
	               <div class="col-12">
	                   
	                   <div id = "prodeuct_order_list">
	                   <label class="mr-2">Sort by:</label>
		                   <a href="javascript:recentlist();">최신순 | </a>
		                   <a href="javascript:likelist();">인기순</a>
	                   </div>
	               </div>
	             </div>
	             <!-- 드롭다운 메뉴 끝 -->
             
	            <div class="row">
	           		<c:choose>
		           		<c:when test="${not empty classList}">
			           		<c:forEach var = "classes" items="${classList}" varStatus="status">
								<!-- 공예 -->
								<c:if test = "${classes.c_category eq 0}">
								<div class="col-6 col-md-6 col-lg-4 mb-3 list0">
									<%@ include file = "/WEB-INF/views/client/class/All.jsp" %>
								</div>
								</c:if>
								
								<!-- 요리 -->
								<c:if test = "${classes.c_category eq 1}">
								<div class="col-6 col-md-6 col-lg-4 mb-3 list1">
									<%@ include file = "/WEB-INF/views/client/class/All.jsp" %>
								</div>
								</c:if>
								
								<!-- 미술 -->
								<c:if test = "${classes.c_category eq 2}">
								<div class="col-6 col-md-6 col-lg-4 mb-3 list2">
									<%@ include file = "/WEB-INF/views/client/class/All.jsp" %>
								</div>
								</c:if>
								
								<!-- 플라워 -->
								<c:if test = "${classes.c_category eq 3}">
								<div class="col-6 col-md-6 col-lg-4 mb-3 list3">
									<%@ include file = "/WEB-INF/views/client/class/All.jsp" %>
								</div>
								</c:if>
								
								<!-- 뷰티 -->
								<c:if test = "${classes.c_category eq 4}">
								<div class="col-6 col-md-6 col-lg-4 mb-3 list4">
									<%@ include file = "/WEB-INF/views/client/class/All.jsp" %>
								</div>
								</c:if>
								
								<!-- 기타 -->
								<c:if test = "${classes.c_category eq 5}">
								<div class="col-6 col-md-6 col-lg-4 mb-3 list5">
									<%@ include file = "/WEB-INF/views/client/class/All.jsp" %>
								</div>
								</c:if>
			           			</c:forEach>
		           			</c:when>
	         			</c:choose>
	            	</div>
	        	</div>
	        </div> 
		    <!-- 사이드바 시작 -->
		    <div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;" id = "sidebar">
		  		<a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
		    		<svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
		    		<span class="fs-4">카테고리</span>
		  		</a>
		  		<hr>

		  		<!-- 카테고리명 나중에 c 태그로 반복시킬 예정(카테고리가 번호로 나온다.) -->
		  		<ul class="nav nav-pills flex-column mb-auto">
		    		<li class="nav-item">
			      		<a href="#" class="nav-link link-dark" aria-current="page" id = "category_All">
			       		<svg class="bi me-2" width="16" height="16"></svg>
			        	전체
			      		</a>
		    		</li>
				    <li>
				      <a href="#" class="nav-link link-dark" id = "category_gong">
				        <svg class="bi me-2" width="16" height="16"><use xlink:href="#"></use></svg>
				       	공예
				      </a>
				    </li>
				    <li>
				      <a href="#" class="nav-link link-dark" id = "category_cooking">
				        <svg class="bi me-2" width="16" height="16"><use xlink:href="#"></use></svg>
				       	요리
				      </a>
				    </li>
				    <li>
				      <a href="#" class="nav-link link-dark" id = "category_art">
				        <svg class="bi me-2" width="16" height="16"><use xlink:href="#"></use></svg>
				        미술
				      </a>
				    </li>
				     <li>
				      <a href="#" class="nav-link link-dark" id = "category_flower">
				        <svg class="bi me-2" width="16" height="16"><use xlink:href="#"></use></svg>
				        플라워
				      </a>
				    </li>
				     <li>
				      <a href="#" class="nav-link link-dark" id = "category_beauty">
				        <svg class="bi me-2" width="16" height="16"><use xlink:href="#"></use></svg>
				        뷰티
				      </a>
				    </li>
				     <li>
				      <a href="#" class="nav-link link-dark" id = "category_etc">
				        <svg class="bi me-2" width="16" height="16"><use xlink:href="#"></use></svg>
				        체험 및 기타
				      </a>
				    </li>
		  		</ul>
	      	</div>
	     </div>
      </div>
    
    
	
	