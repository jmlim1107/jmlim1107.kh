<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/client/mypage/assets/css/myProfileImg.css" />
<script src="/resources/client/mypage/assets/js/myProfileImg.js"></script>
<%-- 은아) 마이페이지 1. 나의 회원정보--%>	

						<div>
	                       <div class="thumb">
	                         <div class="row">
	                           <div class="col-lg-12 align-self-center">
	                             <div class="left-text">
	                               <h4>안녕하세요, ${loginUser.user_name} 님!</h4>
	                               <div class="img-box-sm">
	                               	  	<c:if test="${loginUser.user_img != ''}">
						         			<c:choose>
								         		<c:when test="${loginUser.user_type eq 0}">
									         		<div class="profile-img" style="height:100px;"><img class="icon2" src="/uploadLiClass/user/${loginUser.user_img}" alt="profile"></div>
							         			</c:when>
							         			<c:otherwise>
									         		<div class="profile-img" style="height:100px;"><img class="icon2" src="${loginUser.user_img}" alt="profile"></div>
							         			</c:otherwise>
						         			</c:choose>
					         			</c:if>
					         			<c:if test="${loginUser.user_img == ''}">
							         			<div class="profile-img" style="height:100px;"><img class="icon2" src="/uploadLiClass/user/default-profile.png" alt="profile"/></div>
					         			</c:if>
					         			<c:if test="${loginUser.user_type eq 0}">
					         				<div class="hover-content2">
                                       			<a href="#img-edit" rel="modal:open"><i class="fa-solid fa-pen-to-square" id="profile-edit"></i></a>
                                       		</div>
							         	</c:if>
					         			
				         			</div>
				         			<!-- profile img edit modal start -->
									<div id="img-edit" class="filebox preview-image modal" style="height: 150px; z-index: 2; position: initial; text-align: center;">
										
										<form id="img-update-form">
											<label for="input-file" >
		                             			<a class="main-white-button" style="color : #555; margin: 0;"><i class="fa-regular fa-image"></i>사진선택</a>
											</label>
											<input type="file" class="upload-hidden" id="input-file" name="file" accept="image/png, image/jpeg"  style="display: none;">
	                             		</form>
	                             		
		                             	<a class="btn" id="update-img" ><i class="fa-solid fa-repeat" style="margin:1px;"></i>변경</a>
	                             		<a class="btn" id="delete-img" ><i class="fa-regular fa-user" style="margin:1px;"></i>기본이미지로 변경</a>
	                             		<a class="btn" id="cancel" rel="modal:close"><i class="fa-solid fa-xmark" style="margin:1px;"></i>취소</a>
									</div>
									<!-- profile img edit modal end -->
				         			
				         			<hr>
				         			${updateUser}
	                               <i class="fa-solid fa-calendar-days"></i>
	                               <p>${loginUser.user_regdate} ~</p>
	                               <i class="fa-solid fa-envelope"></i><p>${loginUser.user_email}</p>
	                               <i class="fa-solid fa-phone"></i><p>${loginUser.user_tel}</p>
	                               <div class="main-white-button">
	                               		<a href="/mypage/updateForm" id="edit-btn" style="width: 50%;"><i class="fa-regular fa-user"></i>수정하기</a>
	                               	</div>
	                               <div class="main-white-button">
	                               		<a href="/courseHistory" style="width: 50%;"><i class="fa-solid fa-money-check"></i>수강내역</a>
	                               </div>
	                             </div>
	                           </div>
	                           <div class="col-lg-7 align-self-center" id="pw-check-div" style="display: none" >
	                             <div class="right-text"></div>
                           	   </div>
                         </div>
                       </div>
                     </div>                     	                     	                     		                  