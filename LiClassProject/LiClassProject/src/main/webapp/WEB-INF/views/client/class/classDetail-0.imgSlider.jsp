<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(function(){
		
		//클래스 카테고리
		if("${1 eq classDetail.c_category}"){
			$("#category").html("<i class='fa-solid fa-hashtag'></i> 공예");
		}else if("${2 eq classDetail.c_category}"){
			$("#category").html("<i class='fa-solid fa-hashtag'></i> 요리");
		}else if("${3 eq classDetail.c_category}"){
			$("#category").html("<i class='fa-solid fa-hashtag'></i> 미술");
		}else if("${4 eq classDetail.c_category}"){
			$("#category").html("<i class='fa-solid fa-hashtag'></i> 플라워");
		}else if("${5 eq classDetail.c_category}"){
			$("#category").html("<i class='fa-solid fa-hashtag'></i> 뷰티");
		}else if("${6 eq classDetail.c_category}"){
			$("#category").html("<i class='fa-solid fa-hashtag'></i> 체험 및 기타");
		}
		
		//클래스 이미지 사진
		var img1 = '/uploadLiClass/class/'+$('.class-img:eq(0)').val();
		var img2 = '/uploadLiClass/class/'+$('.class-img:eq(1)').val();
		var img3 = '/uploadLiClass/class/'+$('.class-img:eq(2)').val();
		console.log("img : "+ img1);
		console.log("img : "+ img2);
		console.log("img : "+ img3);
	    /* find('.img-item:eq(1)').attr('src','/uploadLiClass/class/'+img1); */
	    $("#img1").attr("src",img1);
	    $("#img2").attr("src",img2);
	    $("#img3").attr("src",img3);
	});
</script>
    <c:choose>
   		<c:when test="${ not empty clientClassDetailList }">
   			<c:forEach var="classDetail"  items="${clientClassDetailList}"  varStatus="status">
   				<input type="hidden" class="class-img" value = "${classDetail.c_img_file}" />
   			</c:forEach>
   		</c:when>
   	</c:choose>
   	
	<div class="class-content" data-num="${clientClassDetail.c_no}">
      <h6 id="category"><i class="fa-solid fa-hashtag"></i></h6>
      <h6><i class="fa-solid fa-map-location-dot" style = "color: cadetblue;"></i> ${clientClassDetail.c_area}</h6>
      <h3>${clientClassDetail.c_title}</h3>
	</div>

	<div id="classImgs" class="carousel slide" data-ride="carousel" style="width: 900px; margin: 30px;"> 
	    <!-- Wrapper for slides -->
	    <div class="carousel-inner" role="listbox">
	      <div class="item active"> 
	      	<img class="img-item" id="img1" style="width: 900px;height: 500px;">
	      </div>
	      <div class="item">
	       <img class="img-item" id="img2" style="width: 900px;height: 500px;">
	      </div>
	      <div class="item">
	       <img class="img-item"  id="img3" style="width: 900px;height: 500px;"> 
	      </div>
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