<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- 은아) 마이페이지 3. 나의 후기 --%>	
<style>
	#portfolio2{
		width: 80%;
	    margin: 20px;
	    padding: 50px;
	}
	
	.headline-h4{
		color: #555;
	    font-size: 20px;
	    font-weight: 700;
	    line-height: 35px;
	    margin-bottom: 30px;
	}
</style>
<script>
	$(function(){
		
		//은아)후기글 제목 클릭 시 상세내용
		$(".review_title").click(function(){
			let contentTr = $(this).parent(".review-tr").next(".review-tr");
			let css = contentTr.css("display");
			if(css == 'none'){
				contentTr.css("display","table-row");
			}else{
				contentTr.css("display","none");
			}
			
			 var review_status = ${review_status}
	         console.log(review_status);
	         if(review_status == 0){
	            console.log("성공");
	            $('input[name=reviewStatus]').attr('value',"리뷰보기");
	         }else{
	            console.log("실패");
	         }
	         
		});
	});
	
</script>	

					<div id="portfolio2">
                       <div class="thumb">
                         <div class="row">
                             <div class="left-text">
                               <h4 class="headline-h4">나의 후기</h4>
                                 <div id="reviewList" class="table-height">
						            <form id="reviewListForm">
						               <input type="hidden" name="user_no" value='${loginUser.user_no }'>
						               <table class="table table-hover" style="width: 110%;max-width: 110%;">
						                  <thead>
						                     <tr>
						                        <th class="order text-center col-md-1"></th>
						                        <th class="order text-center col-md-3">수강클래스</th>
						                        <th class="order text-center col-md-3">제목</th>
						                        <th class="text-center col-md-2">작성일자</th>
						                        <th class="text-center col-md-2">별점</th>
					
						                     </tr>
						                  </thead>
						                    <tbody class="table-striped">
							                  <c:choose>
							                     <c:when test="${ not empty myReviewList }">
							                        <c:forEach var="reviewVO" items="${myReviewList}"  varStatus="status">
							                           <tr class="text-center review-tr" data-num="${reviewVO.review_no }" data-cno = "${reviewVO.c_no}">
							                              <td><b>#${status.index+1}</b></td>
							                           	  <td style="text-align:left;padding-left:15px;">
							                                 <div style="padding-left:30px;" class="review-class">
							                                 	<img style="width: 250px; height: 150px;" src="/uploadLiClass/class/${reviewVO.class_img}">
							                                 </div>
							                              </td>
							                              <td style="text-align:left;padding-left:15px; cursor: pointer;" class="review_title">
							                                 <span style="padding-left:30px;">${reviewVO.review_title}</span>
							                                 <span style="padding-left:30px;">${reviewClassDetail}</span>
							                              </td>                     
							                              <td class="name">${reviewVO.review_date}</td>
							                              	<c:if test="${reviewVO.review_rating eq 1}">
								                              <td>
								                             	 <i class="fa-solid fa-star" ></i>
								                              </td>
							                              	</c:if>
							                              	<c:if test="${reviewVO.review_rating eq 2}">
								                               <td>
								                              	<i class="fa-solid fa-star"></i>
								                              	<i class="fa-solid fa-star"></i>
								                              </td>
							                              	</c:if>
							                              	<c:if test="${reviewVO.review_rating eq 3}">
								                               <td>
								                              	<i class="fa-solid fa-star"></i>
								                              	<i class="fa-solid fa-star"></i>
								                              	<i class="fa-solid fa-star"></i>
								                              </td>
							                              	</c:if>
							                              	<c:if test="${reviewVO.review_rating eq 4}">
								                              <td>
								                              	<i class="fa-solid fa-star"></i>
								                              	<i class="fa-solid fa-star"></i>
								                              	<i class="fa-solid fa-star"></i>
								                              	<i class="fa-solid fa-star"></i>
								                              </td>
							                              	</c:if>
							                              	<c:if test="${reviewVO.review_rating eq 5}">
								                               <td>
								                              	<i class="fa-solid fa-star" style="font-size: 10px;"></i>
								                              	<i class="fa-solid fa-star" style="font-size: 10px;"></i>
								                              	<i class="fa-solid fa-star" style="font-size: 10px;"></i>
								                              	<i class="fa-solid fa-star" style="font-size: 10px;"></i>
								                              	<i class="fa-solid fa-star" style="font-size: 10px;"></i>
								                              </td>
							                              	</c:if>
							                           </tr>
							                           <tr style="text-align: center; display: none;" class="review-tr">
							                           		<td colspan="4">
								                               <span style="padding-left:30px;" class="review__content">${reviewVO.review_content}</span>
							                           		</td>
							                           		<td>
							                                	<button type="button" style="margin: 0px auto;" onclick="location.href='/class/classDetail?c_no=${reviewVO.c_no}'">
							                                		클래스 상세보기<i class="fa-solid fa-angles-right"></i>
							                                	</button>
							                                </td>
							                           </tr>
							                        </c:forEach>
							                     </c:when>
							                     <c:otherwise>
							                        <tr>
							                           <td colspan="6" class="tac text-center"><i class="fa-regular fa-comment"></i> 작성한 후기가 존재하지 않습니다.</td>
							                        </tr>
							                     </c:otherwise>
							                  </c:choose>
						                  </tbody>
						               </table>
						            </form>
						         </div>
                             </div>
                           </div>
                         </div>
                       </div>

  