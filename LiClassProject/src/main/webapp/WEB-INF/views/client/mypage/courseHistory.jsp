<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	.table>tbody>tr>td{padding:12px;vertical-align: middle;}
</style>  

<div class="thumb">
	<div class="row">
		<div class="left-text">
			<h4>수강내역</h4>
			<%-- ==================== 리스트 시작 ==================== --%>
			<div id="paymentList" class="table-height">
				<table summary="결제내역 리스트" class="table table-hover">
					<thead>
						<tr>
							<th data-value="b_num" class="order text-center col-md-3">클래스정보</th>
							<th class="text-center col-md-2">수강일자</th>
							<th class="text-center col-md-2">카테고리</th>
							<th class="text-center col-md-1">난이도</th>
							<th class="text-center col-md-1">지역</th>
							<th class="text-center col-md-1">후기</th>
						</tr>
					</thead>
					<tbody id="paymentList" class="table-striped">
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${ not empty pvo_courseList }">
							<c:forEach var="courseList" items="${ pvo_courseList }" >
								<tr class="text-center" data-num="${ courseList.r_no }">
									<td style="text-align:left;padding-left:15px;">
										<img src="https://item.kakaocdn.net/do/493188dee481260d5c89790036be0e66f604e7b0e6900f9ac53a43965300eb9a" style="width:60px;height:60px;object-fit:cover;" alt="..." class="img-rounded">
										<span style="padding-left:30px;">${ courseList.title }</span>
									</td>                     
									<td>${courseList.date }</td>
									<td>${ courseList.category }</td>
									<td>${ courseList.level }</td>
									<td>${ courseList.area }</td>
									<c:if test="${courseList.count<=0 }">
										<td><button type="button" class="btn-default btn-xs">리뷰등록</button></td>
									</c:if>
									<c:if test="${courseList.count>0 }">
										<td>수강 전</td>
									</c:if>  	
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6" class="tac text-center">수강내역이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
			<%-- ==================== 리스트 종료 ==================== --%>
		</div>
	</div>
</div>
