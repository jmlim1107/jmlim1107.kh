<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 마이페이지 - 3. 나의 후기 -->
					<div id="portfolio2">
                       <div class="thumb">
                         <div class="row">
                           <div class="col-lg-5 align-self-center">
                             <div class="left-text">
                               <h4>나의 후기</h4>
                                 <div class="container">
									<div class="row row-bottom-padded-md">
									  <c:choose>
							            <c:when test="${ not empty myReviewList }">
											<c:forEach var="reviewVO" items="${myReviewList}">
										      <div class="col-lg-4 col-md-4 portfolio-item" data-num="${reviewVO.review_no }"> 
										      	<a class="portfolio-link">
											        <div class="caption">
											          <div class="caption-content">
											            <h5>${reviewVO.review_title}</h5>
											            <h6>${reviewVO.review_content}</h6>
											        	<h6><i class="fa-regular fa-calendar-check"></i> ${reviewVO.review_date}</h6>
											          </div>
											        </div>
											        <%-- <img src="/uploadLiClass/review/${reviewVO.review_img}"  alt="review_img"  width="360px" height="230px">--%> 
										        </a>
	   									        <a class="edit-review"><i class="fa-regular fa-pen-to-square"></i></a>
									         </div>
											</c:forEach>
										 </c:when>
							              <c:otherwise>
										        <div class="services-content">
										          <h5> <i class="fa-solid fa-pen-fancy"></i>  작성한 후기가 없습니다.</h5>
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
