<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/resources/client/mainTheme/js/bootstrap.affix.js"></script>
<script src="/resources/client/mainTheme/js/floatingNav.js"></script>
<link rel="stylesheet" href="/resources/client/mainTheme/css/floatingNav.css" />
<script>
	/* alert message*/
	if('${message}' != ""){
		var message = "${message}" ;
		alert(message);
	}
</script>
 <body id="page-top" data-spy="scroll" data-target=".side-menu">
 
 	<!-- 은아 테스트용  -->
 	<!-- <div id="home"></div>
	homeBody start
	<section role="tophead"id="header-slider" class="section tophead">
	  <div id="myCarousel" class="carousel slide" data-ride="carousel"> 
	    Indicators
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	    </ol>
	    Wrapper for slides
	    <div class="carousel-inner" role="listbox">
	      <div class="item active"> <img src="/resources/client/mainTheme/images/slider/slid1.jpg" alt="Chania">
	        <div class="carousel-caption">
	          <h3>Special LiClass</h3>
	          <p>다들 어디서 하지 했던 ‘그 취미’ 여기 다 있네!</p>
	        </div>
	      </div>
	      <div class="item"> <img src="/resources/client/mainTheme/images/slider/slid2.jpg" alt="Chania">
	        <div class="carousel-caption">
	          <h3>Explore Classes</h3>
	          <p>일상을 다채롭게, 하루 하루 새롭게</p>
	        </div>
	      </div>
	    </div>
	    Controls 
	    <a class="left carousel-control" href="" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span></a> <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span></a></div>
	</section> -->

	<!-- 1. class list start  -->
	<section id="portfolio" class="section portfolio">
		<%@ include file="/WEB-INF/views/client/class/classList.jsp" %>
	</section>
	<!-- 1. class list end  -->
		
	<!-- Testimonials section -->
	<section id="testimonials" class="section testimonials no-padding">
	  <div class="container-fluid">
	    <div class="row no-gutter">
	      <div class="flexslider">
	        <ul class="slides">
	          <li>
	            <div class="col-md-12">
	              <blockquote>
	                <h1>"Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Donec sed odio dui. Phasellus non dolor nibh. Nullam elementum Aenean eu leo quam..." </h1>
	                <p>Rene Brown, Open Window production</p>
	              </blockquote>
	            </div>
	          </li>
	          <li>
	            <div class="col-md-12">
	              <blockquote>
	                <h1>"Cras dictum tellus dui, vitae sollicitudin ipsum. Phasellus non dolor nibh. Nullam elementum tellus pretium feugiat shasellus non dolor nibh. Nullam elementum tellus pretium feugiat." </h1>
	                <p>Brain Rice, Lexix Private Limited.</p>
	              </blockquote>
	            </div>
	          </li>
	          <li>
	            <div class="col-md-12">
	              <blockquote>
	                <h1>"Cras mattis consectetur purus sit amet fermentum. Donec sed odio dui. Aenean lacinia bibendum nulla sed consectetur...." </h1>
	                <p>Andi Simond, Global Corporate Inc</p>
	              </blockquote>
	            </div>
	          </li>
	          <li>
	            <div class="col-md-12">
	              <blockquote>
	                <h1>"Lorem ipsum dolor sit amet, consectetur adipiscing elitPhasellus non dolor nibh. Nullam elementum tellus pretium feugiat. Cras dictum tellus dui sollcitudin." </h1>
	                <p>Kristy Gabbor, Martix Media</p>
	              </blockquote>
	            </div>
	          </li>
	        </ul>
	      </div>
	    </div>
	  </div>
	</section>
	<!-- Testimonials section --> 
	
	<!-- Service Section -->
	<section id="services" class="section services">
	  <div class="container-fluid">
	    <div class="row">
	      <div class="col-md-6 col-sm-6">
	        <div class="services-content">
	          <h4>We're Korea based branding and Programmers agency.</h4>
	          <p>Kim dapibus, Moon ac cursus commodo, Lee mauris condimentum nibh, Lim fermentum massa justo sit amet risus. Jeon sed diam eget risus varius blandit sit amet non magna. Jung quis risus eget urna mollis ornare vel eu leo.</p>
	        </div>
	      </div>
	      <div class="col-md-3 col-sm-6">
	        <div class="services-content">
	          <h5>Brand Experience</h5>
	          <ul>
	            <li><a href="#">Web Design</a></li>
	            <li><a href="#">Mobile Application</a></li>
	            <li><a href="#">Product Development</a></li>
	            <li><a href="#">Packaging</a></li>
	            <li><a href="#">Retail Management</a></li>
	          </ul>
	        </div>
	      </div>
	      <div class="col-md-3 col-sm-6">
	        <div class="services-content">
	          <h5>Media Marketing</h5>
	          <ul>
	            <li><a href="/payment/reserve?user_no=${loginUser.user_no }">결제하기</a></li>
	            <li><a href="#">Social Marketing</a></li>
	            <li><a href="#">Mobile marketing</a></li>
	          </ul>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>
</body>
	<!-- Service Section --> 
	<!-- homeoBody end-->
	
	<!-- floating nav start -->
	<div id="floatMenu">
		<div class="section-block">
			<nav class="side-menu">
		        <ul>
		          <li class="hidden active">
		            <a class="page-scroll" href="#page-top"></a>
		          </li>
		          <li>
		            <a href="#home" class="page-scroll">
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