<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
   .table>tbody>tr>td{padding:12px;vertical-align: middle;}
   ul{height:0px;}
   .csp{text-decoration:none;color:black;}
   .csp:hover{text-decoration:underline;}
   
   
   .pagination {
  display: flex;
  justify-content: center;
  align-content: center;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  border-radius:50%;

}

.pagination a.active {
  background-color: #3938387a;
  color: white;
  width: 39.94px;
  height: 39.8px;
}
.pagination a:hover:not(.active) {background-color: #39383838;}
</style>

<script type="text/javascript">
   $(function(){
      $(".payCencelBtn").click(function(){
         if(confirm("정말 환불을 하시겠습니까?")){
            location.href = "/payment/payCencel?user_no=${loginUser.user_no }&merchant_uid=" + $(this).parents("tr").attr("data-num");
         }else{
            return;
         }
      });
       //페이지 번호 클릭 시
         $(".paginate_button").click(function(){
            
            //현재페이지 localStorage에 activePosition저장
            var activePosition = 1;
            localStorage.setItem("activePosition",activePosition);
            console.log("set activePosition : "+activePosition);
            
            var pageNum = $(this).data("num");
            console.log("이동할 페이지 : "+pageNum);
            $("#pageNum").val(pageNum);
             
             $("#f_search").attr({
               "method":"get",
               "action":"/mypage"
            });
            $("#f_search").submit(); 
            
           });
          
      $(".csp").click(function(){
         $.ajax({
             type:"GET",
             url:"/payment/getPaymentInfo",
             data:"merchant_uid="+$(this).parents("tr").attr("data-num"),
             dataType:"JSON",
             success:function(data){
                    $("#merchant_uid").text(data.merchant_uid);
                    $("#pay_name").text(data.pay_name);
                    $("#pay_pg").text(data.pay_pg);
                    $("#pay_method").text(data.pay_method);
                    $("#pay_date").text(data.pay_date);
                },
                error:function(){
                    console.log("모달실패");
                 }
         });
      });
     
      /* 모달 */
      $("#modal_opne_btn").click(function(){
         $("#modal").attr("style", "display:block");
      });
    
      $("#modal_close_btn").click(function(){
         $("#modal").attr("style", "display:none");
      });  
   });  
</script>

<!-- 모달창  --> 
<div class="modal" id="sns-share" style="z-index: 2; position: initial; text-align: center;">
   <table class="table table-bordered">
      <tr>
         <th>주문번호</th>
          <td id="merchant_uid"></td>
      </tr>
      <tr>
         <th>클래스명</th>
         <td id="pay_name"></td>
      </tr>
      <tr>
         <th>pg사 구분코드</th>
         <td id="pay_pg"></td>
      </tr>
      <tr>
         <th>결제수단</th>
         <td id="pay_method"></td>
      </tr>
      <tr>
         <th>결제일자</th>
         <td id="pay_date"></td>
      </tr>
   </table>
</div>
<!-- 모달창  -->

<div id="portfolio2">
<div class="thumb">
   <div class="row" ><!-- 은아)0330 수정 style="height: 632px;" -->
      <div class="left-text">
         <h4>결제내역</h4>

         <form id="f_search" name="f_search" class="form-inline">
            <input type="hidden" name="pageNum" id="pageNum"  value="${ pageMaker.cvo.pageNum }">
            <input type="hidden" name="amount" id="amount" value="${ pageMaker.cvo.amount }">
         </form>
             
         <%-- ==================== 리스트 시작 ==================== --%>
         <div id="paymentList" class="table-height">
            <form id="dataForm">
               <input type="hidden" name="user_no" value='${loginUser.user_no }'>
                 
               <table summary="결제내역 리스트" class="table table-hover">
                  <thead>
                     <tr>
                        <th data-value="b_num" class="order text-center col-md-3">상품정보</th>
                        <th class="text-center col-md-2">결제일자</th>
                        <th class="text-center col-md-2">결제번호</th>
                        <th class="text-center col-md-1">주문금액</th>
                        <th class="text-center col-md-1">주문 상태</th>
                     </tr>
                  </thead>
                    <tbody id="paymentList" class="table-striped">
                    <!-- 데이터 출력 --><!--   -->
                  <c:choose>
                     <c:when test="${ not empty pvo_paymentList }">
                        <c:forEach var="payment" items="${ pvo_paymentList }" >
                           <tr class="text-center" data-num="${ payment.merchant_uid }">
                              <td style="text-align:left;padding-left:15px;">
                                 <img src="https://item.kakaocdn.net/do/493188dee481260d5c89790036be0e66f604e7b0e6900f9ac53a43965300eb9a" style="width:60px;height:60px;object-fit:cover;" alt="..." class="img-rounded">
                                 <span style="padding-left:30px;">${ payment.pay_name }</span>
                              </td>                     
                              <td class="name">${ payment.pay_date }</td>
                              <td class="name"><a class="csp" href="#sns-share" rel="modal:open">${ payment.merchant_uid }</a></td>
                              <td>${ payment.pay_price }</td>
                                   
                              <c:choose>
                                 <c:when test="${payment.count >=1 and payment.pay_status==0 }">
                                    <td>결제완료/
                                       <button type="button" class="btn-default btn-xs payCencelBtn" disabled>환불불가</button>
                                            </td>
                                      </c:when>
                                 <c:when test="${payment.count >=1 and payment.pay_status==1 }">
                                    <td>결제취소</td>
                                      </c:when>
                                      <c:when test="${payment.count >=1 and payment.pay_status==2 }">
                                    <td>결제실패</td>
                                      </c:when>
                                      <c:when test="${payment.count >=1 and payment.pay_status==3 }">
                                    <td>환불완료</td>
                                      </c:when>
            
                                      <c:when test="${payment.count < 1 and payment.pay_status==0 }">
                                    <td>결제완료/
                                       <button type="button" class="btn-default btn-xs payCencelBtn">환불하기</button>
                                            </td>
                                      </c:when>
                                      <c:when test="${payment.count < 1 and payment.pay_status==1 }">
                                    <td>결제취소</td>
                                      </c:when>
                                      <c:when test="${payment.count < 1 and payment.pay_status==2 }">
                                    <td>결제실패</td>
                                      </c:when>
                                      <c:when test="${payment.count < 1 and payment.pay_status==3 }">
                                    <td>환불완료</td>
                                      </c:when>
                                   </c:choose>                       
                                </tr>
                        </c:forEach>
                     </c:when>
                     <c:otherwise>
                        <tr>
                           <td colspan="6" class="tac text-center">결제내역이 존재하지 않습니다.</td>
                        </tr>
                     </c:otherwise>
                  </c:choose>
                  </tbody>
               </table>
            </form>
         </div>
         <%-- ==================== 리스트 종료 ==================== --%>
      </div>
   </div>
