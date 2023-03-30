<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
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

	<title>Insert title here</title>
	
	<style>
        * { box-sizing: border-box; }
        .video-background {
         
          position: fixed;
          top: 0; right: 0; bottom: 0; left: 0;
          z-index: -99;
        }
        .video-foreground,
        .video-background iframe {
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          pointer-events: none;
        }
        #vidtop-content {
            top: 0;
            color: black;
        }
        .vid-info { position: absolute; top: 0; right: 0; width: 33%; background: rgba(0,0,0,0.3); color: #fff; padding: 1rem; font-family: Avenir, Helvetica, sans-serif; }
        .vid-info h1 { font-size: 2rem; font-weight: 700; margin-top: 0; line-height: 1.2; }
        .vid-info a { display: block; color: #fff; text-decoration: none; background: rgba(0,0,0,0.5); border-bottom: none; margin: 1rem auto; text-align: center; }
        @media (min-aspect-ratio: 16/9) {
          .video-foreground { height: 300%; top: -100%; }
        }
        @media (max-aspect-ratio: 16/9) {
          .video-foreground { width: 300%; left: -100%; }
        }
        @media all and (max-width: 600px) {
        .vid-info { width: 50%; padding: .5rem; }
        .vid-info h1 { margin-bottom: .2rem; }
        }
        @media all and (max-width: 500px) {
        .vid-info .acronym { display: none; }
        }
        </style>
</head>
	<body>
		 <div class="video-background">
       <div class="video-foreground">
       <!--  <iframe class="ww"  src="https://www.youtube.com/embed/DNf6mIZz6Zo?controls=0?rel=0&autoplay=1&version=3&loop=1""  frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
         -->
        </div>
      </div>
    	<div id="vidtop-content">
        	
		    <!-- ======= Hero Section ======= -->
		    <section id="hero">
			    <div class="video-container">
			        <iframe width="560" height="315" src="https://www.youtube.com/embed/DNf6mIZz6Zo?controls=0&autoplay=1&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
			    </div>      
		  	</section><!-- End Hero -->
			
			<!-- ======= About Section ======= -->
			<section id="about" class="about">
			    <div class="container">
			      <div class="section-title">
			        <h2>About</h2>
			        <h3>Learn More <span>About Us</span></h3>
			        <p>안녕하세요. LiClass 입니다. 저희 LiCLass는 전국 각지에 있는 여러가지 원데이 클래스를  
			            확인하고 수강할 수 있는 플랫폼 입니다.</p>
			      </div>
			
			      <div class="row content">
			        <div class="col-lg-6">
			          <p>
			            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
			            magna aliqua.
			          </p>
			          <ul>
			            <li><i class="ri-check-double-line"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat</li>
			            <li><i class="ri-check-double-line"></i> Duis aute irure dolor in reprehenderit in voluptate velit</li>
			            <li><i class="ri-check-double-line"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat</li>
			          </ul>
			        </div>
			        <div class="col-lg-6 pt-4 pt-lg-0">
			          <p>
			            Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
			            velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
			            culpa qui officia deserunt mollit anim id est laborum.
			          </p>
			          <a href="#" class="btn-learn-more">Learn More</a>
			        </div>
			      </div>
			    </div>
			  </section><!-- End About Section! -->


 
			  <!-- ======= F.A.Q Section ======= -->
			  <section id="faq" class="faq">
			    <div class="container">
			      <div class="section-title">
			        <h2>F.A.Q</h2>
			        <h3>Frequently Asked <span>Questions</span></h3>
			      </div>
			      <ul class="faq-list">
			        <li>
			          <div data-bs-toggle="collapse" href="#faq6" class="collapsed question">후기 작성은 어디서 하나요 ?<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
			          <div id="faq6" class="collapse" data-bs-parent=".faq-list">
			            <p>
			              Laoreet sit amet cursus sit amet dictum sit amet justo. Mauris vitae ultricies leo integer malesuada nunc vel. Tincidunt eget nullam non nisi est sit amet. Turpis nunc eget lorem dolor sed. Ut venenatis tellus in metus vulputate eu scelerisque. Pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Nibh tellus molestie nunc non blandit massa enim nec.
			            </p>
			          </div>
			        </li>

			        <li>
			          <div data-bs-toggle="collapse" class="collapsed question" href="#faq1"> 예약 완료 후 수강내역은 어디서 확인 하나요 ?<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
			          <div id="faq1" class="collapse" data-bs-parent=".faq-list">
			            <p>
			              Feugiat pretium nibh ipsum consequat. Tempus iaculis urna id volutpat lacus laoreet non curabitur gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus non.
			            </p>
			          </div>
			        </li>
			
			        <li>
			          <div data-bs-toggle="collapse" href="#faq2" class="collapsed question">환불 절차가 궁금합니다 !<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
			          <div id="faq2" class="collapse" data-bs-parent=".faq-list">
			            <p>
			              Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
			            </p>
			          </div>
			        </li>
			
			        <li>
			          <div data-bs-toggle="collapse" href="#faq3" class="collapsed question">예약 날짜 및 시간 변경에 대해서 어떻게 확인하나요 ? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
			          <div id="faq3" class="collapse" data-bs-parent=".faq-list">
			            <p>
			              Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque eu tincidunt. Lectus urna duis convallis convallis tellus. Urna molestie at elementum eu facilisis sed odio morbi quis
			            </p>
			          </div>
			        </li>
			
			        
			        <li>
			          <div data-bs-toggle="collapse" href="#faq5" class="collapsed question">클래스 양도 가능한가요 ?<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
			          <div id="faq5" class="collapse" data-bs-parent=".faq-list">
			            <p>
			              Molestie a iaculis at erat pellentesque adipiscing commodo. Dignissim suspendisse in est ante in. Nunc vel risus commodo viverra maecenas accumsan. Sit amet nisl suscipit adipiscing bibendum est. Purus gravida quis blandit turpis cursus in
			            </p>
			          </div>
			        </li>
			      </ul>
			    </div>
			  </section><!-- End F.A.Q Section -->

			  <!-- ======= Team Section ======= -->
			  <section id="team" class="team">
			    <div class="container">
			      <div class="section-title">
			        <h2>Team</h2>
			        <h3>LiCLass <span>Team</span></h3>
			        <p>LiClass member introduction</p>
			      </div>
			
			      <div class="row">
			        <div class="col-lg-2 col-md-6 d-flex align-items-stretch">
			          <div class="member">
			            <div class="member-img">
			              <img src="/resources/images/Team/ea.png" class="img-fluid" alt="">
			              <div class="social">
			                <a href=""><i class="bi bi-twitter"></i></a>
			                <a href=""><i class="bi bi-facebook"></i></a>
			                <a href=""><i class="bi bi-instagram"></i></a>
			                <a href=""><i class="bi bi-linkedin"></i></a>
			              </div>
			            </div>
			            <div class="member-info">
			              <h4>김은아</h4>
			              <span>팀장</span>
			  
			            </div>
			          </div>
			        </div>
			
			        <div class="col-lg-2 col-md-6 d-flex align-items-stretch">
			          <div class="member">
			            <div class="member-img">
			              <img src="/resources/images/Team/sy.png" class="img-fluid" alt="">
			              <div class="social">
			                <a href=""><i class="bi bi-twitter"></i></a>
			                <a href=""><i class="bi bi-facebook"></i></a>
			                <a href=""><i class="bi bi-instagram"></i></a>
			                <a href=""><i class="bi bi-linkedin"></i></a>
			              </div>
			            </div>
			            <div class="member-info">
			              <h4>정소영</h4>
			              <span>조원</span>
			            </div>
			          </div>
			        </div>
			
			
			        <div class="col-lg-2 col-md-6 d-flex align-items-stretch">
			          <div class="member">
			            <div class="member-img">
			              <img src="/resources/images/Team/ms.png" class="img-fluid" alt="">
			              <div class="social">
			                <a href=""><i class="bi bi-twitter"></i></a>
			                <a href=""><i class="bi bi-facebook"></i></a>
			                <a href=""><i class="bi bi-instagram"></i></a>
			                <a href=""><i class="bi bi-linkedin"></i></a>
			              </div>
			            </div>
			            <div class="member-info">
			              <h4>문민섭</h4>
			              <span>조원</span>
			            </div>
			          </div>
			        </div>
			
			
			        <div class="col-lg-2 col-md-6 d-flex align-items-stretch">
			          <div class="member">
			            <div class="member-img">
			              <img src="/resources/images/Team/ob.png" class="img-fluid" alt="">
			              <div class="social">
			                <a href=""><i class="bi bi-twitter"></i></a>
			                <a href=""><i class="bi bi-facebook"></i></a>
			                <a href=""><i class="bi bi-instagram"></i></a>
			                <a href=""><i class="bi bi-linkedin"></i></a>
			              </div>
			            </div>
			            <div class="member-info">
			              <h4>전웅배</h4>
			              <span>조원</span>
			            </div>
			          </div>
			        </div>
			
			        <div class="col-lg-2 col-md-6 d-flex align-items-stretch">
			          <div class="member">
			            <div class="member-img">
			              <img src="/resources/images/Team/km.png" class="img-fluid" alt="">
			              <div class="social">
			                <a href=""><i class="bi bi-twitter"></i></a>
			                <a href=""><i class="bi bi-facebook"></i></a>
			                <a href=""><i class="bi bi-instagram"></i></a>
			                <a href=""><i class="bi bi-linkedin"></i></a>
			              </div>
			            </div>
			            <div class="member-info">
			              <h4>이경민</h4>
			              <span>조원</span>
			            </div>
			          </div>
			        </div>
			
			        <div class="col-lg-2 col-md-6 d-flex align-items-stretch">
			          <div class="member">
			            <div class="member-img">
			              <img src="/resources/images/Team/jm.png" class="img-fluid" alt="">
			              <div class="social">
			                <a href=""><i class="bi bi-twitter"></i></a>
			                <a href=""><i class="bi bi-facebook"></i></a>
			                <a href=""><i class="bi bi-instagram"></i></a>
			                <a href=""><i class="bi bi-linkedin"></i></a>
			              </div>
			            </div>
			            <div class="member-info">
			              <h4>임지민</h4>
			              <span>조원</span>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			  </section><!-- End Team Section -->
    	</div>
	</body>
</html>