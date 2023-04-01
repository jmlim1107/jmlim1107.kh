<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${centerDetail != null} ">
        	<div class="row me-row content-ct speaker" id="speakers">
        <h2 class="row-title">${centerDetail.ct_name}</h2>
        <div class="col-md-4 col-sm-6 feature" style="width: 100%;">
          <p>${centerDetail.ct_intro}</p>
          <ul class="speaker-social">
            <c:if test="${centerDetail.ct_hmpg_addr != null}">
            	<li><a href="${centerDetail.ct_hmpg_addr}"><i class="fa-solid fa-house"></i></a></li>
        </c:if>
          </ul>
        </div>
      </div>
    </c:if>
    	 <div class="main-white-button" id="map-click" style="margin:5px;"><a href="#"><i class="fa-solid fa-map-pin"></i>${clientClassDetail.c_area}</a>
<p style="padding: 12px 25px;"><i class="fa-regular fa-circle-check"></i>자세한 주소는 예약내역에서 확인해주세요.</p>
    	 </div>
<div id="map" style="width:100%;height:350px;"></div>
 <!--  kakao map start  -->
				          <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=93dabf793b8403bbf540b6d314c75a8f&libraries=services"></script>
						  <script type="text/javascript" >
						  
							$("#map-click").click(function(){
								var mapContainer = document.getElementById('map'), 
								    mapOption = {
								        center: new kakao.maps.LatLng(33.450701, 126.570667),
								        level: 4
								    };  
								var map = new kakao.maps.Map(mapContainer, mapOption); 
								
									map.relayout();
									map.setCenter(new kakao.maps.LatLng(33.450701, 126.570667));
									
									var addr = "${classDetail.c_area}";
									var detailAddr =  "${centerDetail.ct_detail_addr}";
									var centerAddr = addr+" "+detailAddr;
									console.log("센터 주소 : "+centerAddr);
									var geocoder = new kakao.maps.services.Geocoder();
									
									geocoder.addressSearch(centerAddr, function(result, status) {
									   
									     if (status === kakao.maps.services.Status.OK) {
									
									        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
									
									        map.setCenter(coords);
									        
											var markerPosition  = coords;
											// 마커를 생성합니다
											var marker = new kakao.maps.Marker({
											    position: markerPosition
											});
			
											// 마커가 지도 위에 표시되도록 설정합니다
											marker.setMap(map);
											
											var iwContent = '<div style="text-align:center;color:#555;">${centerDetail.ct_name}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
										    iwPosition = coords; //인포윈도우 표시 위치입니다
			
											// 인포윈도우를 생성합니다
											var infowindow = new kakao.maps.InfoWindow({
											    position : iwPosition, 
											    content : iwContent 
											});
											  
											// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
											infowindow.open(map, marker);
										    } 
									});
									
									
							});
							</script>
							<!--  kakao map end  -->