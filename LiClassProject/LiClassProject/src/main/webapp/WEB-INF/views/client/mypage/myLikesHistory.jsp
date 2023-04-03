<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 은아) 마이페이지 4. 나의 관심클래스--%>	
<style>
	.mylikes-img{
		width:400px;
		height:250px;
	}
</style>
<script>
	$(function(){
		
		//은아)휴지통 클릭 시 관심클래스 삭제
		$(".delete-likes").click(function(){
			
			//은아)삭제 후 새로고침 하고 현재 탭메뉴로 돌아오기위해 localStorage에 activePosition 저장
			var activePosition = 3;
			localStorage.setItem("activePosition",activePosition);
			
			let c_no = $(this).parent(".portfolio-item").data("num");
			location.href="/mypage/delLikes?c_no="+c_no;
		});
		
		//은아)페이지네이션 번호 클릭 시
		$(".paginate_button1").click(function(){
			
			//현재페이지 localStorage에 activePosition저장
			var activePosition = 3;
			localStorage.setItem("activePosition",activePosition);
			console.log("set activePosition : "+activePosition);
			
			var pageNum = $(this).data("num");
			console.log("이동할 페이지 : "+pageNum);
			$("#select-page1").val(pageNum); 
		 	
			$("#page-form1").attr({
				"method":"get",
				"action":"/mypage"
			});
			$("#page-form1").submit(); 
			
      	});
	});
</script>
					<div id="portfolio2">
                       <div class="thumb">
                         <div class="row">
                           <div class="col-lg-13 align-self-center">
                             <div class="left-text">
                               <h4>나의 관심클래스</h4>
                                 <div class="container" style="width: 110%">
									<div class="row row-bottom-padded-md">
										<c:choose>
							              <c:when test="${ not empty myLikesList }">
											<c:forEach var="likedClass" items="${myLikesList}">
										      <div class="col-lg-4 col-md-4 portfolio-item" data-num="${likedClass.c_no }"> 
										      	<a class="portfolio-link" href="/class/classDetail?c_no=${likedClass.c_no }">
											        <div class="caption">
											          <div class="caption-content">
											            <h5>${likedClass.c_title}</h5>
											            <h6><i class="fa-solid fa-location-dot"></i>${likedClass.c_area}</h6>
											          </div>
											        </div>
											       	 <img src="/uploadLiClass/class/${likedClass.c_img_file}" class="img-responsive mylikes-img" alt="class-img">
										        </a>
	   									        <a class="delete-likes" style="cursor: pointer;"><i class="fa-solid fa-heart-circle-minus" style="color:#555;"></i></a>
									         </div>
											</c:forEach>
							              </c:when>
							              <c:otherwise>
										        <div class="services-content">
										          <h5> <i class="fa-solid fa-heart-circle-exclamation"></i>  관심클래스가 없습니다.</h5>
										        </div>
							              </c:otherwise>
							           </c:choose>
									
										<!--은아)나의 문의내역 페이징 처리  -->
								       	<!-- myqna pagination start  -->
								       	<div class="pagination">
											<c:if test="${likesPageMaker.prev}">
											<a href="${likesPageMaker.startPage - 1}">&laquo;</a>
											</c:if>
											<c:forEach var="num" begin="${likesPageMaker.startPage}" end="${likesPageMaker.endPage}">
											<a class="paginate_button1 ${likesPageMaker.cvo.pageNum == num ? 'active':''} "  data-num="${num}" >${num}</a>
											</c:forEach>
											<c:if test="${likesPageMaker.next}">
											<a href="${likesPageMaker.endPage + 1 }">&raquo;</a>
											</c:if>
										</div>
									          
							          <form id="page-form1">
							          	<input type="hidden" id="select-page1" name="pageNum" value="">
							          	<input type="hidden" name="amount" value="${likesPageMaker.cvo.amount }">
								       </form>
								      <!-- myqna pagination end  -->
							      </div>
								</div>
                             </div>
                           </div>
                         </div>
                       </div>
                     </div>