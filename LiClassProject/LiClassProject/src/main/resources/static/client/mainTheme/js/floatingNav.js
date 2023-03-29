
	/* 메인화면 floating nav */
	
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
	 	var imgArr = [];
		var recetClasses = JSON.parse(localStorage.getItem("classNo") || "[]");
		if (isNull(recetClasses)) {
			 $("#recent").append('<span>최근 본 클래스가 없습니다.</span>');
			 $("#recentDiv").css("display","none");
		 }else{
			 var recentClasses3 = recetClasses.slice(-3);
			 //중복제거
				let uniqueArr = [];
				recentClasses3.forEach((element) => {
				    if (!uniqueArr.includes(element)) {
				        uniqueArr.push(element);
				    }
				});
 				console.log("uniqueArr : "+uniqueArr);
			 
			 for(i=0;i<recentClasses3.length;i++){
			 	var c_no = recentClasses3[i];
	 			if(typeof c_no != "undefined" && c_no != null && c_no != ""){
					var url = "http://localhost:8080/class/classDetail?c_no="+c_no;
	                $("#recentDiv").children("a:eq("+i+")").attr("href",url);
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
		 		
		 
			/* 로그인 */
			$("#floating-login").click(function(){
			       $("#login-pop-modal").attr("style", "display:block");
			       $("#login-pop-modal").attr("style", "display:block");
			   });
			  
			    $("#modal_close_btn").click(function(){
			       $("login-pop-modal").attr("style", "display:none");
			 });
			    
		    /* 최근 본 클래스 */
		    $("#floating-recent").click(function(){
		    	let recentCss = $("#recent").css("visibility");
		    	if(recentCss == "hidden"){
		    		$("#recent").css("visibility","visible");
		    	}else{
		    		$("#recent").css("visibility","hidden");
		    	}
		    });
		    
		    //최근 본 클래스 삭제
		    $("#recent-del").click(function(){
		    	localStorage.removeItem("classNo");
		    	alert("최근 본 클래스가 삭제되었습니다.");
		    	location.reload()
		    });
		    
    });