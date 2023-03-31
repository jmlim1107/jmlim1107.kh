<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri = "http://tiles.apache.org/tags-tiles" %>
<%@ include file="/WEB-INF/views/client/client_common.jspf" %>
<!--지민) 메인화면  -->
	
	<title>LiClass</title>
	<!-- 부트스트랩 -->
    <link rel="stylesheet" type = "text/css" href="/resources/include/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type = "text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
	<!-- script -->
	<script type = "text/javascript" src = "/resources/include/js/jquery-3.6.2.min.js"></script>
	<script type = "text/javascript" src = "/resources/include/dist/js/bootstrap.min.js" /></script>
    
  	<!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="/resources/static/image/icon.png" />
    <link rel="apple-touch-icon" href="/resources/static/image/icon.png" />
    <!-- 모바일 웹 페이지 설정 끝 -->

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="/resources/include/mainLayout/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/include/mainLayout/vendor/bootstrap-icons/bootstrap-icons.scss" rel="stylesheet">
    <link href="/resources/include/mainLayout/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="/resources/include/mainLayout/vendor/glightbox/css/glightbox.css" rel="stylesheet">
    <link href="/resources/include/mainLayout/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="/resources/include/mainLayout/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <script src="/resources/include/mainLayout/js/main.js"></script>
    <script src="/resources/include/mainLayout/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Template Main CSS File -->
    <link href="/resources/include/mainLayout/css/style.css" rel="stylesheet">
		
  </head>
  	<!-- 은아) 0331 로그인모달창 회색배경때문에 0으로 변경해봄 -->
	<div class="header" style="height: 0;">
		<tiles:insertAttribute name="header" />
	</div>
	
	<body>
	  <div class="clientLayout">
	   		<tiles:insertAttribute name="body" />
	  </div>
	</body>
	
	<footer class="footer">
	     <tiles:insertAttribute name="footer" />
	</footer>
    
    
	<!-- mainTheme --> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
	<script src="/resources/client/mainTheme/js/bootstrap.min.js"></script> 
	<script src="/resources/client/mainTheme/js/jquery.flexslider-min.js"></script> 
	<!-- <script src="/resources/mainTheme/js/retina.min.js"></script>  -->
	
	<script src="/resources/client/mainTheme/js/modernizr.js"></script> 
	<script src="/resources/client/mainTheme/js/main.js"></script>
	
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
 	<script src="/resources/client/mypage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 	<script src="/resources/client/mypage/assets/js/owl-carousel.js"></script>
	<script src="/resources/client/mypage/vendor/jquery/jquery.min.js"></script>
 	<script src="/resources/client/mypage/assets/js/animation.js"></script>
 	<script src="/resources/client/mypage/assets/js/imagesloaded.js"></script>
 	<script src="/resources/client/mypage/assets/js/custom.js"></script>

	<%-- qna board --%>
	<link rel="stylesheet" href="/resources/client/qnaBoard/css/css.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</html>
