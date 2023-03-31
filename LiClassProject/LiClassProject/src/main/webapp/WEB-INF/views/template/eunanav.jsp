<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--은아)2. 플로팅 메뉴 js,css  -->
<script src="/resources/client/mainTheme/js/floatingNav.js"></script>
<link rel="stylesheet" href="/resources/client/mainTheme/css/floatingNav.css" />

	<!-- 은아)플로팅메뉴  -->
	<!-- floating nav start -->
	<div id="floatMenu">
		<div class="section-block">
			<nav class="side-menu">
		        <ul>
		          <li class="hidden active">
		            <a class="page-scroll" href="#page-top"></a>
		          </li>
		          <li>
		            <a href="#page-top" class="page-scroll">
		              <span class="menu-title">맨 위로</span>
		              <span class="dot"></span>
		            </a>
		          </li>
		          
		          <li>
		          	   <c:if test="${loginUser == null}">
		          			  <a href="#page-top" id="floating-login" class="page-scroll">
				              <span class="menu-title">로그인</span>
				              <span class="dot"></span>
				            </a>
			           </c:if>
					          
			           <c:if test="${loginUser != null}">
				           	<a href="/mypage" class="page-scroll">
				              <span class="menu-title">마이페이지</span>
				              <span class="dot"></span>
				            </a>
			           </c:if>
		          </li>
		          <c:if test="${loginUser != null}">
		          <li>
		            <a href="/user/logout" class="page-scroll">
		              <span class="menu-title">로그아웃</span>
		              <span class="dot"></span>
		            </a>
		          </li>
		          </c:if>
		          <li>
		            <a id="floating-recent" class="page-scroll" >
		              <span class="menu-title">최근 본 클래스</span>
		              <span class="dot"></span>
		            </a>
		          </li>
		          <li id="recent" style="visibility: hidden; display: grid" >
			         <div id="recentDiv" style="display: grid">
				 		<a class="recent-a" id="first-a"><img class="recent-img" id="first-img" style="visiblity:hidden"></a>
				 		<a class="recent-a"  id="second-a" ><img class="recent-img" id="second-img" style="visiblity:hidden"></a>
				 		<a class="recent-a" id="third-a"><img class="recent-img" id="third-img" style="visiblity:hidden"></a>
				 		<a id="recent-del"><i class="fa-solid fa-trash"></i></a>
				 	</div>
		          </li>
		            
		        </ul>
		      </nav>
		</div>
	</div>
	<!-- floating nav end -->