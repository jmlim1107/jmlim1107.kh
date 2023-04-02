<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/client/review/review.jspf" %>
    
<script type="text/javascript">
	$(function(){
	// 글쓰기모달창 -> 저장버튼 클릭 시
	$("#reviewInsertBtn").click(function(e){
		
		 // 입력값 체크
		 if(!$('input[name=review_rating]').is(":checked")){
			 alert("별점을 남겨주세요!");
			 e.preventDefault();
		 } 
		 else if (!chkData("#review_title2","제목을")){ 
			 e.preventDefault(); 
			 return;
		 }	
		 else if (!chkData("#contentTextarea2","내용을")){ 
			 e.preventDefault(); 
			 return;
		 }	
		 else if (!$('input[name=agreements_reviews_termsAndConditions]').is(":checked")){
			 e.preventDefault(); 
			 alert("약관동의는 필수사항입니다.");
		 } 
		 else{
			 console.log("입력 성공");
		 	// reviewInsert 로 보내주기
		 	console.log($(e).parents("td").attr("data-cno"));
			$("#r_writeForm").attr({
				"method" : "post",
				"action" : "/reviewInsert"
			});
			 $("r_writeForm").submit();
		 }
	});
});
</script>
<%-- ************************** r_writeForm start *************************************  --%>
	<form id = "hiddenWrite">
		<div>
			<input type = "hidden" value = "" id= "c_no">
		</div>
	</form>
	
	
	<form id = "r_writeForm">
		<input type = "hidden" id= "c_no2">
		<input type="hidden" name="cno" value="">
		<input type="hidden" name="rno" value="">
		<input type="hidden" name="userno" value="">

			<div class="modal" id = "writeModal">
			  	<div class="modal_content" id = "writeContent">
			  	
			  		<!-- side bar start -->
				  	<div id = "modal_side"  style="background-color: #333" >
				  		<button type="button" id = "modal_close" name="Cancel" class="bv-mbox-close bv-focusable" tabindex="0" aria-labelledby="bv-mbox-close-label bv-mbox-breadcrumb-item"> 
				  			<span aria-hidden="true" class="custom-cursor-on-hover">x</span><!-- 수정 : x 아이콘으로 대체 --> 
				 		</button>
				 		<div class="bv-mbox-sidebar bv-sidebar-enabled custom-cursor-default-hover" >
				 			<div class="bv-submission-sidebar bv-submission-side">
			 					<div class="bv-subject-info-section">  
			 						<div class="bv-subject-info custom-cursor-default-hover">
				 						<img class="bv-subject-image custom-cursor-default-hover" src="https://unicorn.lush.com/media/thumbnails/products/honey_i_washed_my_hair_shampoo_bar_2020_163b7de1_thumbnail_256.png">   
				 						<span class="bv-subject-name-header">클래스명</span>
			 		 				</div>   
			 					</div> 
							</div>
						</div>
				  	</div>
				  	<!-- side bar end -->
				  	
				  	
				  	<!-- main start -->
				  	<div class = "modal_main" style="background-color: white;">
				  		<div>
				  			<h2 class="bv-mbox-breadcrumb custom-cursor-default-hover"> 
				  			<span data-bv-mbox-layer-index="0" class="bv-mbox-breadcrumb-item custom-cursor-default-hover" id="bv-mbox-breadcrumb-item">
				  			<span class="custom-cursor-default-hover blocktitle">My Review</span></span></h2>
				  			<p class="bv-required-fields-text custom-cursor-default-hover blocktitle">* 는 필수 사항입니다.</p>
				  			
				  			<!-- 별점 -->
				  			<fieldset class="bv-fieldset bv-fieldset-rating bv-radio-field bv-fieldset-active custom-cursor-default-hover">
				  				<legend class="bv-off-screen" style="width: 550px;"><span class = "blocktitle">Star Rating* </span> 
									<div class = "blockcontent" >
										<span class = "rating">
											  <input id="rating-5" type="radio" name="review_rating" value="5" /><label for="rating-5"><i class="fas fa-2x fa-star"></i></label>
											  <input id="rating-4" type="radio" name="review_rating" value="4"/><label for="rating-4"><i class="fas fa-2x fa-star"></i></label>
											  <input id="rating-3" type="radio" name="review_rating" value="3" /><label for="rating-3"><i class="fas fa-2x fa-star"></i></label>
											  <input id="rating-2" type="radio" name="review_rating" value="2" /><label for="rating-2"><i class="fas fa-2x fa-star"></i></label>
											  <input id="rating-1" type="radio" name="review_rating" value="1" /><label for="rating-1"><i class="fas fa-2x fa-star"></i></label>
										</span>
									</div>
								</legend>
							</fieldset>
								
							<!-- 리뷰 제목 -->
							<fieldset class="bv-fieldset bv-fieldset-title bv-text-field bv-nocount custom-cursor-default-hover"> 
								<legend>
									<span class="bv-fieldset-label-text custom-cursor-default-hover blocktitle"> Review Title* </span>  
									<div class = "blockcontent">
										<input id="review_title2" name = "review_title" class="bv-text bv-focusable custom-cursor-default-hover" type="text" maxlength="50" placeholder="Maximum of 50 characters." aria-describedby="title_validation" aria-required="true" tabindex="0" value="">
									</div>
								</legend>
							</fieldset>
							
							<!-- 리뷰 내용 -->
							<fieldset>
								<legend>
									<span class = "bv-off-screen blocktitle">Review Content* </span>
									<textarea id= "contentTextarea2" name = "review_content" aria-describedby="bv-review-guidelines-label" class="bv-text bv-focusable custom-cursor-default-hover blockcontent" name="review_content" maxlength="10000" placeholder="Example: I bought this a month ago and am so happy that I did..." cols=30 style= "overflow:visible"></textarea> 
									<div class = "blockcontent text-left">
	               						<input type = "file" name = "file" id = "file" />
	               					</div>
								</legend>
				  			</fieldset>
				  			
				  			<!-- 친구한테 추천할거니? -->
				  			<fieldset class="bv-fieldset bv-fieldset-isrecommended bv-radio-field bv-nocount custom-cursor-default-hover bv-valid">
				  				<legend class="bv-off-screen"><span class = "blocktitle">클래스를 다른 사람들에게 추천하나요?</span>
										<div class = "blockcontent">
											<input id="toggle-on" class="toggle toggle-left" name="review_recommend" value="Yes" type="radio" checked="checked">
											<label for="toggle-on" class="btn">Yes</label>
											<input id="toggle-off" class="toggle toggle-right" name="review_recommend" value="No" type="radio">
											<label for="toggle-off" class="btn">No</label>
										</div>
				  				</legend>
				  			</fieldset>	
				  			
				  			<!-- 약관 동의 -->
				  			<fieldset class="bv-fieldset bv-fieldset-agreements bv-fieldset-reviews-termsAndConditions bv-checkbox-field custom-cursor-default-hover"> 
				  				<legend class="bv-off-screen" style = "border: 1px solid white;">
				  						<input id="bv-checkbox-reviews-termsAndConditions" name="agreements_reviews_termsAndConditions" class="bv-checkbox bv-focusable " aria-describedby="termsAndConditions_validation" type="checkbox" value="true" aria-required="true" aria-checked="false" tabindex="0">  
				  						<label class="bv-fieldset-label-checkbox" for="bv-checkbox-reviews-termsAndConditions"> 
				  							<span class="bv-fieldset-label-text">I agree to the <a href="#" class="bv-text-link bv-focusable custom-cursor-on-hover" tabindex="0">terms &amp; conditions</a></span> 
				  						</label> 
				  				</legend> 
				  			</fieldset>
				  			
				  			<div>
				  				<button aria-label="Post Review"  class="btn-dark" name="bv-submit-button" id = "reviewInsertBtn">Post Review</button>
				  			</div>
				  		</div>
				  	</div>
				  	<!-- main end -->
			  	</div>
			</div>
	</form>

<%-- ************************** r_writeForm end *************************************  --%>

