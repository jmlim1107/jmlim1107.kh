<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri = "http://tiles.apache.org/tags-tiles" %>
<%@ include file="/WEB-INF/views/client/common.jspf" %>
	<title>LiClass</title>
  </head>
  
	<div id="header" class="header">
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
