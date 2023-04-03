
/* 메인화면 floating nav 
	function isNull(obj){
		 if(obj == '' || obj == null || obj == undefined || obj == NaN){ 
		  return true;
		 }else{
		  return false;
		 }
	}
	
	$(function(){
		/* 로그인 
		$("#floating-login").click(function(){
		       $("#login-pop-modal").attr("style", "display:block");
		       $("#login-pop-modal").attr("style", "display:block");
		   });
		  
		    $("#modal_close_btn").click(function(){
		       $("#login-pop-modal").attr("style", "display:none");
		 });
		    
		/* 최근 본 클래스 
		//localStorage.clear();
		//localStorage.removeItem("classNo");
		//localStorage.removeItem("activePosition");
		//console.log("localStorage - classNo : "+localStorage.getItem("classNo"));
		console.log("activePosition : "+localStorage.getItem("activePosition"));

		/* 최근 본 클래스 
	 	var imgArr = [];
		var recetClasses = JSON.parse(localStorage.getItem("classNo") || "[]");
		if (isNull(recetClasses)) {
			 $("#recentDiv").append('<span style="color:#555;">최근 본 클래스가 없습니다.</span>');
			 $(".recent-a").css("display","none");
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
			 
			 for(i=0;i<uniqueArr.length;i++){
			 	var c_no = uniqueArr[i];
	 			if(typeof c_no != "undefined" && c_no != null && c_no != ""){
					var url = "http://localhost:8080/class/classDetail?c_no="+c_no;
	                $("#recentDiv").children("a:eq("+i+")").attr("href",url);
		 				$.ajax({
				            type: 'get',
				            url: '/class/getClassImg',
				            data: {
				                'c_no': c_no
				            }
				            ,dataType : 'text',
				            success: function (c_img_file) {
								//console.log("c_img_file : "+c_img_file)
								
				                imgArr.push(c_img_file);
				                for(i=0;i<imgArr.length; i++){
			                	 $(".recent-img:eq("+i+")").css("display","grid");
			                	  $(".recent-img:eq("+i+")").attr("src","/uploadLiClass/class/"+imgArr[i]);
				                }
				            },error: function () {
				                console.log('ajax error');
				            }
				        })
		 			}
		 		}
		 	}
		
		$("#floating-recent").click(function(){
			let recentCss = $("#recentDiv").css("visibility");
			console.log(recentCss);
			if(recentCss == "hidden"){
				$("#recentDiv").css("visibility","visible");
			}else{
				$("#recentDiv").css("visibility","hidden");
			}
		});
		
		 //최근 본 클래스 삭제
	    $("#recent-del").click(function(){
	    	localStorage.removeItem("classNo");
	    	alert("최근 본 클래스가 삭제되었습니다.");
	    	location.reload()
	    });
		 
	})

	*/