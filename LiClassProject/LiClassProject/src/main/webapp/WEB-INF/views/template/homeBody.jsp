<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/resources/client/mainTheme/js/bootstrap.affix.js"></script>

<!--은아) 플로팅 메뉴 js,css  -->
<script src="/resources/client/mainTheme/js/floatingNav.js"></script>
<link rel="stylesheet" href="/resources/client/mainTheme/css/floatingNav.css" />

<style>
#header{width: 100%;
    margin: 0px;
    padding : 29px 0;
    }
#navbar.navbar{ 
    margin: 0px 0px 0px 400px;

}
#header.header-scrolled{padding : 20px 0;}

</style>

<script>

	/* 은아)메인화면 redirect 시 전달메시지 있을 때 */
	if('${message}' != ""){
		var message = "${message}" ;
		alert(message);
	}
</script>
 <body id="page-top" data-spy="scroll" data-target=".side-menu">
	<%-- <!-- 지민)클래스 리스트 -->
	<!-- 1. class list start  -->
	<section id="portfolio" class="section portfolio">
		<%@ include file="/WEB-INF/views/client/class/classList.jsp" %>
	</section>
	<!-- 1. class list end  --> --%>
	<div class="video-background"></div>
       		
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
			            누구나 원하는 취미 여가를 쉽고 당연하게 즐길 수 있도록, 
						사람과 사람을 연결하고 공예, 요리, 미술, 플라워, 뷰티, 여행 등
						세상을 더 경험할 수 있도록 도와주는 서비스 플랫폼 LiClass.
			          </p>
			          <ul>
			            <li><i class="ri-check-double-line"></i> LiClass에서 당신의 취미를 찾아보세요.</li>
			            <li><i class="ri-check-double-line"></i> 이제부터 낭만 가득한 추억을 만들어볼까요?</li>
			            <li><i class="ri-check-double-line"></i> LiClass를 통해 지친 일상 속에서 활력을 찾고 일상을 바꾸는 경험을 하시기를 응원합니다.</li>
			          </ul>
			        </div>
			        <div class="col-lg-6 pt-4 pt-lg-0">
			          <p>
						다양한 카테고리의 재밌고 색다른 클래스
			            LiClass의 다양한 수업들을 단체클래스로 편하게 즐겨보실 수 있어요.
			            LiClass로 색다른 행사를 시작해요.
			          </p>
			          <a href="/class/classList" class="btn-learn-more">클래스 구경하러가기</a>
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
			        <h3>LiClass <span>Team</span></h3>
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
			                <a href="https://instagram.com/euuuuunaaaaa?igshid=YmMyMTA2M2Y="><i class="bi bi-instagram"></i></a>
			                <a href="https://github.com/kimeunazip"><i class="fa-brands fa-github"></i></a>
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
			                <a href="https://www.instagram.com/sy07222/"><i class="bi bi-instagram"></i></a>
			                <a href="https://github.com/wjdthdud13"><i class="fa-brands fa-github"></i></a>
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
			                <a href="https://instagram.com/lerudals__?igshid=YmMyMTA2M2Y="><i class="bi bi-instagram"></i></a>
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