<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/client/classDetail/js/classDetail.js"></script>
<link rel="stylesheet" href="/resources/client/classDetail/css/classDetail.css" />
<link href="/resources/client/classDetail/css/themify-icons.css" rel="stylesheet">
<link href='/resources/client/classDetail/css/dosis-font.css' rel='stylesheet' type='text/css'>

	<!-- 모달창 css -->
	<link rel="stylesheet" type = "text/css" href="/resources/review/css/modal.css" />
	<!-- 모달 디테일 css -->
	<link rel="stylesheet" type = "text/css" href="/resources/review/css/modalDetail.css" />
	<link rel="stylesheet" type = "text/css" href="/resources/review/css/screen.css" />
	<!-- 별 불러오는 js -->
	<script src='https://use.fontawesome.com/releases/v5.0.7/js/all.js'></script>
    <!-- 리뷰 css -->
	<link rel="stylesheet" type = "text/css" href="/resources/review/css/review.css" />
	<link rel="stylesheet" type = "text/css" href="/resources/review/css/reviewSearch.css" />
	
	<!-- 글씨체 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Archivo+Black&display=swap" rel="stylesheet">
	

<style type="text/css">
    	#colorStar{
    		direction: rtl;
			unicode-bidi: bidi-override;
    		color: #555; 
    	}
    	#login-pop-modal{
    		top: 250px;
    	}
    	
    	#login-pop-modal .modal_content {
		  width:390px;
		  margin:0px auto;
		  background:#fff;
		  border:2px solid #666; 
		  top: 60%;
    	  height: 745px;
		}
		.card{
			border:none;
			display: block; 
		}
		.row>*{
			width: 80%;
		}
		
    	.card{
    		border:none;
    	}
    </style>

<script type="text/javascript">
	$(function(){
		
		//은아)
		if("${1 eq classDetail.c_category}"){
			$("#category").html("<i class='fa-solid fa-hashtag'></i> 공예");
		}else if("${2 eq classDetail.c_category}"){
			$("#category").html("<i class='fa-solid fa-hashtag'></i> 요리");
		}else if("${3 eq classDetail.c_category}"){
			$("#category").html("<i class='fa-solid fa-hashtag'></i> 미술");
		}else if("${4 eq classDetail.c_category}"){
			$("#category").html("<i class='fa-solid fa-hashtag'></i> 플라워");
		}else if("${5 eq classDetail.c_category}"){
			$("#category").html("<i class='fa-solid fa-hashtag'></i> 뷰티");
		}else if("${6 eq classDetail.c_category}"){
			$("#category").html("<i class='fa-solid fa-hashtag'></i> 체험 및 기타");
		}
		
		//클래스 이미지 사진
		var img1 = '/uploadLiClass/class/'+$('.class-img:eq(0)').val();
		var img2 = '/uploadLiClass/class/'+$('.class-img:eq(1)').val();
		var img3 = '/uploadLiClass/class/'+$('.class-img:eq(2)').val();
		console.log("img : "+ img1);
		console.log("img : "+ img2);
		console.log("img : "+ img3);
	    /* find('.img-item:eq(1)').attr('src','/uploadLiClass/class/'+img1); */
	    $("#img1").attr("src",img1);
	    $("#img2").attr("src",img2);
	    $("#img3").attr("src",img3);
	});
	    
