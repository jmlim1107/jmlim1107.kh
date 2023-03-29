<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
	$(function(){
		//휴지통 클릭
		$(".delete-likes").click(function(){
			//현재페이지 localStorage에 activePosition저장
			var activePosition = 3;
			localStorage.setItem("activePosition",activePosition);
			console.log("set activePosition : "+activePosition);
			
			let c_no = $(this).parent(".portfolio-item").data("num");
			location.href="/mypage/delLikes?c_no="+c_no;
		});
	});
</script>
					<div id="portfolio2">
                       <div class="thumb">
                         <div class="row">
                           <div class="col-lg-5 align-self-center">
                             <div class="left-text">
                               <h4>나의 관심클래스</h4>
                                 <div class="container">
									<div class="row row-bottom-padded-md">
									
										<c:choose>
							              <c:when test="${ not empty myLikesList }">
											<c:forEach var="likedClass" items="${myLikesList}">
										      <div class="col-lg-4 col-md-4 portfolio-item" data-num="${likedClass.c_no }"> 
										      	<a class="portfolio-link">
											        <div class="caption">
											          <div class="caption-content">
											            <h5>${likedClass.c_title}</h5>
											            <h6><i class="fa-solid fa-location-dot"></i>${likedClass.c_area}</h6>
											          </div>
											        </div>
											       	 <img src="/uploadLiClass/class/${likedClass.c_img_file}" class="img-responsive" alt="class-img"> 
										        </a>
	   									        <a class="delete-likes"><i class="fa-solid fa-trash-can"></i></a>
									         </div>
											</c:forEach>
							              </c:when>
							              <c:otherwise>
										        <div class="services-content">
										          <h5> <i class="fa-solid fa-heart-circle-exclamation"></i>  관심클래스가 없습니다.</h5>
										        </div>
							              </c:otherwise>
							           </c:choose>
									</div>
								</div>
                             </div>
                           </div>
                         </div>
                       </div>
                     </div>