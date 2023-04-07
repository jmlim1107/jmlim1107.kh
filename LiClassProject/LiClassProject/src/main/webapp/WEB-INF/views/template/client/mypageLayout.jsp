<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri = "http://tiles.apache.org/tags-tiles" %>
<%@ include file="/WEB-INF/views/client/client_common.jspf" %>

<%-- 은아) 마이페이지 전용 레이아웃 --%>
	<title>LiClass :: My page</title>
	
	<!-- mypage -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
   	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
   	<link rel="stylesheet" href="/resources/client/mainTheme/css/bootstrap.min.css" >
    <link rel="stylesheet" href="/resources/client/mypage/assets/css/fontawesome.css">
    <link rel="stylesheet" href="/resources/client/mypage/assets/css/templatemo-plot-listing.css">
    <link rel="stylesheet" href="/resources/client/mypage/assets/css/animated.css">
    <link rel="stylesheet" href="/resources/client/mypage/assets/css/owl.css">
    
    <!-- nav  -->
	<script src="/resources/client/mainTheme/js/floatingNav.js"></script>
	<link rel="stylesheet" href="/resources/client/mainTheme/css/floatingNav.css" />
	
	<style>
		html, body {
	    	height: 100%
		}
		#wrap {
		    min-height: calc(100%-120px);
		    position: relative;
		    padding-bottom: 60px;
		}
		.footer{
		  height: 60px;
		  width: 100%;
		  padding: 0 25px;
		}
	</style>
  	</head>
  	<body id="gotop" style="overflow-x: hidden;">
  		<div id="wrap">
			<header class="header" style="height: 0;">
				<tiles:insertAttribute name="header" />
			</header>
		
			<div class="mypageLayout" style="margin-top: 100px;">
			   		<tiles:insertAttribute name="body" />
			</div>
			
		    <nav class="nav">
		    	<tiles:insertAttribute name="nav" />
		    </nav>
   		</div>

   		<footer class="footer" style="margin-bottom:30%;">
			      <ul class="nav justify-content-center border-bottom pb-3 mb-3">
			        <li class="nav-item"><a href="/" class="nav-link px-2 text-muted">Home</a></li>
			        <li class="nav-item"><a href="/class/classList" class="nav-link px-2 text-muted">Classes</a></li>
			        <li class="nav-item"><a href="/studio/studioList" class="nav-link px-2 text-muted">Center</a></li>
			        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
			        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
			      </ul>
			      <p class="text-center text-muted">© 2022 Company, Kh정보교육원</p>
		</footer>
<!-- 하단 script 시작==============================================================================================-->
	<!-- login --> 
	<!--===============================================================================================-->
	<script src="/resources/client/login/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/client/login/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/client/login/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/client/login/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/client/login/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/client/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="/resources/client/login/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/client/login/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/client/login/js/login.js"></script>
		
	<!-- mypage -->
 	<!-- <script src="/resources/client/mypage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
	<script src="/resources/client/mypage/vendor/jquery/jquery.min.js"></script>
 	<script src="/resources/client/mypage/assets/js/owl-carousel.js"></script>
 	<script src="/resources/client/mypage/assets/js/animation.js"></script>
 	<script src="/resources/client/mypage/assets/js/imagesloaded.js"></script>
 	<script src="/resources/client/mypage/assets/js/custom.js"></script>

<!-- 하단 script 끝==============================================================================================-->

	</body>
</html>
