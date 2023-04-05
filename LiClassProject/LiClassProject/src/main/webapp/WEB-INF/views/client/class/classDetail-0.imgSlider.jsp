<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
<%-- 은아) 클래스 상세페이지 0. 상단 이미지 슬라이더 --%>	

	$(function(){
		//클래스 전체이미지
		var length = $(".class-img").length;
		console.log("length : "+length);
		var firstSrc = $(".class-img:eq(0)").val();
		console.log(firstSrc);
		
		appendDiv = $('<div>', { 
            'class' : "item active",
      	 });                        
		$(appendDiv).appendTo('.carousel-inner');
		
		appendImg = $('<img>', { 
            'class' : "img-item",
            'src' : firstSrc,
            'style' :'width:1000px;height:500px;max-width:1500px;'
         });                        
		$(appendImg).appendTo('.item');
		
		for(i=1;i<length;i++){
				appendDiv = $('<div>', { 
		            'class' : "item",
		      	 });                        
				$(appendDiv).appendTo('.carousel-inner');
				
				appendImg = $('<img>', { 
		            'class' : "img-item",
		            'src' :  $('.class-img:eq('+i+')').val(),
		            'style' :'width:1200px;height:500px;max-width:1500px;'
		         });                        
				$(appendImg).appendTo('.item');
			}
		});
</script>

	<c:choose>
		<c:when test="${ not empty imgList }">
			<c:forEach var="classImg"  items="${imgList}"  varStatus="status">
				<input type="hidden" class="class-img" value = "/uploadLiClass/class/${classImg.c_img_file}" />
			</c:forEach>
		</c:when>
	</c:choose>
   	
	<div class="class-content" data-num="${clientClassDetail.c_no}">
      <h6 id="category"><i class="fa-solid fa-hashtag"></i>
      	<c:if test = "${clientClassDetail.c_category eq 0}">
			공예
		</c:if>
     	<c:if test = "${clientClassDetail.c_category eq 1}">
			요리
		</c:if>
		<c:if test = "${clientClassDetail.c_category eq 2}">
			미술
		</c:if>
		<c:if test = "${clientClassDetail.c_category eq 3}">
			플라워
		</c:if>
		<c:if test = "${clientClassDetail.c_category eq 4}">
			뷰티
		</c:if>
		<c:if test = "${clientClassDetail.c_category eq 5}">
			체험 및 기타
		</c:if>
      </h6>
      <h6><i class="fa-solid fa-map-location-dot" style = "color: cadetblue;"></i> ${clientClassDetail.c_area}</h6>
      <h3 style="font-weight: bold;">${clientClassDetail.c_title}</h3>
	</div>

    
   <div id="classImgs" class="carousel slide" data-ride="carousel" style="width: 98%; margin: 30px;"> 
	    <!-- Wrapper for slides-->
	    <div class="carousel-inner" role="listbox">
	    </div>
	    <!-- Controls -->
	    <a class="left carousel-control" href="#classImgs" role="button" data-slide="prev"> 
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> 
		    <span class="sr-only">Previous</span>
	    </a> 
	    <a class="right carousel-control" href="#classImgs" role="button" data-slide="next"> 
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> 
		    <span class="sr-only">Next</span>
	    </a>
    </div>
    
    