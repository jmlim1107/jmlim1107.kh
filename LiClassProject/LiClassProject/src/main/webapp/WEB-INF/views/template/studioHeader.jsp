<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
		<!-- ======= Header ======= -->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript">
				$(function(){
					let uri = "${requestScope['javax.servlet.forward.request_uri']}";
					$("li > a.menu").each(function(){
						$(this).removeClass("active");
						if( uri != '/' && $(this).attr('href').match(uri)){
							$(this).addClass("active");
						}
					});
				});
			</script>
			<c:set var="uri" value="${requestScope['javax.servlet.forward.request_uri']}"/>

        	<header id="header" class="fixed-top header-scrolled">
       	 		<div class="container d-flex align-items-center justify-content-between">
            		<h1 class="logo"><a href="/">LiClass</a></h1>
			            <!-- Uncomment below if you prefer to use an image logo -->
			            <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
			            <nav id="navbar" class="navbar">
			                <ul>
			                <li><a class="nav-link scrollto active" href="/">Home</a></li>
			                <li><a class="nav-link scrollto menu" href="/class/classList">Class</a></li>
			                <li><a class="nav-link scrollto menu" href="/client/studio/studioList">Studio</a></li>
			                <li><a class="nav-link scrollto menu" href="#team">Team</a></li>
			                <li><a class="nav-link scrollto menu" href="/client/qnaboard/qnaBoard">FAQ</a></li>
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
			                </ul>
			            </nav><!-- .navbar -->
        		</div>
  			</header><!-- End Header -->
