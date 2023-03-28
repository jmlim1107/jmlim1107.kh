<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<title>Insert title here</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		
		<link rel="stylesheet" href="/resources/include/dist/studio/assets/css/main.css" />
		<link rel="stylesheet" href="/resources/include/dist/studio/assets/css/noscript.css" />
		
		
		
		<script type="text/javascript">
		
		$(function(){
			

			/* 수정 버튼 클릭 시 처리 이벤트 */
			$("#updateFormBtn").click(function(){
					goUrl = "/admin/studio/updateForm";
					$("#f_data").attr("action",goUrl);
					$("#f_data").submit();
			});
			
			/* 삭제 버튼 클릭 시 처리 이벤트 */
			$("#boardDeleteBtn").click(function(){
					if(confirm("정말 삭제하시겠습니까?")){
						goUrl = "/admin/studio/studioDelete";
						$("#f_data").attr("action",goUrl);
						$("#f_data").submit();
					}
			});
			
			
			/* 글쓰기 버튼 클릭 시 처리 이벤트 */
			$("#insertFormBtn").click(function(){
				location.href = "/admin/studio/writeForm"; 
			});
			
			/* 목록 버튼 클릭 시 처리 이벤트 */
			$("#boardListBtn").click(function(){
				location.href="/admin/studio/studioList"; 
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
						
						<input type="button" value="글수정" id="updateFormBtn" class="button primary small" />&nbsp;
						<input type="button" value="글삭제" id="boardDeleteBtn" class="button primary small" />&nbsp;
						<input type="button" value="글쓰기" id="insertFormBtn" class="button primary small" />&nbsp;
						<input type="button" value="목록" id="boardListBtn" class="button primary small" />
				
				</div> 
				<%--========= 버튼 추가 종료 ========= --%>
				<br/>
				<br/>

				<%-- =============== 상세 정보 보여주기 시작 ============ --%>
							
					<h1>${detail.s_title}</h1>
							
					<h2>센터명 : ${detail.ct_name}</h2>
					<span style="float:right">작성일 : ${detail.s_date}</span>
					<span class="image main">
						<c:if test="${not empty detail.s_file}">
							<tr>
								<td class="col-md-1"></td>
								<td colspan="3" class="col-md-8 text-left">
								<img src="/uploadLiclass/studio/${detail.s_file}" /></td>
							</tr>
						</c:if>
					</span>
					<div style="white-space:pre-wrap;">${detail.s_content}</div>
							
			</div>
		</div>
					<%-- =============== 상세 정보 보여주기 종료 ============ --%>
					
	
	<!-- Scripts -->
			<script src="/resources/include/dist/studio/assets/js/jquery.min.js"></script>
			<script src="/resources/include/dist/studio/assets/js/browser.min.js"></script>
			<script src="/resources/include/dist/studio/assets/js/breakpoints.min.js"></script>
			<script src="/resources/include/dist/studio/assets/js/util.js"></script>
			<script src="/resources/include/dist/studio/assets/js/main.js"></script>
	</body>
</html>