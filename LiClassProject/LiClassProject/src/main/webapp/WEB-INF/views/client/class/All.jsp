<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>

</style>
<script>
</script>
	
	<!--클래스 리스트 시작-->
   	<div class="col mb-5" style="height: 380px;">
   		<div class="card h-100"> 
			<!-- 클래스 이미지 -->
	        <div >
	         		<c:if test="${not empty classes.c_img_file}">
	         			<img class="card-img-top" src="/uploadLiClass/class/${classes.c_img_file}" style="width: 100%; height: 219px;"/>
	         		</c:if>
	         		<c:if test="${empty classes.c_img_file}">
	         			<img src="/resources/images/notfound.png" style="width: 250px; height: 200px;">
	         		</c:if>
	        </div> 
            <!-- 클래스 정보 -->
            <div class="card-body p-4">
            	<div class="text-center">
                  <!-- 클래스 명 -->
                  <h5 class="fw-bolder goClassDetail" data-num="${classes.c_no}">${classes.c_title}</h5>
                  <!-- Product reviews-->
                  <div class="d-flex justify-content-center small text-warning mb-2">
                      <span class="bi-star-fill"></span>
                      <span class="bi-star-fill"></span>
                      <span class="bi-star-fill"></span>
                      <span class="bi-star-fill"></span>
                      <span class="bi-star-fill"></span>
                      
                  </div>
                  <div class = "classContent">${classes.c_content}</div>
              	</div>
           </div>
           <!-- 찜하기 하트 -->
              <div class="card-footer p-4 pt-0 border-top-0 bg-transparent right_area text-center heart" data-num="${classes.c_no}">
				 <a href="javascript:;" class="icon heart atag-heart" data-num="${classes.c_no}">
   					<img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기" style="width: 30px; height: 30px;">
  				 </a>
			 </div>         
   		</div>
	</div>
 		