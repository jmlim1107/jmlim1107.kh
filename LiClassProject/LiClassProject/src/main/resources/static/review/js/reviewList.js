$(function(){ 
	   	
	   
	 	 /****************************************
	 	 * 후기 등록 
	 	 *****************************************/
	 	 
	 	// 글쓰기 버튼 클릭시
		$(".insertFormBtn").click(function(){
			console.log($(this).parents("td").attr("data-cno"));
			var cno = $(this).parents("td").attr("data-cno");
			var rno = $(this).parents("td").attr("data-rno");
			var userno = $(this).parents("td").attr("data-userno");
			$('input[name=cno]').attr('value',cno);
			$('input[name=rno]').attr('value',rno);
			$('input[name=userno]').attr('value',userno);
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
	  	$(".reviewDetail").click(function(e){
			// 원하는 요소에 값 집어넣기
			//$("#review_no").val(r_no);
			//$('input[name=]').val(r_no); // = review_no
			// updateForm 에 보내주기 위한 글번호
			//$("#review_number").val(review_no);
			//console.log("글번호 : "+review_no); 
			//$("#review_number").val(r_no); 
			//console.log("글번호 : "+review_no); 
			
			// 상세페이지 이동
			$.ajax({
				type : "post",
				url : "/reviewDetail",
				data : "r_no="+$(this).parents("td").attr("data-rno"),
				dataType : "json",
				success : function(data){
					//alert(data.review_content);
					// json 값을 모달에 설정
					$("#r_detailContent").val(data.review_content);
					$("#r_detailTitle").val(data.review_title);
					$('input[name="review_rating"]').val([data.review_rating]);
					$('input[name="review_recommend"]').val([data.review_recommend]);
			
					$('input[name="r_no"]').val([data.r_no]);
					$('input[name="review_no"]').val([data.review_no]);
					
					// 모달창 띄우기
					$("#test3").fadeIn();
				},
				error : function(data){
					alert("실패");
				
					return false;
				}
				
			});
			
		  });
		 
		 /*data : JSON.stringify({ "review_no" : $("#review_no").val() }),*/
		 /*,contentType : "application/json",*/
	 	// 상세페이지 모달창 닫기
		$("#detailmodal_close").click(function(){
			console.log("버튼눌림");
			$("#test3").fadeOut();
		});
	 	
	 	 
	 	/****************************************
	 	 * 후기 수정하기
	 	 * 후기 수정 폼으로 이동하기
	 	 *****************************************/
	  	// 글수정 버튼 클릭시	
	  	/* 디테일 버튼 클릭시  페이지 이동을 위한 처리 이벤트 */		
		$("#updateFormBtn2").click(function(){
			//let review_no =  $(this).parent("#tttest").data("num");	
			//$("#review_no").val(review_no);
			console.log("글번호 : "+$("#reviewupdate_no").val()); 
			
			//console.log("예약번호 : "+$(this).parent("div").data("data-rnum")); 
			console.log($("#r_number").val());
			
			$.ajax({
				type : "post",
				url : "/r_updateForm",
				data :  "r_no="+$("#r_number").val(),
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
					alert("실패");
					return false;
				}
			});
		});
	  
	  	// 업데이트 버튼 클릭 시
		$("#reviewUpdateBtn").click(function(e){
			console.log('예약번호: '+$("#r_number").val());
			console.log('리뷰번호: '+$("#reviewupdate_no").val());	
			$("#reviewupdate_no").val($("#reviewupdate_no").val());
			$("#r_number").val($("#r_number").val());
			
			
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
					"action":"/reviewUpdate"
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
				goUrl = "/reviewDelete";
				console.log("삭제버튼 눌림");
				$("#dataForm").attr("action",goUrl);
				$("#dataForm").submit();
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
			"action":"/reviewList"
		});
		$("#review_search").submit();
		}