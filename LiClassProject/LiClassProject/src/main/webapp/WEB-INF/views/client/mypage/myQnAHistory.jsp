<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 마이페이지 - 5. 나의 문의내역 -->	
<link rel="stylesheet" href="/resources/client/mypage/assets/css/myQna.css" />
<script>
	$(function(){
		
		//은아)문의글 제목 클릭 시 상세내용
		$(".qna_title").click(function(){
			let contentTr = $(this).parent("tr").next(".qna_content");
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
		<div class="container">
 			<div class="mail-box">
                  <aside class="lg-side">
                      <div class="inbox-head">
                          <h4>나의 문의</h4>
                      </div>
                      <div class="inbox-body">
                          <table class="table table-inbox table-hover">
                            <tbody>
                            	<c:choose>
				              		 <c:when test="${ not empty myQnaList }">
		                              <c:forEach var="qnaVO" items="${myQnaList}">
			                              <tr class="unread">
			                                  <td class="view-message  inbox-small-cells"><i class="fa-solid fa-q"></i></td>
			                                  <td class="inbox-small-cells" >
			                                 <c:if test="${qnaVO.qna_status == 0 }">
				                                  <span class="label label-notyet">답변대기</span>
			                                  </c:if>
			                                   <c:if test="${qnaVO.qna_status == 1 }">
				                                  <span class="label label-finish">답변완료</span>
			                                  </c:if>
			                                  </td>
			                                  <td class="view-message qna_title">${qnaVO.qna_title}</td>
			                                  <td class="view-message  inbox-small-cells"></td>
			                                  <td class="view-message  text-right">${qnaVO.qna_date}</td>
			                              </tr>
			                               <tr class="unread qna_content" style="display:none;">
			                                  <td colspan="4" class ="view-message  inbox-small-cells" style="background-color: #fdfdfdba;">
			                                  	${qnaVO.qna_content}
			                                  </td>
			                                  <td class ="view-message  inbox-small-cells" style="background-color: #fdfdfdba;">
			                                  	<!--은아) 추후 문의게시판 해당글 상세페이지로 이동예정  -->
			                                  	<button type="button" class="btn" style="margin: 0px auto;">수정/삭제</button>
			                                  </td>
			                              </tr>
		                              </c:forEach>
					                </c:when>
					             	<c:otherwise>
							         <div class="services-content" style="margin:20px 40px;">
								          <h5> <i class="fa-solid fa-magnifying-glass"></i>  문의 내역이 없습니다.</h5>
								     </div>
					              	</c:otherwise>
					           </c:choose>
	                         </tbody>
                          </table>
                      </div>
                  </aside>
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