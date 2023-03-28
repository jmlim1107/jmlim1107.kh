<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="/WEB-INF/views/client/studiocommon/common.jspf" %>
		
		<script type="text/javascript">
		
		$(function(){
			
			
			
			/* 목록 버튼 클릭 시 처리 이벤트 */
			$("#boardListBtn").click(function(){
				location.href="/client/studio/studioList"; 
			});
			
		});
	
	</script>
		
		
		
	</head>
	<body>


	<!-- Main -->
		<div id="main">
			<div class="inner">
						
				<form name="f_data" id="f_data" method="post">
					<input type="hidden" name="s_no" value="${detail.s_no}"/>
					<input type="hidden" name="s_file" value="${detail.s_file}"/>
					<input type="hidden" name="s_thumb" value="${detail.s_thumb}"/>
				</form> 
			
				<%-- ========= 버튼 추가 시작 ====== --%>
				<div id="boardPwdBut" class="row text-center" style="float:right">
					
						<input type="button" value="목록" id="boardListBtn" class="button primary small" />
				
				</div> 
				<%--========= 버튼 추가 종료 ========= --%>
				<br/>
				<br/>

				<%-- =============== 상세 정보 보여주기 시작 ============ --%>
							
					<h1>${detail.s_title}</h1>
							
					<h2>센터명 : ${detail.ct_name}</h2>
					<span style="float:right">작성일 : ${detail.s_date}</span>
					<br/>
					<br/>
					
					<span class="image main">
						<c:if test="${not empty detail.s_file}">
							<tr>
								<td class="col-md-1"></td>
								<td colspan="3" class="col-md-8 text-left">
								<img src="/uploadStorage/studio/${detail.s_file}" style="width: 70%; height: auto;"/></td>
							</tr>
						</c:if>
					</span>
					<div style="white-space:pre-wrap;">${detail.s_content}</div>
							
			</div>
		</div>
					<%-- =============== 상세 정보 보여주기 종료 ============ --%>
					
	
	<!-- Scripts -->
			<!-- <script src="/resources/include/dist/studio/assets/js/jquery.min.js"></script> -->
			<script src="/resources/include/dist/studio/assets/js/browser.min.js"></script>
			<script src="/resources/include/dist/studio/assets/js/breakpoints.min.js"></script>
			<script src="/resources/include/dist/studio/assets/js/util.js"></script>
			<script src="/resources/include/dist/studio/assets/js/main.js"></script>
	</body>
</html>