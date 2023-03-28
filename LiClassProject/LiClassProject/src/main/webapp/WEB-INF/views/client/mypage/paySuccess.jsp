<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/client/client_common.jspf" %>
		<style>
			.container{display: flex;
  					   justify-content: center;
  					   align-items: center;
 				      
 				       }
			.bordercss{border:2px solid #A9A9A9;
				       border-radius:15px;
				       width:900px;
				       }
			.table{margin:10px 0;
				  }
			.midTable{margin:30px 0;
			          }
			th{width:320px;
			   font-size:30px;}
			td{font-size:20px;}
			
		</style>
		<script type="text/javascript">
			function goHome(){
				$("#goHome").click(function(){
					location.href="/";
				});
			}
		</script>
	</head>
	<body>
		<div class="all">
			<h1 style="text-align:center;font-size:50px;">결제 완료</h1><br>
			<div class="container">
				
				
				<div class="bordercss">
					<div>
						<div>
							<table class="table">
								<thead>
									<tr>
										<th>주문자 정보</th>
									</tr>
								</thead>
								
								<tbody>
									<tr>
										<td>이름</td>
										<td>${uvo.user_name }</td>
									</tr>
									<tr>
										<td>연락처</td>
										<td>${uvo.user_tel }</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>${uvo.user_email }</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div>
							<table class="table midTable">
								<thead>
									<tr>
										<th>예약 정보</th>
									</tr>
								</thead>
								
								<tbody>
									<%-- <tr>
										<td>클래스 이름</td>
										<td>${rvo.c_title }</td>
									</tr> --%>
									<tr>
										<td>예약일</td>
										<td>${rvo.r_date}</td>
									</tr>
									<tr>
										<td>예약인원</td>
										<td>${rvo.r_cnt }</td>
									</tr>	
									<tr>
										<td>클래스 가격</td>
										<td>${rvo.r_price}원</td>
									</tr>			
								</tbody>
							</table>
						</div>
						<div>
							<table class="table">
								<thead>
									<tr>
										<th>최종 결제 정보</th>
									</tr>
								</thead>
								
								<tbody>
									<tr>
										<td>상품 합계</td>
										<td>${rvo.r_price}원</td>
									</tr>
									<tr>
										<td>결제 수수료</td>
										<td>0원</td>
									</tr>
									<tr>
										<td>결제 수단</td>		
										<td>${pvo.pay_method }</td>
									</tr>		
									<tr>
										<td>최종 결제 금액</td>
										<td style="font-size:30px;text-decoration: underline;">${pvo.pay_price }원</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div style="text-align:center;">
				<button type="button" class="btn btn-default" id="goHome" onclick="goHome()">홈으로</button>
				<button type="button" class="btn btn-default" id="goClass">클래스 계속보기</button>
			</div>
		</div>
	</body>
</html>