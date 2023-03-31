<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="/WEB-INF/views/client/client_common.jspf" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>은아테스트중</title>
    <!-- default setting start  -->
		<!-- jquery -->
	    <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type = "text/javascript" src = "/resources/include/js/jquery-3.6.2.min.js"></script>
		<!-- bootstrap -->
		<script type = "text/javascript" src = "/resources/include/dist/js/bootstrap.min.js" /></script>
	    <link rel="stylesheet" type = "text/css" href="/resources/include/dist/css/bootstrap.min.css" />
	    <link rel="stylesheet" type = "text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
	    <!-- icon -->
	    <link rel="shortcut icon" href="/resources/static/images/Licon.png" />
	    <link rel="apple-touch-icon" href="/resources/static/images/Licon.png" />
	    
	 	<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
	    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	
	    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
     <!-- default setting end  -->
  </head>

  <body>
  
	<div class="header">
		<tiles:insertAttribute name="header" />
	</div>
	
    <!-- floating right navbar -->
    <nav class="nav">
    	<tiles:insertAttribute name="nav" />
    </nav>

    <!-- Begin page content -->
    <div class="eunaLayout">
      <tiles:insertAttribute name="body" />
    </div>

      <div class="container">
	    <footer class="py-3 my-4">
	      <ul class="nav justify-content-center border-bottom pb-3 mb-3">
	        <li class="nav-item"><a href="/" class="nav-link px-2 text-muted">Home</a></li>
	        <li class="nav-item"><a href="/class/classList" class="nav-link px-2 text-muted">Classes</a></li>
	        <li class="nav-item"><a href="/studio/studioList" class="nav-link px-2 text-muted">Center</a></li>
	        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
	        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
	      </ul>
	      <p class="text-center text-muted">© 2022 Company, Kh정보교육원</p>
	    </footer>
	  </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
    <script src="/resources/include/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
    
    <!-- mainTheme --> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
	<script src="/resources/client/mainTheme/js/bootstrap.min.js"></script> 
	<script src="/resources/client/mainTheme/js/jquery.flexslider-min.js"></script> 
	<script src="/resources/mainTheme/js/retina.min.js"></script>
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
  </body>
</html>
    