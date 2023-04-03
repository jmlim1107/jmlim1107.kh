<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 은아) 마이페이지 5. 나의 문의내역 --%>	
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
	
		//은아)페이지네이션 번호 클릭 시
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
	   <div class="row" >
	      <div class="left-text">
	         <h4>나의 문의</h4>
		         <div id="qnaList" class="table-height">
		            <form id="qnaListForm">
		               <input type="hidden" name="user_no" value='${loginUser.user_no }'>
		               <table class="table table-hover"  style="width: 110%;max-width: 110%;">
		                  <thead>
		                     <tr>
		                        <th class="order text-center col-md-3">제목</th>
		                        <th class="text-center col-md-2">문의일자</th>
		                        <th class="text-center col-md-1">답변상태</th>
		                     </tr>
		                  </thead>
		                    <tbody class="table-striped">
			                  <c:choose>
			                     <c:when test="${ not empty myQnaList }">
			                        <c:forEach var="qnaVO" items="${myQnaList}" >
			                           <tr class="text-center qna-tr" data-num="${qnaVO.qna_no}">
			                              <td style="text-align:left;padding-left:15px; cursor: pointer;" class="qna_title">
			                                 <span style="padding-left:30px;">${qnaVO.qna_title}</span>
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
			                           		</td>
			                           		<td>
			                                	<button type="button" style="margin: 0px auto;" onclick="location.href='client/qnaboard/qnaBoardDetail?qna_no=${qnaVO.qna_no}'">
			                                		<i class="fa-regular fa-pen-to-square"></i>수정/삭제
			                                	</button>
			                                </td>
			                           </tr>
			                        </c:forEach>
			                     </c:when>
			                     <c:otherwise>
			                        <tr>
			                           <td colspan="6" class="tac text-center"><i class="fa-solid fa-circle-question"></i>  문의내역이 존재하지 않습니다.</td>
			                        </tr>
			                     </c:otherwise>
			                  </c:choose>
		                  </tbody>
		               </table>
		            </form>
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
	   </div>
	</div>
</div>