<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script src="/resources/client/classDetail/js/classDetail.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel="stylesheet" href="/resources/client/classDetail/css/classDetail.css" />
<link href="/resources/client/classDetail/css/style.css" rel="stylesheet">
<link href="/resources/client/classDetail/css/themify-icons.css" rel="stylesheet">
<link href='/resources/client/classDetail/css/dosis-font.css' rel='stylesheet' type='text/css'>

	<!-- header slider section start -->
	<section id="header-slider" class="section">
	<div class="class-content" data-num="${classDetail.c_no}">
      <h6><i class="fa-solid fa-hashtag"></i> ${classDetail.c_category}</h6>
      <h6><i class="fa-solid fa-map-location-dot" style = "color: cadetblue;"></i> ${classDetail.c_area}</h6>
      <h3>${classDetail.c_title}</h3>
      
      <div style="display: flex;" class="login-info" data-num="${loginUser.user_no}">
      	<h5>
      	</h5>
      </div>
      
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
				            	<div class="row me-row content-ct speaker" id="speakers">
						          <h2 class="row-title">${centerDetail.ct_name}</h2>
						          <div class="col-md-4 col-sm-6 feature" style="width: 100%;">
						            <p>${centerDetail.ct_intro}</p>
						            <ul class="speaker-social">
						              <c:if test="${centerDetail.ct_hmpg_addr != null}">
						              	<li><a href="${centerDetail.ct_hmpg_addr}"><i class="fa-solid fa-house"></i></a></li>
							         </c:if>
						            </ul>
						          </div>
						        </div>
				        	 <div class="main-white-button" id="map-click" style="margin:5px;"><a href="#"><i class="fa-solid fa-map-pin"></i>${centerDetail.ct_addr}</a>
							 <p style="padding: 12px 25px;"><i class="fa-regular fa-circle-check"></i>자세한 주소는 예약내역에서 확인해주세요.</p>
				        	 </div>
							 <div id="map" style="width:100%;height:350px;"></div>
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
							<section id="services" class="section services" style="margin:0px; width:100%;">
							  <div class="container-fluid">
							    <div class="row">
							      <div class="col-md-12 col-sm-6">
							        <div class="services-content">
							          <h5><i class="fa-solid fa-bullhorn"></i>  클래스 안내사항</h5>
							         	<p>LiClass는 오프라인 클래스 플랫폼입니다.</p>
							          	<p>다양한 분야의 아티스트들이 본인의 철학과 노하우, 지식을 클래스 형태로 풀어냅니다.</p>
							          	<p>직접 체험하실 수업은 해당 분야에 대한 아티스트의 노하우와 지식 위주로 제작되었으며 아티스트의 일상과 생각도 함께 엿볼 수 있습니다. </p>
							          	<p>라이크래스에서 나만의 예술을 시작해보세요. </p>
							        	<p>라이클래스는 평소에 쉽게 접할 수 없는 아티스트들 본인만의 철학과 노하우를 풀어낸 형식의 클래스로 난이도에 상관없이 모든 분들이 수강하실 수 있습니다.</p>
							          	<p>어디서도 경험할 수 없는 각 분야에서 성공한 아티스트들의 철학과 노하우를 통해 많은 것은 얻어가실 수 있을 것으로 생각되며 </p>
							          	<p>직접 체험을 통해 느끼고 배우시면서 저희 라이클래스를 수강하신다면 더 큰 시너지 효과를 보실 수 있습니다. </p>
							          </div>
							          <div class="services-content">	
						          	  	<h5><i class="fa-solid fa-money-check-dollar"></i>  클래스 환불규정</h5>
						         	 	 <p>클래스 예약 내역은 우측 상단 프로필 아이콘을 클릭하시면 My page로 이동합니다. 수강내역 버튼 -> 클래스 목록을 참고하시고, 
						         	  		실제 결제 내역은 My payment 나의 결제내역을 통해 확인하실 수 있습니다.</p>
						         	 	 <p>모든 클래스 수강권은 '7일 이내', '사용이력이 없는 경우'에만 환불이 가능합니다.</p>
						         	 	 <p>환불은 회원이 결제한 수단과 같은 형태로 진행됩니다. 다만 기술적인 문제가 발생할 경우 회사와 회원 양측이 동의하는 형태로 변경하여 진행할 수 있습니다.</p>
						         	 	 <p>환불은 회사, 결제대행사, 카드사, 페이먼트사 등의 사정에 따라 시간이 지연될 수 있습니다.</p>
							     	 </div>
							   	  </div>
							    </div>
							  </div>
							</section>
						 </div>
						  <!-- 5. attention end -->
				
					</div><!-- Tab panes end -->
				</div>
			</div>
		</div>
	</div>
	<!-- information section end -->
	
	<!-- reservation section start -->
	<div id="sticky-nav" style="position: absolute;right: 20px;bottom:50px; z-index: 0;">
		<%@ include file="/WEB-INF/views/client/class/classReservation.jsp" %>
	</div>
	
	<!-- reservation section start -->