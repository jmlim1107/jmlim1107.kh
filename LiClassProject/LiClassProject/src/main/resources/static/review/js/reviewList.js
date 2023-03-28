$(function(){ 
	   	
	   
	 	 /****************************************
	 	 * 후기 등록 
	 	 *****************************************/
	 	 
	 	// 글쓰기 버튼 클릭시
		$("#insertFormBtn").click(function(){
   			$("#test1").fadeIn();
  		});
  
		// 글쓰기 닫기 버튼 클릭시
  		$("#modal_close").click(function(){
    		$("#test1").fadeOut();
  		});
	  	
	  	
		 /****************************************
	 	 * 후기 상세보기
	 	 *****************************************/
	 	 // 상세보기 버튼 클릭 시
	  	$(".test3").click(function(e){
			let review_no =  $(this).parents("div").attr("data-num");	
			
			// 원하는 요소에 값 집어넣기
			$("#review_no").val(review_no);
			// updateForm 에 보내주기 위한 글번호
			$("#review_number").val(review_no);
			console.log("글번호 : "+review_no); 
			
			// 상세페이지 이동
			$.ajax({
				type : "post",
				url : "/review/reviewDetail",
				/*data : JSON.stringify({ "review_no" : $("#review_no").val() }),*/
				data : "review_no="+$("#review_no").val(),
				/*,contentType : "application/json",*/
				dataType : "json",
				success : function(data){
					//alert(data.review_content);
					// json 값을 모달에 설정
					$("#r_detailContent").val(data.review_content);
					$("#r_detailTitle").val(data.review_title);
					$('input[name="review_rating"]').val([data.review_rating]);
					$('input[name="review_recommend"]').val([data.review_recommend]);
			
					// 모달창 띄우기
					$("#test3").fadeIn();
				},
				error : function(data){
					alert("실패");
				
					return false;
				}
				
			});
			
		  });
		 
	 	// 상세페이지 모달창 닫기
		$("#detailmodal_close").click(function(){
			console.log("버튼눌림");
			$("#test3").fadeOut();
		});
	 	
	 	 
	 	/****************************************
	 	 * 후기 수정하기
	 	 *****************************************/
	  	// 글수정 버튼 클릭시	
	  	/* 디테일 버튼 클릭시  페이지 이동을 위한 처리 이벤트 */		
		$("#updateFormBtn2").click(function(){
			//let review_no =  $(this).parent("#tttest").data("num");	
			//$("#review_no").val(review_no);
			console.log("글번호 : "+$("#review_number").val()); 
			
			
			$.ajax({
				type : "post",
				url : "/review/r_updateForm",
				/*data : JSON.stringify({ "review_no" : $("#review_no").val() }),*/
				data : "review_no="+$("#review_number").val(),
				/*,contentType : "application/json",*/
				dataType : "json",
				success : function(data){
					//alert(data.review_content);
					// json 값을 모달에 설정
					$("#updateContent").val(data.review_content);
					$("#updateTitle").val(data.review_title);
					
					
					
					$("#test3").hide(); 
					$("#test2").show();
					
				},
				error : function(data){
					alert($("관리자에게 문의하세요."));
					return false;
				}
			});
			console.log('업데이트폼 성공');	
		});
	  
	  	// 업데이트 버튼 클릭 시
		$("#reviewUpdateBtn").click(function(e){
			$("#reviewupdate_no").val($("#review_number").val())
			console.log('수정폼 번호'+$("#reviewupdate_no").val());	
			
			//입력값 체크
		if (!chkData("#updateTitle","수정할 제목을"))return;
		else if (!chkData("#updateContent","수정할 내용을"))return;
		else if (!$('input[name="agreements_reviews_termsAndConditions"]').is(':checked')){
			alert("약관동의는 필수입니다.");
			return false;
		}
		else{
			$("#r_updateForm").attr({
				"method":"post",
				"action":"/review/reviewUpdate"
			});
			$("#r_updateForm").submit();
		}
		});
	  	
		// 업데이트 모달창 닫기
		$("#updatemodal_close").click(function(){
			$("#test2").fadeOut();
		});
	  	
	  	
		 /****************************************
	 	 * 후기 삭제하기
	 	 *****************************************/
	 	$("#deleteFormBtn222").click(function(){
	 		if(confirm("정말 삭제하시겠습니까?")){
				goUrl = "/review/reviewDelete";
				$("#detailForm").attr("action",goUrl);
				$("#detailForm").submit();
			}
		});
		 
	 	 /****************************************
	 	 * 검색기능
	 	 *****************************************/ 
	 		/* 입력 양식 enter 제거 */
			$("#keyword").bind("keydown", function(event){
				 if (event.keyCode == 13) {
				        event.preventDefault();
				    }
			});
	 	 
			/* 검색 대상이 변경될 때마다 처리 이벤트 */
			$("#search").change(function() {
				if($("#search").val()=="all"){
					$("#keyword").val("전체 데이터 조회합니다.");
				}else if($("#search").val()!="all"){
					$("#keyword").val("");
					$("#keyword").focus();
				}
			});
	
	 	 
			/* 검색 버튼 클릭 시 처리 이벤트 */
			$("#searchData").click(function(){
				if(!chkData("#keyword","검색어를")) return;
				goPage();
			});
		 	
			
		 
	
			
			/****************************************
		 	 * 페이징 기능 
		 	 *****************************************/ 
			$(".paginate_button a").click(function(e) {
				 e.preventDefault();
				 $("#review_search").find("input[name='pageNum']").val($(this).attr("href"));
				 goPage();
			});
		 	 
			
			
			

		
	}); // $ 함수 종료문
	
	
	/****************************************
 	 * 검색을 위한 실질적인 처리 함수
 	 *****************************************/
	function goPage(){
		if($("#search").val()=="all"){
			$("#keyword").val("");
		} 

		$("#review_search").attr({
			"method":"get",
			"action":"/review/reviewList"
		});
		$("#review_search").submit();
	}
	