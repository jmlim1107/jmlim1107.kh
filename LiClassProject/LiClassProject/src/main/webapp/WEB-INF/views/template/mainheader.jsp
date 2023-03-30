<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<!-- 은아) 임시 헤더 
	<!-- header start
	<section class="tophead" role="tophead"> 
	  <header id="header">
	    <div class="header-content clearfix"> <a class="logo" href="/">LiClass</a>
		      <nav class="navigation" role="navigation">
		        <ul class="primary-nav">
		          <li><a href="/">Home</a></li>
		          
		          <c:if test="${loginUser == null}">
		          	<li><a id="login-modal" >로그인</a></li>
		          </c:if>
		          
	              <c:if test="${loginUser != null}">
		         	<li>
		         		<c:if test="${loginUser.user_img != ''}">
		         			<c:choose>
				         		<c:when test="${loginUser.user_type eq 0}">
					         		<a href="/mypage"><img id="profile-thumbnail" src="/uploadLiClass/user/${loginUser.user_img}" />${loginUser.user_name}님</a>
			         			</c:when>
			         			<c:otherwise>
					         		<a href="/mypage"><img id="profile-thumbnail" src="${loginUser.user_img}"/>${loginUser.user_name}님</a>
			         			</c:otherwise>
		         			</c:choose>
	         			</c:if>
	         			
	         			<c:if test="${loginUser.user_img == ''}">
			         			<a href="/mypage"><img id="profile-thumbnail" src="/uploadLiClass/user/default-profile.png" alt="profile"/>${loginUser.user_name}님</a>
	         			</c:if>
	         		</li>
		          	<li><a href="/user/logout">로그아웃</a></li>
		          </c:if>
					<li><a href="/client/qnaboard/noticeBoard">공지사항</a></li>
					<li><a href="/client/qnaboard/qnaBoard">고객센터</a></li>
		        	<li><a href="/liadmin/login">관리자(추후이동예정)</a></li>
		        </ul>
		      </nav>
	     </div>
			<a id="menu-nav-toggle">Menu<span></span></a> 
	  </header>
	</section>
	 header end-->
	
	
	<!-- ======= Header ======= -->
        	<header id="header" class="fixed-top header-scrolled">
       	 		<div class="container d-flex align-items-center justify-content-between">
            		<h1 class="logo"><a href="index.html">LiClass</a></h1>
			            <!-- Uncomment below if you prefer to use an image logo -->
			            <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
			            <nav id="navbar" class="navbar">
			                <ul>
			                <li><a class="nav-link scrollto active" href="/">Home</a></li>
			                <li><a class="nav-link scrollto" href="/class/classList">Class</a></li>
			                <li><a class="nav-link scrollto" href="/client/studio/studioList">Studio</a></li>
			                <li><a class="nav-link scrollto" href="#team">Team</a></li>
			                <li><a class="nav-link scrollto " href="/client/qnaboard/qnaBoard">FAQ</a></li>
			                <c:if test="${loginUser == null}">
			                	<li><a class="nav-link scrollto" id="login-modal">Login</a></li>
			                </c:if>
			                <c:if test="${loginUser != null}">
				                <c:if test="${loginUser.user_img != ''}">
				         			<c:choose>
						         		<c:when test="${loginUser.user_type eq 0}">
							         		<a href="/mypage"><img id="profile-thumbnail" src="/uploadLiClass/user/${loginUser.user_img}" />${loginUser.user_name}님</a>
					         			</c:when>
					         			<c:otherwise>
							         		<a href="/mypage"><img id="profile-thumbnail" src="${loginUser.user_img}"/>${loginUser.user_name}님</a>
					         			</c:otherwise>
				         			</c:choose>
			         			</c:if>
			         			
			         			<c:if test="${loginUser.user_img == ''}">
					         			<a href="/mypage"><img id="profile-thumbnail" src="/uploadLiClass/user/default-profile.png" alt="profile"/>${loginUser.user_name}님</a>
			         			</c:if>
				                <li><a class="nav-link scrollto" href="/user/logout">Logout</a></li>
			                </c:if>
			            </nav><!-- .navbar -->
        		</div>
  			</header><!-- End Header -->

	<!-- login modal start -->
	<div id="login-pop-modal">
	   <div class="modal_content">
		<div class="wrap-login100">
			<button type="button" id="modal_close_btn">X</button>
			<form class="login100-form validate-form" id="login-form">
				<span class="login100-form-title p-b-26">
				</span>
				<span class="login100-form-title p-b-48">
					<i id="title">LiClass</i>
				</span>
	
				<div class="wrap-input100 validate-input" data-validate = "Enter ID">
					<input class="input100" type="text" id="user_email" name="user_email">
					<span class="focus-input100" data-placeholder="Email"></span>
				</div>
	
				<div class="wrap-input100 validate-input" data-validate="Enter password">
					<span class="btn-show-pass">
						<i class="zmdi zmdi-eye" id="title"></i>
					</span>
					<input class="input100" type="password" id="user_pw" name="user_pw">
					<span class="focus-input100" data-placeholder="Password"></span>
				</div>
				<div class="container-login100-form-btn">
					<div class="col-lg-12 text-center mt-3">
					    <div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<a href="#login" class="login100-form-btn" id="login">
								Login
							</a>
						</div>
					</div>
					<!-- 카카오 로그인 -->
			<div class="col-lg-12 text-center mt-3">
			    <div class="wrap-login100-form-btn">
					<div class="login100-form-bgbtn-kakao"></div>
					<a class="login100-form-btn" id="kakao-login" onclick="loginWithKakao()">
						Kakao
					</a>
				</div>
			</div>
			<!-- 네이버 로그인 -->
			<div class="col-lg-12 text-center mt-3">
			    <div class="wrap-login100-form-btn">
					<div class="login100-form-bgbtn-naver"></div>
						<a class="login100-form-btn" id="naver-login" onclick="loginWithNaver()">
										Naver
									</a>
							</div>
						</div>
						<div class="text-center p-t-60">
							<span class="txt0">
							간편로그인을 통한 신규가입의 경우 버튼을 누르면<br/>
							LiClass의 <a class="txt2" href="/user/userTerms">이용약관</a> 및 
							<a class="txt2" href="/user/userPolicy">개인정보 취급방침</a>에 동의하게 됩니다.
							</span>
						</div>
					</div>
					
					<div class="text-center p-t-115">
						<span class="txt1">
							아직 가입하지 않았나요?
						</span>
	
						<a class="txt2" href="/user/signupForm">
							회원가입
						</a>
						<br/>
						<span class="txt1">
							비밀번호를 잊으셨나요?
						</span>
	
						<a class="txt2"  id="find-modal" href="/user/userFindpw">
							비밀번호 찾기
						</a>
					</div>
				</form>
			</div>
	    </div>
	    <div class="modal_layer"></div>
	</div>
	<!-- login modal end -->

