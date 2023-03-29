
	/* 최근 본 클래스 */
	function isNull(obj){
		 if(obj == '' || obj == null || obj == undefined || obj == NaN){ 
		  return true;
		 }else{
		  return false;
		 }
	}
	
	$(function(){
		
		//localStorage.clear();
		//localStorage.removeItem("classNo");
		localStorage.removeItem("activePosition");
		console.log("localStorage - activePosition : "+localStorage.getItem("activePosition"));
		console.log("localStorage - classNo : "+localStorage.getItem("classNo"));

		/* 최근 본 클래스 */
		var index = 0;
	 	var imgArr = [];
		var classNo = JSON.parse(localStorage.getItem("classNo") || "[]");
		if (isNull(classNo)) {
			 $("#recent").append('<span>최근 본 클래스가 없습니다.</span>');
			 $("#recentDiv").css("display","none");
		 }else{
			var set = new Set(classNo);
			 var arr = [...set];
		 	 var length = arr.length;
		 	 for(i=length-1;i>=length-3;i--){
		 		var c_no = arr[i];
		 		
	 			if(typeof c_no != "undefined" && c_no != null && c_no != ""){
					var url = "http://localhost:8080/class/classDetail?c_no="+c_no;
	                $("#recentDiv").children("a:eq("+index+")").attr("href",url);
	                index++;
	                
		 				$.ajax({
				            type: 'get',
				            url: '/class/classDetail2',
				            data: {
				                'c_no': c_no
				            }
				            ,dataType : 'text',
				            success: function (c_img_file) {
				                imgArr.push(c_img_file);
				                for(i=0;i<imgArr.length; i++){
			                	  $(".recent-img:eq("+i+")").css("display","visible");
			                	  $(".recent-img:eq("+i+")").attr("src","/uploadLiClass/class/"+imgArr[i]);
				                }
				            },error: function () {
				                console.log('ajax error');
				            }
				        })
		 		}
	 		}
		 	index++;
		 }
		 
			/* floating login */
			$("#floating-login").click(function(){
			       $("#login-pop-modal").attr("style", "display:block");
			       $("#login-pop-modal").attr("style", "display:block");
			   });
			  
			    $("#modal_close_btn").click(function(){
			       $("login-pop-modal").attr("style", "display:none");
			 });
			    
		    /* floating recent */
		    $("#floating-recent").click(function(){
		    	let recentCss = $("#recent").css("visibility");
		    	if(recentCss == "hidden"){
		    		$("#recent").css("visibility","visible");
		    	}else{
		    		$("#recent").css("visibility","hidden");
		    	}
		    });
		    
		    $("#recent-del").click(function(){
		    	localStorage.removeItem("classNo");
		    	alert("최근 본 클래스가 삭제되었습니다.");
		    	location.reload()
		    });
		    
    });