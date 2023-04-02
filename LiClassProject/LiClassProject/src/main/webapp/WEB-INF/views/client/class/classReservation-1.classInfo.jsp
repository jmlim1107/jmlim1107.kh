<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 은아) 클래스 상세페이지 예약네비1. 클래스정보 --%>	
<script>

	//right nav
	var quick_menu = $('#sticky-nav');
	var quick_top = 200;
	
	quick_menu.css('top', $(window).height() );
	$(document).ready(function(){
	quick_menu.animate( { "top": $(document).scrollTop() + quick_top +"px" }, 200 ); 
	$(window).scroll(function(){
	quick_menu.stop();
	quick_menu.animate( { "top": $(document).scrollTop() + quick_top + "px" }, 500 );
	});
	});
	
	$(function(){
		var c_no = "${clientClassDetail.c_no}";
		var user_no = $("#user-info").data("num");
		
		//하트 클릭
		 $(".like").click(function(){
			var likeId = $(this).attr("id");
			console.log(likeId);
			if(likeId == "loginLike"){
				alert("로그인 후 이용해주세요.");
				return;
			}else if(likeId == "addLike"){
				console.log(likeId);
				$.ajax({
					type : "POST",
					url : "/addLikes",
			        data: {
						c_no : c_no,
						user_no : user_no
					},
					success : function(result){
						if(result == 1){
						 	alert("관심클래스에 추가되었습니다.");
						}else{
							alert("잠시후에 다시 시도해주세요.");
						} 
						document.location.reload();
					}
				 });
			}else if(likeId == "delLike"){
				if(confirm("관심클래스에서 삭제하시겠습니까?")){
					console.log(likeId);
					$.ajax({
						type : "POST",
						url : "/delLikes",
				        data: {
				        	c_no : c_no,
							user_no : user_no
						},
						success : function(result){
							if(result == 1){
								alert("관심클래스에서 삭제되었습니다.");
							}else{
								alert("잠시후에 다시 시도해주세요.");
							} 
							document.location.reload();
						}
					 });
				}
			}  
			
		});
		
		//공유하기
		$("#sns-share-btn").click(function(){
			let shareCss = $("#sns-share-div").css("visibility");
			if(shareCss == "hidden"){
				$("#sns-share-div").css("visibility","visible");
			}else{
				$("#sns-share-div").css("visibility","hidden");
			}
		});
	})

</script>
		<input type="hidden" id="class-info" data-num="${clientClassDetail.c_no }" />
		<input type="hidden" id="user-info" data-num="${loginUser.user_no }" />
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
            <h3 class="tour-form-title"> </h3>
        </div>
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="form-group"></div>
        </div>
        <!-- 1. 난이도  -->
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="form-group">
                <label class="control-label required" for="booking_by">난이도 
		     	<c:if test = "${clientClassDetail.c_level eq '상'}">
				<i class="fa-solid fa-star"></i>
				<i class="fa-solid fa-star"></i>
				<i class="fa-solid fa-star"></i>
				<i class="fa-solid fa-star"></i>
				<i class="fa-solid fa-star"></i>
			</c:if>
			<c:if test = "${clientClassDetail.c_level eq '중'}">
				<i class="fa-solid fa-star"></i>
				<i class="fa-solid fa-star"></i>
				<i class="fa-solid fa-star-half-stroke"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
			</c:if>
			<c:if test = "${clientClassDetail.c_level eq '하'}">
				<i class="fa-solid fa-star"></i>
				<i class="fa-solid fa-star"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
			</c:if>
		      	</label>
		    </div>
		 </div>
		 <!-- 2. 소요시간  -->
          <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
              <div class="form-group">
                  <label class="control-label required" for="booking_by">수업시간 ${clientClassDetail.c_leadtime}시간</label>
              </div>
          </div>
		  <!-- 3. 최소/최대인원  -->
          <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
              <div class="form-group">
                  <label class="control-label required" for="type">최대인원 ${clientClassDetail.c_maxcnt} 명</label>
              </div>
          </div>
          <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
              <div class="form-group">
                  <label class="control-label required" for="type">최소인원 ${clientClassDetail.c_mincnt} 명</label>
              </div>
          </div>
          <!-- 4. 관심클래스 등록수  -->
         <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
             <div class="form-group">
                 <label class="control-label required" for="type">관심수 ${clientClassDetail.c_luv}</label>
             </div>
         </div>
         
         <!-- 5. 관심클래스,공유하기 -->
	      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		      <c:if test="${loginUser == null}">
		      		<button type="button" class="main-white-button like" id="loginLike" style="margin: 0px 5px;">
						<i class="fa-solid fa-heart-circle-plus"></i>
					</button>
		      </c:if>
		      <c:if test="${loginUser != null}">
				<c:if test="${checkResult eq 1}">
					<button type="button" class="main-white-button like" id="delLike" style="margin: 0px 5px;">
						<i class="fa-solid fa-heart-circle-check" style="color:#f96868e6;" ></i>
					</button>
				</c:if>
				<c:if test="${checkResult eq 0}">
					<button type="button" class="main-white-button like" id="addLike" style="margin: 0px 5px;">
						<i class="fa-solid fa-heart-circle-plus"></i>
					</button>
				</c:if>
				</c:if>
				<a id="sns-share-btn" style="margin: 0px 20px;">
              		<label class="control-label required" for="type"><i class="fa-solid fa-share-nodes"></i></label>
              	</a>
		  </div>
          <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" id="sns-share-div" style="visibility:hidden;">
              <div class="form-group" style="margin:5px 0px; background: #55555514; border-radius: 11em; width: fit-content;">
              	<a id="kakao-link-btn" href="javascript:kakaoShare()" style="margin: 0px 20px;"><i class="fa-solid fa-comment" style="color:#FAE64D;"></i></a>
				<a id="twitter-link-btn" href="javascript:shareTwitter()" style="margin: 0px 20px;"><i class="fa-brands fa-twitter"></i></a>
				<a id="facebook-link-btn" href="javascript:shareFacebook()" style="margin: 0px 20px;"><i class="fa-brands fa-facebook-f" style="color:#415893;"></i></a>
				<a id="naver-link-btn" href="javascript:shareNaver()" style="margin: 0px 20px;"><i class="fa-solid fa-n" style="color:#5ECC69;"></i></a>
				<a id="copy-btn" href="javascript:copy()"><i class="fa-solid fa-link" style="color:#555; margin: 0px 20px;"></i></a>
              </div>
          </div>
          