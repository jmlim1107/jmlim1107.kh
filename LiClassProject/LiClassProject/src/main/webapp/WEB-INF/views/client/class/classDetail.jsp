<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script src="/resources/client/classDetail/classDetail.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel="stylesheet" href="/resources/client/classDetail/classDetail.css" />
	<!-- header slider section start -->
	<section id="header-slider" class="section">
	<div class="class-content" data-num="${classDetail.c_no}">
      <h6><i class="fa-solid fa-hashtag"></i> ${classDetail.c_category}</h6>
      <h3>${classDetail.c_title}</h3>
      
      <div style="display: flex;" class="login-info" data-num="${loginUser.user_no}">
      	<h5>
      	<i class="fa-solid fa-map-location-dot" style = "color: cadetblue;"></i> ${classDetail.c_area}
      	
      	<c:if test="${loginUser == null}">
	      	<a class="like"><i class="fa-regular fa-heart" style="color : #ff00007d;"></i>  ${classDetail.c_luv}</a>
         </c:if>
          <c:if test="${loginUser != null}">
          	<c:if test="${checkResult eq 0}">
	      		<a class="like"><i class="fa-regular fa-heart" style="color : #ff00007d;"></i>  ${classDetail.c_luv}</a>
	      	</c:if>
	      	<c:if test="${checkResult eq 1}">
	      		<a class="like"><i class="fa-solid fa-heart" style="color : #ff00007d;"></i>  ${classDetail.c_luv}</a>
	      	</c:if>
         </c:if>
      	</h5>
      </div>
      
      	<a href="#sns-share" rel="modal:open"><i class="fa-solid fa-share-nodes"></i></a>
      	
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
	
	  <div id="myCarousel" class="carousel slide" data-ride="carousel"> 
	    <!-- Indicators -->
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	    </ol>
	    <!-- Wrapper for slides -->
	    <div class="carousel-inner" role="listbox">
	      <div class="item active"> <img src="/uploadStorage/class/${classDetail.c_img_file}" alt="c_img_file">
	      </div>
	      <div class="item">
	       <img src="/uploadStorage/class/${classDetail.c_img_file}" alt="c_img_file">
	      </div>
	    </div>
	    <!-- Controls --> 
	    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span></a> <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span></a>
	    </div>
	</section>
	<!-- header slider section end -->
	
	<!-- information section start -->
	<div class="container-fluid class-info" data-title = "${classDetail.c_title}">
		<div class="row">
		    <div class="col-md-10">
			      <div class="card">
				      <!-- Nav tabs start -->
				      <ul class="nav nav-tabs" role="tablist">
				          <li role="presentation" class="active"><a href="#class-info" aria-controls="class-info" role="tab" data-toggle="tab">클래스정보</a></li>
				          <li role="presentation"><a href="#class-curriculum" aria-controls="profile" role="tab" data-toggle="tab">커리큘럼</a></li>
				          <li role="presentation"><a href="#center-info" aria-controls="messages" role="tab" data-toggle="tab">센터</a></li>
				          <li role="presentation"><a href="#class-review" aria-controls="messages" role="tab" data-toggle="tab">후기</a></li>
				          <li role="presentation"><a href="#attention" aria-controls="settings" role="tab" data-toggle="tab">안내사항</a></li>
				      </ul>
					 <!-- Nav tabs end -->
					 
	     			 <!-- Tab panes start -->
				      <div class="tab-content">
				      
				      	  <!-- 1. class info start-->
				          <div role="tabpanel" class="tab-pane active" id="class-info" >
				          	${classDetail.c_content}
				          </div>
						  <!-- 1. class info end-->
							
				          <!-- 2. class curriculum start -->
				          <div role="tabpanel" class="tab-pane" id="class-curriculum">
				           커리큘럼정보
					           <section id="info" class="section services info">
								  <div class="container-fluid">
								  	Simon is designer and partner at Fictivekin and has worked in a variety of situations for bands, record labels, governments, polar explorers, and most other things.
								  </div>
							  </section>
						  
						  </div>
						  <!-- 2. class curriculum end -->
						  
						  <!-- 3. center info start -->
				          <div role="tabpanel" class="tab-pane" id="center-info">
				        	 <div class="main-white-button" id="map-click" style="margin:5px;"><a href="#"><i class="fa-solid fa-map-pin"></i>${centerDetail.ct_addr}</a>
							 <span><i class="fa-regular fa-circle-check"></i>자세한 주소는 예약내역에서 확인해주세요.</span>
				        	 </div>
							 <div id="map" style="width:100%;height:350px;">
							 </div>
				          </div>
				          <!--  kakao map start  -->
				          <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=93dabf793b8403bbf540b6d314c75a8f&libraries=services"></script>
						  <script type="text/javascript" >
							
							$("#map-click").click(function(){
								var mapContainer = document.getElementById('map'), 
								    mapOption = {
								        center: new kakao.maps.LatLng(33.450701, 126.570667),
								        level: 4
								    };  
								var map = new kakao.maps.Map(mapContainer, mapOption); 
								
									map.relayout();
									map.setCenter(new kakao.maps.LatLng(33.450701, 126.570667));
									
									var addr = "${centerDetail.ct_addr}";
									var detailAddr =  "${centerDetail.ct_detail_addr}";
									var centerAddr = addr+" "+detailAddr;
									console.log("센터 주소 : "+centerAddr);
									var geocoder = new kakao.maps.services.Geocoder();
									
									geocoder.addressSearch(centerAddr, function(result, status) {
									   
									     if (status === kakao.maps.services.Status.OK) {
									
									        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
									
									        map.setCenter(coords);
									        
									     	/*  */
											var markerPosition  = coords;
											// 마커를 생성합니다
											var marker = new kakao.maps.Marker({
											    position: markerPosition
											});
			
											// 마커가 지도 위에 표시되도록 설정합니다
											marker.setMap(map);
											
											var iwContent = '<div style="text-align:center;color:#555;">${centerDetail.ct_name}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
										    iwPosition = coords; //인포윈도우 표시 위치입니다
			
											// 인포윈도우를 생성합니다
											var infowindow = new kakao.maps.InfoWindow({
											    position : iwPosition, 
											    content : iwContent 
											});
											  
											// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
											infowindow.open(map, marker);
										    } 
									});
									
									
							});
							</script>
							<!--  kakao map end  -->
				          <!-- 3. center info end -->
				          
			              <!-- 4. class-review start -->
				          <div role="tabpanel" class="tab-pane" id="class-review" data-num="${classDetail.c_no}">
				          		
								
						  </div>
						  <!-- 4. class-review end -->
						  
				          <!-- 5. attention start -->
				          <div role="tabpanel" class="tab-pane" id="attention">
				          		<!-- Service Section -->
								<section id="services" class="section services" style="margin:0px; width:100%;">
								  <div class="container-fluid">
								    <div class="row">
								      <div class="col-md-12 col-sm-6">
								        <div class="services-content">
								          <h5>클래스 예약 안내사항</h5>
								          <p>공통 환불정책</p>
								          <ul>
								          	<li> 결제 후 1시간 이내 취소 시 100% 환불 (결제 후 1시간 이내 취소 시, 밤 12시 이전 취소시 100% 환불. 단, 당일 클래스는 1시간 이내 취소 시에도 환불 불가)</li>
								          	<li>클래스 6일 이전 취소 시 100% 환불</li>
								          </ul>
								        </div>
								      </div>
								    </div>
								  </div>
								</section>
								<!-- Service Section --> 
								
						  </div>
						  <!-- 5. attention end -->
				
					</div><!-- Tab panes end -->
				</div>
			</div>
		</div>
	</div>
	<!-- information section end -->
	
	<!-- reservation section start -->
	<div id="sticky-nav" style="position: absolute;right: 20px;bottom:50px;">
		<%@ include file="/WEB-INF/views/client/class/classReservation.jsp" %>
	</div>
	
	<!-- reservation section start -->