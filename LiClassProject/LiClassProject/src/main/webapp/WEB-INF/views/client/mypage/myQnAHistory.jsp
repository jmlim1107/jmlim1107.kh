<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 마이페이지 - 5. 나의 문의내역 -->	
<link rel="stylesheet" href="/resources/client/mypage/assets/css/myQna.css" />
<script>
	$(function(){
		
		//은아)문의글 제목 클릭 시 상세내용
		$(".qna_title").click(function(){
			let contentTr = $(this).parent(".qna-tr").next(".qna-tr");
			let css = contentTr.css("display");
			if(css == 'none'){
				contentTr.css("display","table-row");
			}else{
				contentTr.css("display","none");
			} 
		});
		
		//은아)페이지 번호 클릭 시
		$(".paginate_button2").click(function(){
			
			//현재페이지 localStorage에 activePosition저장
			var activePosition = 4;
			localStorage.setItem("activePosition",activePosition);
			console.log("set activePosition : "+activePosition);
			
			var pageNum = $(this).data("num");
			console.log("이동할 페이지 : "+pageNum);
			$("#select-page").val(pageNum); 
		 	
			$("#page-form").attr({
				"method":"get",
				"action":"/mypage"
			});
			$("#page-form").submit(); 
			
      	});
	});
	
</script>	
	
    <div id="portfolio2">
<div class="thumb">
   <div class="row" ><!-- 은아)0330 수정 style="height: 632px;" -->
      <div class="left-text">
         <h4>나의 문의</h4>
        	 <%-- ==================== 리스트 시작 ==================== --%>
         <div id="paymentList" class="table-height">
            <form id="dataForm">
               <input type="hidden" name="user_no" value='${loginUser.user_no }'>
                 
               <table summary="결제내역 리스트" class="table table-hover">
                  <thead>
                     <tr>
                        <th data-value="b_num" class="order text-center col-md-3">제목</th>
                        <th class="text-center col-md-2">문의일자</th>
                        <th class="text-center col-md-1">답변상태</th>
                     </tr>
                  </thead>
                    <tbody id="paymentList" class="table-striped">
                    <!-- 데이터 출력 --><!--   -->
                  <c:choose>
                     <c:when test="${ not empty myQnaList }">
                        <c:forEach var="qnaVO" items="${myQnaList }" >
                           <tr class="text-center qna-tr" data-num="${ qnaVO.qna_no }">
                              <td style="text-align:left;padding-left:15px; cursor: pointer;" class="qna_title">
                                 <span style="padding-left:30px; " >${qnaVO.qna_title}</span>
                              </td>                     
                              <td class="name">${qnaVO.qna_date}</td>
	                              <c:choose>
	                                 <c:when test="${qnaVO.qna_status == 0 }">
	                                    <td>답변대기</td>
	                                 </c:when>
	                                 <c:when test="${qnaVO.qna_status == 1 }">
	                                    <td>답변완료</td>
	                                 </c:when>
	                              </c:choose>                       
                           </tr>
                           <tr style="text-align: center; display: none;" class="qna-tr">
                           		<td colspan="2">
	                               <span style="padding-left:30px;" class="qna_content">${qnaVO.qna_content}</span>
	                               <!--은아) 추후 문의게시판 해당글 상세페이지로 이동예정  -->
                           		</td>
                           		<td>
                                	<button type="button" style="margin: 0px auto;">
                                		<i class="fa-regular fa-pen-to-square"></i>수정/삭제
                                	</button>
                                </td>
                           </tr>
                        </c:forEach>
                     </c:when>
                     <c:otherwise>
                        <tr>
                           <td colspan="6" class="tac text-center">문의내역이 존재하지 않습니다.</td>
                        </tr>
                     </c:otherwise>
                  </c:choose>
                  </tbody>
               </table>
            </form>
         </div>
         <%-- ==================== 리스트 종료 ==================== --%>
      </div>
   </div>
</div>
              
              <!--은아)나의 문의내역 페이징 처리  -->
              <!-- myqna pagination start  -->
              	<div class="pagination">
					<c:if test="${qnaPageMaker.prev}">
					  <a href="${qnaPageMaker.startPage - 1}">&laquo;</a>
					</c:if>
					<c:forEach var="num" begin="${qnaPageMaker.startPage}" end="${qnaPageMaker.endPage}">
					  <a class="paginate_button2 ${qnaPageMaker.cvo.pageNum == num ? 'active':''} "  data-num="${num}" >${num}</a>
					</c:forEach>
					<c:if test="${qnaPageMaker.next}">
					  <a href="${qnaPageMaker.endPage + 1 }">&raquo;</a>
				  </c:if>
				</div>
              
              <form id="page-form">
              	<input type="hidden" id="select-page" name="pageNum" value="">
              	<input type="hidden" name="amount" value="${qnaPageMaker.cvo.amount }">
              </form>
              <!-- myqna pagination end  -->
			</div>