<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;500&family=Racing+Sans+One&family=Shrikhand&display=swap" rel="stylesheet">

<style>
	.bi-star-fill{
	margin : -40px 6px 0 0;
	}
</style>
<script>
</script>
	
	<!--클래스 리스트 시작-->
   	<div class="col mb-5" style="height: 380px;">
   		<div class="card h-100"> 
			<!-- 클래스 이미지 -->
	        <div >
	         		<c:if test="${not empty classes.c_img_file}">
	         			<div style="position: absolute; width: -webkit-fill-available;" class="card-footer p-4 pt-0 border-top-0 bg-transparent right_area text-center heart" data-num="${classes.c_no}">
							 <a href="javascript:;" class="icon heart atag-heart" data-num="${classes.c_no}">
			   					<img src="/resources/images/heartwhite.png" alt="찜하기" style="width: 20px; height: 20px;  position: relative; float: right;margin-top: 10px; opacity: 0.8;">
			  				 </a>
			 			</div>     
	         			<div >
	         				<img class="card-img-top" src="/uploadLiClass/class/${classes.c_img_file}" style="width: 100%; height: 219px;"/>
	         			</div>
	         		</c:if>
	         		<c:if test="${empty classes.c_img_file}">
	         			<img src="/resources/images/notfound.png" style="width: 250px; height: 200px;">
	         		</c:if>
	        </div> 
            <!-- 클래스 정보 -->
            <div class="card-body p-4" style="margin-top: 5px;">
            	<div class="text-center">
                  <!-- 클래스 명 -->
                  <span class="fw-bolder goClassDetail" data-num="${classes.c_no}" style="font-size: 14px; font-family: 'Noto Serif KR', serif;">${classes.c_title}</span>
                 
                  <div class = "classContent" style="font-family: 'Noto Serif KR', serif;">${classes.c_content}</div>
              	</div>
              	
              	
           </div>
           <!-- Product reviews-->
                  <div class="d-flex justify-content-center small text-warning mb-2" style="font-size: initial;">
                      <span class="bi-star-fill"></span>
                      <span class="bi-star-fill"></span>
                      <span class="bi-star-fill"></span>
                      <span class="bi-star-fill"></span>
                      <span class="bi-star-fill"></span>
                      
                  </div>
           <!-- 찜하기 하트 -->
            
                  
   		</div>
	</div>
 		