<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/client/mypage/assets/css/myProfileImg.css" />
<script src="/resources/client/mypage/assets/js/myProfileImg.js"></script>
<!-- 마이페이지 - 1-1.나의 회원정보 -->
<script>
	    //웅배) 수강내역 모달창
	      $("#modal_opne_btn").click(function(){
	         $("#modal").attr("style", "display:block");
	      });
	      
	      $("#modal_close_btn").click(function(){
	         $("#modal").attr("style", "display:none");
	      });

</script>
						<div>
	                       <div class="thumb">
	                         <div class="row">
	                           <div class="col-lg-5 align-self-center">
	                             <div class="left-text">
	                               <h4>안녕하세요, ${loginUser.user_name} 님!</h4>
	                               <div class="img-box-sm">
	                               	  	<c:if test="${loginUser.user_img != ''}">
						         			<c:choose>
								         		<c:when test="${loginUser.user_type eq 0}">
									         		<div class="profile-img"><img class="icon2" src="/uploadLiClass/user/${loginUser.user_img}" alt="profile"></div>
							         			</c:when>
							         			<c:otherwise>
									         		<div class="profile-img"><img class="icon2" src="${loginUser.user_img}" alt="profile"></div>
							         			</c:otherwise>
						         			</c:choose>
					         			</c:if>
					         			<c:if test="${loginUser.user_img == ''}">
							         			<div class="profile-img"><img class="icon2" src="/uploadLiClass/user/default-profile.png" alt="profile"/></div>
					         			</c:if>
					         			<c:if test="${loginUser.user_type eq 0}">
					         				<div class="hover-content2">
                                       			<a href="#img-edit" rel="modal:open"><i class="fa-solid fa-pen-to-square" id="profile-edit"></i></a>
                                       		</div>
							         	</c:if>
					         			
				         			</div>
				         			
				         			<!-- profile img edit modal start -->
									<div id="img-edit" class="filebox preview-image modal" style="z-index: 2; position: initial; text-align: center;">
										
										<form id="img-update-form">
											<label for="input-file" >
		                             			<a class="main-white-button" style="color : #555; margin: 0;"><i class="fa-regular fa-image"></i>사진선택</a>
											</label>
											<input type="file" class="upload-hidden" id="input-file" name="file" accept="image/png, image/jpeg"  style="display: none;">
	                             		</form>
	                             		
		                             	<a class="btn" id="update-img" ><i class="fa-solid fa-repeat"></i>변경</a>
	                             		<a class="btn" id="delete-img" ><i class="fa-solid fa-trash"></i>삭제</a>
	                             		<a class="btn" id="cancel" rel="modal:close"><i class="fa-solid fa-xmark"></i>취소</a>
									</div>
									<!-- profile img edit modal end -->
				         			
				         			<hr>
	                               <i class="fa-solid fa-calendar-days"></i>
	                               <p>${loginUser.user_regdate} ~</p>
	                               <i class="fa-solid fa-envelope"></i><p>${loginUser.user_email}</p>
	                               <i class="fa-solid fa-phone"></i><p>${loginUser.user_tel}</p>
	                               <div class="main-white-button">
	                               		<a href="/mypage/updateForm" id="edit-btn"><i class="fa-regular fa-user"></i>수정하기</a>
	                               	</div>
	                               <div class="main-white-button">
	                               		<a href="#sns-share2" rel="modal:open"><i class="fa-solid fa-money-check"></i>수강내역</a>
	                               </div>
	                             </div>
	                           </div>
	                           <div class="col-lg-7 align-self-center" id="pw-check-div" style="display: none" >
	                             <div class="right-text"></div>
                           	   </div>
                         </div>
                       </div>
                     </div>
                     
	                     
	                     
	                     
	                     <!-- 모달창(상세보기) -->                        
<div class="modal" id="sns-share2" style="z-index: 2; position: initial; text-align: center;max-width:1600px;">
<h2>수강내역</h2><hr>
<%-- ==================== 리스트 시작 ==================== --%>
<div id="paymentList" class="table-height">
   <table summary="결제내역 리스트" class="table table-hover">
      <thead>
         <tr>
            <th data-value="b_num" class="order text-center col-md-3">클래스정보</th>
            <th class="text-center col-md-2">수강일자</th>
            <th class="text-center col-md-2">카테고리</th>
            <th class="text-center col-md-1">난이도</th>
            <th class="text-center col-md-1">지역</th>
            <th class="text-center col-md-1">후기</th>
         </tr>
      </thead>
      <tbody id="paymentList" class="table-striped">
      <!-- 데이터 출력 -->
      <c:choose>
         <c:when test="${ not empty pvo_courseList }">
            <c:forEach var="courseList" items="${ pvo_courseList }" >
               <tr class="text-center" data-num="${ courseList.r_no }">
                  <td style="text-align:left;padding-left:15px;">
                     <img src="https://item.kakaocdn.net/do/493188dee481260d5c89790036be0e66f604e7b0e6900f9ac53a43965300eb9a" style="width:60px;height:60px;object-fit:cover;" alt="..." class="img-rounded">
                     <span style="padding-left:30px;">${ courseList.title }</span>
                  </td>                     
                  <td>${courseList.date }</td>
                  <td>${ courseList.category }</td>
                  <td>${ courseList.level }</td>
                  <td>${ courseList.area }</td>
                  <c:if test="${courseList.count<=0 }">
                     <td><button type="button" class="btn-default btn-xs">리뷰등록</button></td>
                  </c:if>
                  <c:if test="${courseList.count>0 }">
                     <td>수강 전</td>
                  </c:if>     
               </tr>
            </c:forEach>
         </c:when>
         <c:otherwise>
            <tr>
               <td colspan="6" class="tac text-center">수강내역이 존재하지 않습니다.</td>
            </tr>
         </c:otherwise>
      </c:choose>
      </tbody>
   </table>
</div>
<%-- ==================== 리스트 종료 ==================== --%>
</div>