</script>

	<!-- header slider section start -->
	<section id="header-slider" class="section" style="margin-top : 150px;">
	<div class="class-content" data-num="${clientClassDetail.c_no}">
      <h6 id="category"><i class="fa-solid fa-hashtag"></i></h6>
      <h6><i class="fa-solid fa-map-location-dot" style = "color: cadetblue;"></i> ${clientClassDetail.c_area}</h6>
      <h3>${clientClassDetail.c_title}</h3>
     
      <div style="display: flex;" class="login-info" data-num="${loginUser.user_no}">
      	
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
	      <div class="item active"> 
	      	<img class="img-item" id="img1">
	      </div>
	      <div class="item">
	       <img class="img-item" id="img2">
	      </div>
	      <div class="item" id="img3">
	       <img class="img-item">
	      </div>
	    </div>
	    <!-- Controls --> 
	    <a style = "background: bottom;" class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span></a> <a style = "background: bottom;" class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span></a>
	    </div>
	</section>
	<!-- header slider section end -->
	
	<!-- information section start -->
	<div class="container-fluid class-info" data-title = "${clientClassDetail.c_title}">
		<div class="row" style="display:block;">
		    <div class="col-md-10">
			      <div class="card" style="display: block;     margin-left: 36px;
    width: 78%;">
				      <!-- Nav tabs start -->
				      <ul class="nav nav-tabs" role="tablist">
				          <li role="presentation" class="active"><a href="#class-info" aria-controls="class-info" role="tab" data-toggle="tab">클래스정보</a></li>
				          <li role="presentation"><a href="#center-info" aria-controls="messages" role="tab" data-toggle="tab">센터</a></li>
				          <li role="presentation"><a href="#class-review" aria-controls="messages" role="tab" data-toggle="tab">후기</a></li>
				          <li role="presentation"><a href="#attention" aria-controls="settings" role="tab" data-toggle="tab">안내사항</a></li>
				      </ul>
					 <!-- Nav tabs end -->
					 
	     			 <!-- Tab panes start -->
				      <div class="tab-content">
				      <c:choose>
                		<c:when test="${ not empty clientClassDetailList }">
                			<c:forEach var="classDetail"  items="${clientClassDetailList}"  varStatus="status">
                				<input type="hidden" class="class-img" value = "${classDetail.c_img_file}" />
                			</c:forEach>
                		</c:when>
                	</c:choose>
				      	  <!-- 1. class info start-->
				          <div role="tabpanel" class="tab-pane active" id="class-info" >
				          	${clientClassDetail.c_content}
				          </div>
						  <!-- 1. class info end-->
						  <!-- 2. center info start -->
				          <div role="tabpanel" class="tab-pane" id="center-info">
				          	<c:if test="${centerDetail != null} ">
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
						      </c:if>
				        	 <div class="main-white-button" id="map-click" style="margin:5px;"><a href="#"><i class="fa-solid fa-map-pin"></i>${clientClassDetail.c_area}</a>
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
									
									var addr = "${classDetail.c_area}";
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
			              
				          <div role="tabpanel" class="tab-pane" id="class-review" data-num="${clientClassDetail.c_no}">
				          	<form id = "detailForm">
								<input type = "hidden" name ="review_no" id = "review_no" value = "review_no" />
							</form>
							<script type="text/javascript">
    
							    $(function(){
							    	var ratingTotal = ${tongRating.RATING1} + ${tongRating.RATING2} + ${tongRating.RATING3} + ${tongRating.RATING4} + ${tongRating.RATING5}
							    	$("#ratingTotal").text("(" + ratingTotal + ")");
							    	
							    	var ratingAvg1 = Math.ceil(${tongRating.RATING1} / ratingTotal *1000);
							    	var ratingAvg2 = Math.ceil(${tongRating.RATING2} / ratingTotal *1000);
							    	var ratingAvg3 = Math.ceil(${tongRating.RATING3} / ratingTotal *1000);
							    	var ratingAvg4 = Math.ceil(${tongRating.RATING4} / ratingTotal *1000);
							    	var ratingAvg5 = Math.ceil(${tongRating.RATING5} / ratingTotal *1000);
							    	
							    	$("#bar1").width(ratingAvg1);
							    	$("#bar2").width(ratingAvg2);
							    	$("#bar3").width(ratingAvg3);
							    	$("#bar4").width(ratingAvg4);
							    	$("#bar5").width(ratingAvg5);
							    	
							    });
							    
							    
							    </script>
		
							<!-- 리뷰 작성 폼 
							<div id = "test1" style="display: none;">
								include file = "/WEB-INF/views/client/review/r_writeForm.jsp" 
							</div> -->
							<!-- 리뷰 업데이트 폼 
							<div id = "test2" style="display: none;">
								include file = "/WEB-INF/views/client/review/r_updateForm.jsp" 
							</div>-->
							
							<!-- 리뷰 상세보기 폼 
							<div id = "test3" style="display: none;">
								<%-- <jsp:include page="/WEB-INF/views/review/reviewDetail.jsp">
								</jsp:include> --%>
								include file = "/WEB-INF/views/client/review/reviewDetail.jsp"
							</div>-->
							
							<!-- 별점 통계 start -->
						  	<div class="container">
							    <div class="row" style = "justify-content: flex-start;">
							      <div class="col-md-13 course-details-content">
							        <div class="course-details-card mt--40">
							          <div class="course-content">
							            <h5 class="mb--20">Review</h5>
							            <!-- 별점 -->
							            <div class="row row--30">
							              <div class="col-lg-4" style="position: static;">
							                <div class="rating-box">
							                  <div class="rating-number">${ratingAvg}</div>
							                  <div class="rating"> <i class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i> </div>
							                  <span id = "ratingTotal">전체 후기 개수</span></div>
							              </div>
							              <div class="col-lg-8">
							                <div class="review-wrapper">
							                  <div class="single-progress-bar">
							                    <div class="rating-text"> 5 <i class="fa fa-star" aria-hidden="true"></i> </div>
							                    <h3>${review}</h3>
								                    <!-- 통계바 -->
								                    <div class="progress">
							                    			<div id = "bar5" class="progress-bar" role="progressbar" style="width:0%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
							                  		</div>
							                  		<span class="rating-value">${tongRating.RATING5}</span> </div>
								   
							                 
								                  	<div class="single-progress-bar">
								                    	<div class="rating-text"> 4 <i class="fa fa-star" aria-hidden="true"></i> </div>
								                    	<div class="progress">
								                      		<div id = "bar4" class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
								                    	</div>
								                   		<span class="rating-value">${tongRating.RATING4}</span>
								                   	</div>
									                <div class="single-progress-bar">
									                    <div class="rating-text"> 3 <i class="fa fa-star" aria-hidden="true"></i> </div>
									                    <div class="progress">
									                      <div id = "bar3"  class="progress-bar" role="progressbar" style="width: 60%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
									                    </div>
									                    <span class="rating-value">${tongRating.RATING3}</span> </div>
								                  	<div class="single-progress-bar">
								                    	<div class="rating-text"> 2 <i class="fa fa-star" aria-hidden="true"></i> </div>
								                    	<div class="progress">
								                      		<div id = "bar2"  class="progress-bar" role="progressbar" style="width: 40%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
								                   		</div>
							                    		<span class="rating-value">${tongRating.RATING2}</span> </div>
								                  	<div class="single-progress-bar">
								                    	<div class="rating-text"> 1 <i class="fa fa-star" aria-hidden="true"></i> </div>
								                    	<div class="progress">
								                      		<div id = "bar1"  class="progress-bar" role="progressbar" style="width: 20%" aria-valuenow="0" aria-valuemin="80" aria-valuemax="100"></div>
								                    	</div>
								                    	<span class="rating-value">${tongRating.RATING1}</span> </div>
								                </div>
							              </div>
						            </div>
						            <!-- 별점 통계 end -->
	            
            
            
						            <!-- 검색창 -->
						             <div class="container-fluid">
									    <form name = "review_search" id = "review_search">
									    	<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
						 					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
						
										    <div id = "searchDiv" style="display: inline-flex;">
												<select id="search" name="search"  class="form-control col4">
													<option value="all">전체</option>
													<option value="b_title">제목</option>
													<option value="b_content">내용</option>
												</select>
												<input id = "keyword" name = "keyword" class="form-control me-2" type="text" placeholder="Contents Search...." aria-label="Search">
												<button id = "searchData" class="btn btn-dark col" type="button" s>Search</button>
											</div>
							    		</form>
							  		</div>
			  
			
			
						            <%-- ================== 글쓰기 버튼 출력 시작 ============= 
									<div class="contentBtn  text-right">
										<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-dark">
									</div>--%>
									<%-- ================== 글쓰기 버튼 출력 종료 ============= --%>
		

			

							         <!--  댓글창 -->
							         <div class="comment-wrapper pt--40">
							         <c:choose>
										<c:when test="${not empty reviewList}" >
											<c:forEach var="review" items="${reviewList}" varStatus="status">
								              <div class="edu-comment" data-num="${review.review_no}" id = "tttest">
								              	<form id = "detailForm">
													<input type = "hidden" id = "review_no" value = "${review.review_no}" />
												</form>
								              	
								              	<%-- ================== 상세버튼 시작 =============
								              	<button class = "test3" type = "button">상세보기 버튼</button> --%>
								              	<%-- ================== 상세버튼 종료 ============= --%>
								                <div class="thumbnail"><img src="/uploadLiClass/user/${review.user_img}"></div>
									                <div class="comment-content">
									                  <div class="comment-top">
									                    <h6 class="title" id = "title">" ${review.review_title} "</h6>       
									                    <!-- 댓글창 별점 -->
									                    <c:set var = "rating" value = "${review.review_rating}"/>	 
									                    
									                    <c:if test="${rating eq 1}">
								                    		<div class="rating">
										                    	<i class="fas fa-star" aria-hidden="true"></i>
										                    	<i class="fas fa-star" aria-hidden="true"></i>
										                    	<i class="fas fa-star" aria-hidden="true"></i>
										                    	<i class="fas fa-star" aria-hidden="true"></i> 
										                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
										                    </div> 	
								                    	</c:if>
									                    
								                    	
								                    	<c:if test="${rating eq 2}">
								                    		<div class="rating">
										                    	<i class="fas fa-star" aria-hidden="true"></i>
										                    	<i class="fas fa-star" aria-hidden="true"></i>
										                    	<i class="fas fa-star" aria-hidden="true"></i> 
										                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
										                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
										                    </div> 	
								                    	</c:if>
								                    	
								                    	
								                    	<c:if test="${rating eq 3}">
								                    		<div class="rating">
										                    	<i class="fas fa-star" aria-hidden="true"></i>
										                    	<i class="fas fa-star" aria-hidden="true"></i> 
										                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
										                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
										                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
										                    </div> 	
								                    	</c:if>
						
								                    	<c:if test="${rating eq 4}">
								                    		<div class="rating">
								                    			<i class="fas fa-star" aria-hidden="true"></i> 
										                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
										                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
										                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
										                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
										                    </div> 	
								                    	</c:if>
								                    	
								                    	
								                    	<c:if test="${rating eq 5}">
								                    		<div class="rating">
										                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
										                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
										                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
										                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
										                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i> 
										                    </div> 	
								                    	</c:if>
								                  
								                    
								                  </div>
								                  <div style="margin-bottom: 5px;">
								                  	<span>${review.review_name}</span>
								                  	<span>${review.review_date}</span>
								                  	<span>${review.user_name}</span>
							
								                  </div>
								                  <div id = "review_content" name = "review_content">${review.review_content}</div>
								                  <span>친구에게 추천하시겠습니까?</span>
								                  <span>${review.review_recommend}</span>
								                </div>
								                
								                
							
								              </div>
							              </c:forEach>
							          	</c:when>
							          	<c:otherwise>
							          		<!--등록된 글이 없을 경우 -->
											<div>등록된 게시글이 존재하지 않습니다.</div>
										</c:otherwise>
							          </c:choose>
							          <!-- Comment Box end--->
							          
							            <%-- ============== 페이징 출력 시작 =========== --%>
									 <div class="text-center">
										<ul class="pagination" style="justify-content: center;">
										<c:if test="${pageMaker.prev}">
										 	<li class="paginate_button">
										 		<a href="${pageMaker.startPage -1}" class = "page-link">Previous</a>
											</li>
										</c:if>
										<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
										 	<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''}">
										 		<a href="${num}" class = "page-link">${num}</a>
											</li>
										</c:forEach>
										<c:if test="${pageMaker.next}">
											<li class="paginate_button next">
												<a href="${pageMaker.endPage +1 }" class = "page-link">Next</a>
											</li>
										</c:if> 
										</ul>
									 </div> 
							 		<%-- ============== 페이징 출력 종료 ============= --%>
									  </div>
						       		</div>
						   		</div>
							  </div>
							</div>
						 </div>
														
						  </div>
						  <!--4. class-review end -->
						  
				          <!-- 5. attention start -->
				          <div role="tabpanel" class="tab-pane" id="attention">
							<section id="services" class="section services" style="margin:0px; width:100%;">
							  <div class="container-fluid">
							    <div class="row" style="justify-content: left;">
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
		<jsp:include page="/WEB-INF/views/client/class/classReservation.jsp">
			<jsp:param value="${clientClassDetail.c_no}" name="c_no"/>
		</jsp:include> 
		 <%--<%@ include file="/WEB-INF/views/client/class/classReservation.jsp" %>--%>
	</div>
	
	<!-- reservation section start -->