</div>
</div>
  

  <%-- ==================== 페이징 출력 시작 ====================
     <div class="pagination">
        <!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인. -->
        <c:if test="${pageMaker.prev}">
           <li class="paginate_button previous" style="position:inherit;opacity:inherit;">
              <a href="${pageMaker.startPage - 1}">Previous</a>
           </li>
        </c:if>
              
        <!-- 바로가기 번호 출력 -->
        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
           <li class="paginate_button  ${pageMaker.cvo.pageNum == num ? 'active':''}" style="position:inherit;opacity:inherit;">
              <a href="${num}">${num}</a>
           </li>
        </c:forEach>
  
        <!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인. -->
        <c:if test="${pageMaker.next}">
           <li class="paginate_button next" style="position:inherit;opacity:inherit;">
              <a href="${pageMaker.endPage + 1 }">Next</a>
           </li>
        </c:if> 
     </div> --%>
  <%-- ==================== 페이징 출력 종료 ==================== --%> 
<div class="pagination">
   <c:if test="${pageMaker.prev}">
      <a href="${pageMaker.startPage - 1}">&laquo;</a>
   </c:if>
   <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
      <a class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''} "  data-num="${num}" >${num}</a>
   </c:forEach>
   <c:if test="${pageMaker.next}">
      <a href="${pageMaker.endPage + 1 }">&raquo;</a>
   </c:if>
</div>