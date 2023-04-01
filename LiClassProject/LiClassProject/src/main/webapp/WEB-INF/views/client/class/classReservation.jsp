<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 부트스트랩 -->
<link rel="stylesheet" type = "text/css" href="/resources/include/dist/css/bootstrap.min.css" />
<link rel="stylesheet" type = "text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />

<!-- 제이쿼리 -->
<script type = "text/javascript" src = "/resources/include/js/jquery-3.6.2.min.js"></script>

<!--  cloudflare -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" type = "text/css" href="/resources/client/classDetail/css/classReservaion_modal.css" />

<script>
$(function(){
	/*예약페이지로 넘어가기
	$(".goReserve").click(function(){
			let user_no = $(".login-info").data("num");
			if(user_no == 0){
				alert("로그인 후 이용해주세요.");
			return;
		}else{
			location.href="/admin/episode/goReserve?c_no="+${param.c_no};
		}
	});
	*/
	
}); //최상위$
</script>
			<div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb30">
                    <div class="class-booking-form">
                        <form>
                            <div class="row">
                            	<!--1. class info start --> 
                               	<%@ include file="/WEB-INF/views/client/class/classReservation-1.classInfo.jsp" %>
                                <!--1. class info end --> 
                               
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
           						<!-- 예약버튼 -->
                                   <button type="button" class="main-white-button goReserve">
                                    	<a href="#reserve-modal" rel="modal:open"><i class="fa-regular fa-hand-point-up"></i>예약하기</a>
                                    </button>
  								
								 <!-- reserve modal start --> 
								 <div class="modal" id="reserve-modal" style="z-index: 2; position: absolute; text-align: center; height: 500px; width: 800px; overflow:hidden; top:200px; left:300px">
								 	<%@ include file = "/WEB-INF/views/reserve/reserve.jsp" %>
								 </div>
								 <!-- reserve modal end --> 
                                </div>
                            </div>
                      </form>
            		</div>
				</div>
			</div>
