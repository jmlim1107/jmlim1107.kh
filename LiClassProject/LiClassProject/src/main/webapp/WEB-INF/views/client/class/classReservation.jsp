<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 부트스트랩 -->
<link rel="stylesheet" type = "text/css" href="/resources/include/dist/css/bootstrap.min.css" />
<link rel="stylesheet" type = "text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
<script type = "text/javascript" src ="/resources/include/dist/js/bootstrap.min.js"></script>
<!-- 제이쿼리 -->
<script type = "text/javascript" src = "/resources/include/js/jquery-3.6.2.min.js"></script>

<!-- calendar07.. -->
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
<!-- bootstrap 4.7.0 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- bootstrap 5.1 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/reserve/css/style.css">

<link rel="stylesheet" href="/resources/reserve/css/reserve.css">
<style type="text/css">
	#collapseOne, #collapseTwo, #collapseThree, #collapseFour{
		visibility: visible;
	}
	#header.header-scrolled {
    padding: 20px 0;
    z-index: -1;
}
</style>
<script type="text/javascript" src="/resources/include/js/jquery-3.6.2.min.js"></script>
<script type="text/javascript" src="/resources/reserve/js/reserve.js"></script>
<script type="text/javascript">
	$(function(){
		let c_no = ${param.c_no};
		//-------1) 각 td에 온전한 날짜값을 부여--------//
		insertDate();											//1. 페이지 로딩과 동시에 insertDate 처리(1회)
		tdActive( c_no );
		$(".moveBtn").click(function(){ 		//2. 페이지 이동할때마다 td에 부여된 날짜 data-no를 reset해준다..(n회반복!)
			insertDate();
			tdActive( c_no );
		});
		
		//------2) 각 td 클릭시 해당날짜의 예약정보조회------//
		$("td").click(function(){
			
			$(".episodeBox").detach(); //이전에 만들어 놓았던 것들 다 없애버림
			
			//폼완성
			let clickDate = $(this).attr("data-no");
			$("#ep_date").val(clickDate);
			
			//폼전송 -> 해당날짜의 회차리스트(json) 받음
			$.ajax({
				url : "/admin/episode/epListOfDay",
				type : "post",
				dataType : "json",
				data : $("#epListOfDay").serialize(),
				error : function(xhr, textStatus, errorThrown){		
					alert( textStatus + "(HTTP-"+ xhr.status + " / " + errorThrown + ")" );
				},
				success : function(data){
					$(data).each(function(){
						let ep_no = this.ep_no;
						let ep_price = this.ep_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원";
						let ep_date = this.ep_date;
						let ep_cnt = this.ep_cnt;
						let ep_reserveState = this.ep_state1;
						let c_maxcnt = this.c_maxcnt;
						let c_endtime = this.c_endtime;
						let until_cnt = this.c_maxcnt - this.ep_cnt;
						//part1에 날짜 출력
						let day = ep_date.substring( 0, ep_date.indexOf(')')+1 );
						$(".part1").html(day);
						//part2에 회차box 출력
						templateEp( ep_no, ep_reserveState, ep_date, ep_price, ep_cnt, c_maxcnt, c_endtime, until_cnt  );
					});
				}
			}); //ajax의 종료
			$("#collapseTwo").addClass("show");
			$("button[data-bs-target='#collapseTwo']").removeClass("accordion-button collapsed").addClass("accordion-button");
			$("button[data-bs-target='#collapseTwo']").attr("aria-expanded", "true");
			
		}); //td클릭시

		///------3) 인원수 카운터
		$(".plusBtn").click(function(){
			let cnt = $(".checkEp").attr('data-code');
			//console.log(cnt+"개개개"); cnt를 세는 시점은 plus버튼이 눌러졌을때 !!
			CalCount('p', this, cnt);
		});
		$(".minBtn").click(function(){
			let cnt = $(".checkEp").attr('data-code');
			CalCount('m', this, cnt);
		});
		
		//------4) 각 episodeBox 클릭(=하나의 단독회차선택) => 폼만들기
		let ep_price = 0;
		$(document).on("click", ".episodeBox",function(){
			$("#r_cnt").val(0); //비정상흐름 제어
			$("#sample_cnt").val(0);
			// 인원선택, 결제선택 부분 오픈
			$("#collapseThree").addClass("show");
			$("#collapseFour").addClass("show");
			$("button[data-bs-target='#collapseThree']").removeClass("accordion-button collapsed").addClass("accordion-button");
			$("button[data-bs-target='#collapseThree']").attr("aria-expanded", "true");
			$("button[data-bs-target='#collapseFour']").removeClass("accordion-button collapsed").addClass("accordion-button");
			$("button[data-bs-target='#collapseFour']").attr("aria-expanded", "true");
			
			/* 클래스 checkEp ::: 선택된 episodeBox로 
			    이 클래스를 가진 유일한 episodeBox의 정보가 폼에 입력 & reservtitle, reservtime, reservinfo에 출력 */
			$(".episodeBox").removeClass("checkEp");  //기존의 모든 episodeBox에서 제거
			$(this).addClass("checkEp")	;								//클릭된 곳에 유일하게 부여
			
			//해당 에피소드의 데이터를 가져오기 위함
			let ep_no = $(this).attr("data-num");
			$("#ep_no").val( ep_no );											// 1-- 폼에 ep번호입력
			
			//이를 이용해 episode의 정보를 가져옴 & 예약 폼 만들기
			
			$.ajax({
				url : "/admin/episode/epReserve?ep_no="+$("#ep_no").val(),
				type : "get",
				dataType : "json",
				error : function(xhr, textStatus, errorThrown){		
					alert( textStatus + "(HTTP-"+ xhr.status + " / " + errorThrown + ")" );
				},
				success : function(data){
					$("#c_title").val(data.c_title);					// 3-- 폼에 ep제목입력
					$("#r_date").val(data.ep_date);				// 4-- 폼에 ep날짜 & 시간입력
					ep_price = data.ep_price;
					let r_price = data.ep_price * Number($("#r_cnt").val());
					$("#r_price").val( r_price );  // 5--폼에 연산된 가격입력(비정상흐름 : 인원선택-> ep변경)
					
					//###정보출력변환###
					$("#reservtitle").html(data.c_title); 
					$("#reservtime").html(data.ep_date); 
					$("#reservInfo").html($("#r_cnt").val()+"명 ");

					$("#reservInfo").append( r_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원" );
				}
			}); //ajax의 종료
			
			
		}); //episodeBox의 클릭이벤트
		
		$(".rcntBtn").click(function(){
			$("#r_cnt").val( $("#sample_cnt").val() );				// 2--폼에 cnt 입력
			$("#r_price").val( ep_price * Number($("#r_cnt").val()) );	// 4--폼에 연산된 가격입력(정상흐름 : ep선택-> 인원선택)
			
			//###정보출력변환###
			$("#reservtitle").html($("#c_title").val()); 
			$("#reservtime").html($("#r_date").val()); 
			$("#reservInfo").html($("#r_cnt").val()+"명 ");
			$("#reservInfo").append( $("#r_price").val().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원" );
		});
		
		$(document).on("click", ".payBtn", function(){
			if( $("#r_cnt").val()==0 ){
				alert("인원수를 선택해주세요");
				return;
			} else {
			   var today = new Date();
	           var hours = today.getHours(); // 시
	           var minutes = today.getMinutes();  // 분
	           var seconds = today.getSeconds();  // 초
	           var milliseconds = today.getMilliseconds();
	           var makeMerchantUid = hours*13 +  minutes + seconds + milliseconds;
	           console.log(makeMerchantUid);
	           $("#r_no").val(makeMerchantUid);
	           
	           $("#reservFrm").attr({
	        	   "method":"post",
	        	   "action":"/client/reserve/makeReserve"
	           });
	           $("#reservFrm").submit();
			} 
		});//결제버튼 클릭 종료
		
		//모달 닫았을때 선택내용 reset
		$('#reserve-modal').on('hidden', function (){
			console.log("엑스엑스");
			$("#epListOfDay").each(function(){
				this.reset();
			});
			$("#reservFrm").each(function(){
				this.reset();
			});
			//#collapseOne, #collapseTwo, #collapseThree, #collapseFour
    	});
		
		
	}); //최상위$
</script>

<%--  cloudflare --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" type = "text/css" href="/resources/client/classDetail/css/classReservaion_modal.css" />
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script> --%>

<%-- 클래스의 해당일자 회차정보들을 얻어오기 위한 폼 --%>
<form id="epListOfDay">
	<input type="hidden" name="c_no" value="${param.c_no }">
	<input type="hidden" id="ep_date" name="ep_date"/>
</form>
 <%-- 예약 insert를 위한 폼 --%>
<form id="reservFrm">
	<input type="hidden" name="r_no" id="r_no"/>
	<input type="hidden" name="user_no" value="${ loginUser.user_no }"/> 
	<input type="hidden" name="ep_no" id="ep_no"/>
	<input type="hidden" name="c_title" id="c_title"/>
	<input type="hidden" name="r_date" id="r_date"/>
	<input type="hidden" name="r_price" id="r_price"/>
	<input type="hidden" name="r_cnt" id="r_cnt"/>
</form>	

<script src="/resources/reserve/js/jquery.min.js"></script>
 <script src="/resources/reserve/js/popper.js"></script>
 <script src="/resources/reserve/js/bootstrap.min.js"></script>
 <script src="/resources/reserve/js/main.js"></script>

<!-- episode Box 
<div  id="ep_template">
	<table>
		<tr>
			<td colspan="6" class="text-left epdate">오전 00:00 ~ 오전 00:30</td>
		</tr>
		<tr>
			<td colspan="4" class="text-left"><span class="eprice">0원</span></td>
			<td colspan="2" class="text-right"><span class="nowcnt">0</span>/<span class="maxcnt">0</span></td>
		</tr>
	</table>
</div>-->
<!-- episode Box -->

		<div class="row">
             <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb30">
                 <div class="class-booking-form">
                     <form>
                         <div class="row">
	                       	<!--1. class info start --> 
	                          	<%@ include file="/WEB-INF/views/client/class/classReservation-1.classInfo.jsp" %>
	                        <!--1. class info end --> 
	                            
	                         <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	        			 	 <!-- 예약버튼 -->
	                         <button type="button" class="main-white-button goReserve">
	                                <a href="#reserve-modal" rel="modal:open"><i class="fa-regular fa-hand-point-up"></i>예약하기</a>
	                          </button>
						
							 <%--  reserve modal start   --%>
							 <div class="modal" id="reserve-modal" style="z-index: 1; position: relative; text-align: center; height: 100%; width:100%;
							 overflow:hidden; left:auto; padding: 0px">		
					<a href="#close-modal" rel="modal:close" class="close-modal" style="position: relative;left: 98%;z-index: 3">Close</a>
					<div style="width:100%;height:100%">
					<div class="elegant-calencar d-md-flex" style="margin: 70px auto;">
				      <div class="calendar-wrap" style="background:#FDF5E6;"><!-- 캘린더 부분 -->
				      	<div class="w-100 button-wrap">
					      	<div class="pre-button d-flex align-items-center justify-content-center disabled moveBtn"><i class="fa fa-chevron-left"></i></div>
					      	<div class="print-month" style="font-size:15px;color:#5a5a5;font-weight:bold"></div> 
					      	<div class="next-button d-flex align-items-center justify-content-center moveBtn"><i class="fa fa-chevron-right"></i></div>
				      	</div>
				        <table id="calendar">
			            <thead>
			                <tr>
		                    <th>일</th>
		                    <th>월</th>
		                    <th>화</th>
		                    <th>수</th>
		                    <th>목</th>
		                    <th>금</th>
		                    <th>토</th>
			                </tr>
			            </thead>
			            <tbody>
		                <tr>
		                  <td style="background:#FDF5E6"></td>
		                  <td style="background:#FDF5E6"></td>
		                  <td style="background:#FDF5E6"></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                </tr>
		                <tr>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                </tr>
		                <tr>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                </tr>
		                <tr>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                </tr>
		                <tr>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                </tr>
		                <tr>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                </tr>
			            </tbody>
				        </table>
				        <div class="text-right" >
				        	<span style="color:#DB631F;font-size:15px"><i class="fa fa-circle" aria-hidden="true"></i></span>
				        	<span style="color:#5a5a5a;font-size:10px">현재날짜</span>&nbsp;
				      		<span style="color:#FAD79B;font-size:15px"><i class="fa fa-stop" aria-hidden="true"></i></span>
				      		<span style="color:#5a5a5a;font-size:10px">예약가능</span>
				        </div>
				      </div><!-- 캘린더 부분 -->
				      
				      <%--============================================================================= --%>
				      
				      <div class="wrap-header d-flex align-items-center img" style="background:#FAEBCD">
						     <p id="reset" style="display: hidden">Today</p>
						     
						     <div class="accordion" id="accordionPanelsStayOpenExample"><!-- accordion 시작 -->
								 <div class="accordion-item"> <!-- accordion-item1  -->
								    <h5 class="accordion-header" id="panelsStayOpen-headingOne" style="width:238px">
								      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded=true aria-controls="collapseOne">
								        <span class="acbtnName">날짜</span>
								      </button>
								    </h5>
								    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
								      <div class="accordion-body accordion-date">
								        <div class="part1 text-center">날짜를 선택해주세요.</div>
								      </div>
								    </div>
								  </div>										<!-- accordion-item1  -->
								 
								 <div class="accordion-item"><!-- accordion-item2  -->
								    <h5 class="accordion-header" id="headingTwo">
								      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
								        <span class="acbtnName">시간선택</span>
								      </button>
								    </h5>
								    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
								      <div class="accordion-body" id="accordion-time">
											
											<div id="episodeList">
												<!-- episode Box -->
										        <div  id="ep_template">
										        	<table>
										        		<tr>
										        			<td colspan="6" class="text-left epdate">오전 00:00 ~ 오전 00:30</td>
										        		</tr>
										        		<tr>
										        			<td colspan="4" class="text-left"><span class="eprice">0원</span></td>
										        			<td colspan="2" class="text-right"><span class="nowcnt">0</span>/<span class="maxcnt">0</span></td>
										        		</tr>
										        	</table>
										        </div>
										       <!-- episode Box -->
									       </div>
									       
								      </div>
								    </div> 
								</div>											<!-- accordion-item2  -->
								
								<div class="accordion-item"><!-- accordion-item3  -->
								    <h5 class="accordion-header" id="headingThree">
								      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
								       <span class="acbtnName">인원선택</span>
								      </button>
								    </h5>
								    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
								      <div class="accordion-body accordion-cnt" style="height: 60px">
								      	<div class="text-right" >
								      		<button type="button" class="btn btn-default minBtn rcntBtn" style="margin: 0px">-</button>
								      		<input type="text" id="sample_cnt" name="sample_cnt" value="0" readonly="readonly" />
											<button type="button" class="btn btn-default plusBtn rcntBtn" style="margin: 0px">+</button>
								     	</div>
								      </div>
								    </div>
								 </div><!-- accordion-item3  -->
								 
								 <div class="accordion-item"><!-- accordion-item4  -->
								 	<div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
								    	<div class="accordion-body accordion-cnt" style="background-color: #FFE4B5;">
								      		<div class="text-right">
								      			<div id="reservtitle" style="font-size: 10px;color:#FF9364">제목</div>
								      			<div id="reservtime" style="font-size: 10px;color:#A4814;font-weight: bold">날짜, 시간</div>
								      			<div id="reservInfo" style="font-size: 14px;color:#5a5a5a;font-weight: bold">인원, 금액</div>
								      		</div>
								      		<br>
								      		<button class="btn btn-lg btn-block payBtn" style="height: 40px;margin-top:0px">결제하기</button>
								 		</div>
								 	</div>
								 </div><!-- accordion-item4  -->
											
								
							</div><!-- 전체 accordionPanelsStayOpenExample 종료 -->
				      </div> <!-- wrap-header d-flex align-items-center img -->
					</div>
					</div>

							 </div>
							 <!-- reserve modal end --> 
							 
	                         </div>
                         </div>
                   </form>
         		</div>
			</div>
</div>

