<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	#sticky-nav{
	width:30%;
	height: 70%;
	z-index:1;
}

.main-white-button a {
  display: inline-block;
  background-color: #fff;
  font-size: 15px;
  font-weight: 400;
  color: black;
  text-transform: capitalize;
  padding: 12px 25px;
  border-radius: 7px;
  letter-spacing: 0.25px;
  transition: all .3s;
}

.main-white-button a i {
  margin-right: 10px;
  width: 22px;
  height: 22px;
  background-color: #555;
  color: #fff;
  border-radius: 50%;
  display: inline-block;
  text-align: center;
  font-size: 12px;
  line-height: 22px;
}

.main-white-button a:hover {
  background-color: #555;
  color: #fff;
}
</style>
<script>
$(function(){
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


	//하트 클릭
	$(".like").click(function(){
		let user_no = $(".login-info").data("num");
		if(user_no == 0){
			alert("로그인 후 이용해주세요.");
		}else{
			$.ajax({
				type : "POST",
				url : "/like",
				data : {
					"c_no" : $(".class-content").data("num"),
					"user_no" : $(".login-info").data("num")
				},success : function(result){
					/* if(result == "추가"){
					 	alert("관심클래스에 추가되었습니다.");
					}else if(result == "삭제"){
						alert("관심클래스에서 삭제되었습니다.");
					}else{
						alert("잠시후에 다시 시도해주세요.");
					} */
					document.location.reload();
				}
				 });
		}
		});
});

</script>
			
				<div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb30">
                        <div class="class-booking-form">
                            <form>
                                <div class="row">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                        <h3 class="tour-form-title"> </h3>
                                    </div>
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                        </div>
                                    </div>
                                   <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                            <label class="control-label required" for="booking_by">난이도 ${classDetail.c_level}</label>
                                        </div>
                                    </div>
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                            <label class="control-label required" for="booking_by">수업시간 ${classDetail.c_leadtime}</label>
                                        </div>
                                    </div>
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                            <label class="control-label required" for="type">최대인원 ${classDetail.c_maxcnt}</label>
                                            <label class="control-label required" for="type">최소인원 ${classDetail.c_mincnt}</label>
                                        </div>
                                    </div>

                                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                            <label class="control-label required" for="address">지역 ${classDetail.c_area}</label>
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                        </div>
                                    </div>
                                      <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt30">
                                    </div>
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                       <c:if test="${loginUser == null}">
								      	<button type="button" class="main-white-button"><a class="like"><i class="fa-regular fa-heart" ></i>찜하기</a></button>
							         </c:if>
							          <c:if test="${loginUser != null}">
							          	<c:if test="${checkResult eq 0}">
								      		<button type="button" class="main-white-button"><a class="like"><i class="fa-regular fa-heart"></i>찜하기</a></button>
								      	</c:if>
								      	<c:if test="${checkResult eq 1}">
								      		<button type="button" class="main-white-button"><a class="like"><i class="fa-solid fa-heart"></i>찜하기</a></button>
								      	</c:if>
							         </c:if>
                                        <button type="button" class="main-white-button"><a href="#sns-share" rel="modal:open"><i class="fa-solid fa-share-nodes"></i>공유하기</a></button>
                                        <button type="button" class="main-white-button"><a><i class="fa-regular fa-hand-point-up"></i>예약하기</a></button>
                                  		
      	
								      	<!-- sns share modal start  --> 
								      	<div class="modal" id="sns-share" style="z-index: 2; position: initial; text-align: center;">
											   <a id="kakao-link-btn" href="javascript:kakaoShare()"><i class="fa-solid fa-comment" style="color:#FAE64D;"></i></a>
											   <a id="twitter-link-btn" href="javascript:shareTwitter()"><i class="fa-brands fa-twitter"></i></a>
											   <a id="facebook-link-btn" href="javascript:shareFacebook()"><i class="fa-brands fa-facebook-f" style="color:#415893;"></i></a>
											   <a id="naver-link-btn" href="javascript:shareNaver()" ><i class="fa-solid fa-n" style="color:#5ECC69;"></i></a>
											   <a id="copy-btn" href="javascript:copy()"><i class="fa-solid fa-link" style="color:#555;"></i></a>
										 </div>
										 <!-- sns share modal end  --> 
                                    </div>
                                </div>
                           </form>
                 		</div>
					</div>
				</div>
