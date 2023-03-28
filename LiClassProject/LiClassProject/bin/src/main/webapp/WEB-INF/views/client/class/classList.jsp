<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <script>
    	$(function(){
    		$(".classDetail").click(function(){
    			let c_no = $(this).data('num');
    			location.href="/class/classDetail?c_no="+c_no;
    		});
    	});
    </script>
    
		  <div class="container-fluid">
		    <div class="row">
    			<c:forEach var="classVO" items="${classList}">
				      <div class="col-sm-6 portfolio-item" data-num="${classVO.c_no }"> 
				      	<a class="portfolio-link classDetail" style="cursor: pointer;">
					        <div class="caption">
					          <div class="caption-content">
					            <h3>${classVO.c_title}</h3>
					            <h4><i class="fa-solid fa-location-dot"></i>${classVO.c_area}</h4>
					            <h4>#${classVO.c_category}</h4>
					            <h5><i class="fa-solid fa-heart"></i>  ${classVO.c_luv}</h5>
					          </div>
					        </div>
					        <img src="/uploadStorage/class/${classVO.c_img_file}" class="img-responsive" alt="class-img"> 
				        </a> 
			         </div>
				</c:forEach>
	         </div>
		  </div>
    
    
    
	
	