<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script type="text/javascript">
	$(function(){
		//페이지 번호 클릭 시
        $(".page-link").click(function(e){
        	e.preventDefault();
        	
        	var pageNum = $(this).data("num");
            console.log("이동할 페이지 : "+pageNum);
            $("#pageNum").val(pageNum);
           
            $("#f_search").attr({
              "method":"get",
              "action":"/clientmanagement/clientList"
           });
           $("#f_search").submit(); 
           
          });
	});
</script>


<section class="section dashboard col-lg-12">
	<div class="row">
		<div class="col-lg-10">
			<div class="row">
				<div class="col-12">
					<form id="f_search" name="f_search" class="form-inline">
							<input type="hidden" name="pageNum" id="pageNum"  value="${ pageMaker.cvo.pageNum }">
							<input type="hidden" name="amount" id="amount" value="${ pageMaker.cvo.amount }">
					</form>
					<%-- ==================== 검색기능 시작 ====================
					<div id="clientListSearch" class="text-right">
						<form id="f_search" name="f_search" class="form-inline">
							<input type="hidden" name="pageNum" id="pageNum"  value="${ pageMaker.cvo.pageNum }">
							<input type="hidden" name="amount" id="amount" value="${ pageMaker.cvo.amount }">
							<div class="form-group">
								<label>검색조건</label>
								<select id="search" name="search" class="form-control">
									<option value="all">전체</option>
									<option value="user_name">제목</option>
									<option value="user_regdate">내용</option>
								</select>
								<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control" />
								<button type="button" id="searchData" class="btn btn-success">검색</button>
							</div>
						</form>
					</div> --%>
					<%-- ==================== 검색기능 종료 ==================== --%>
             
			         <%-- ==================== 리스트 시작 ==================== --%>
			         <div id="clientList" class="table-height">
			            <form id="dataForm">
			                 
			               <table summary="회원관리 리스트" class="table table-hover">
			                  <thead>
			                     <tr>
			                        <th data-value="b_num" class="order text-center col-md-3">회원번호</th>
			                        <th class="text-center col-md-2">회원이름</th>
			                        <th class="text-center col-md-2">회원연락처</th>
			                        <th class="text-center col-md-1">회원이메일</th>
			                        <th class="text-center col-md-1">회원계정상태</th>
			                     </tr>
			                  </thead>
			                    <tbody id="clientList" class="table-striped">
			                    <!-- 데이터 출력 --><!--   -->
			                  <c:choose>
			                     <c:when test="${ not empty userVO }">
			                        <c:forEach var="uvo" items="${userVO}" >
			                           <tr class="text-center" data-num="${uvo.user_no  }">
			                           	  <td>${uvo.user_no }</td>
			                              <td>${uvo.user_name }</td>                     
			                              <td>${uvo.user_tel }</td>
			                              <td>${uvo.user_email }</td>
			                              <td>${uvo.user_status }</td>
			                                                       
			                           </tr>
			                        </c:forEach>
			                     </c:when>
			                     <c:otherwise>
			                        <tr>
			                           <td colspan="6" class="tac text-center">회원내역이 존재하지 않습니다.</td>
			                        </tr>
			                     </c:otherwise>
			                  </c:choose>
			                  </tbody>
			               </table>
			            </form>
			         </div>
			         <%-- ==================== 리스트 종료 ==================== --%>
			         
			         <%-- ==================== 페이징 출력 시작 ==================== 
					<div>
						<ul class="pagination">
							<c:if test="${ pageMaker.prev }">
								<li class="page-item previous">
									<a class="page-link" href="${ pageMaker.startPage -1 }">Previous</a>
								</li>
							</c:if>
							<c:forEach var="num" begin="${ pageMaker.startPage }"
												 end="${ pageMaker.endPage }">
								<li class="page-item ${pageMaker.cvo.pageNum == num ? 'active':''}">
									<a class="page-link" href="${ num }">${ num }</a>
								</li>
							</c:forEach>
							<c:if test="${ pageMaker.next }">
								<li class="page-item next">
									<a class="page-link" href="${ pageMaker.endPage + 1 }">Next</a>
								</li>
							</c:if>
						</ul>
					</div>--%>
					<%-- ==================== 페이징 출력 종료 ==================== --%>
					
				</div>
			</div>
		</div>
	</div>
</section>