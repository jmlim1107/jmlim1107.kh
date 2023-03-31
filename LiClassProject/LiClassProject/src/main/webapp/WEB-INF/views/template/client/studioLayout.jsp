<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri = "http://tiles.apache.org/tags-tiles" %>
<%@ include file="/WEB-INF/views/client/client_common.jspf" %>
	<title>LiClass</title>
	<link rel="stylesheet" type="text/css" href="/resources/include/css/default.css" />
    <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/resources/include/js/common.js"></script>
    <script src="https://kit.fontawesome.com/44647c18a5.js" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="/resources/include/dist/studio/assets/css/main.css" />
   <link rel="stylesheet" href="/resources/include/dist/studio/assets/css/noscript.css" />
	
	<!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="/resources/static/image/icon.png" />
    <link rel="apple-touch-icon" href="/resources/static/image/icon.png" />
    <!-- 모바일 웹 페이지 설정 끝 -->
    
	<!-- 부트스트랩 -->
    <link rel="stylesheet" type = "text/css" href="/resources/include/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type = "text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
	<!-- script -->
	<script type = "text/javascript" src = "/resources/include/js/jquery-3.6.2.min.js"></script>
	<script type = "text/javascript" src = "/resources/include/dist/js/bootstrap.min.js" /></script>
    
  </head>
  
	<%-- <div id="header" class="header">
		<tiles:insertAttribute name="header" />
	</div> --%>
	
	<body>
	  <div class="clientLayout">
	   		<tiles:insertAttribute name="body" />
	  </div>
	</body>
	
	<%-- <footer class="footer">
	     <tiles:insertAttribute name="footer" />
	</footer> --%>
    
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
	
	    
</html>
