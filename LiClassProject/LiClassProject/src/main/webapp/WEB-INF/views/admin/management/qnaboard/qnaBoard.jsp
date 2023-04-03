<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<script type="text/javascript">
    $(function(){

       $("#insertForm").click(function(){
            location.href="/management/qnaboard/qnaInsertForm";
       });
        /* 제목 클릭 시 상세페이지 이동을 위한 처리 이벤트 */
        $(".goDetail").click(function(){
            let qna_no = $(this).parents("tr").attr("data-num");
            let group_no = $(this).parents("tr").attr("group-num");
            $("#qna_no").val(qna_no);
            $("#qna_group").val(group_no);
            //상세페이지로 이동하기 위해 form 추가 (id : detailForm)
            $("#detailForm").attr({
                "method" : "get",
                "action" : "/management/qnaboard/qnaBoardDetail"
            });
            $("#detailForm").submit();
        });

        //리스트에서 삭제버튼 클릭시 동작 이벤트
        $(".listDeleteBtn").click(function (){
            let qna_no = $(this).parents("tr").attr("data-num");
            if(confirm("정말 삭제하시겠습니까?")){
            $("#qna_no").val(qna_no);
                $("#detailForm").attr({
                    "method" : "post",
                    "action" : "/management/qnaboard/qnaBoardDelete"
                });
                $("#detailForm").submit();
            }
        });
    });

</script>




<div class="contentContainer container">

    <div class="pagetitle">
        <h1>문의사항 관리</h1>
        <hr />
        <div class="row">
            <div class="col-lg-12">
                <button type="button" class="btn btn-dark rounded-pill btn-lg" id="insertBtn">
                    <i class="bi bi-cloud-upload"></i>&nbsp;공지사항 등록</button>
                <!-- 검색영역 -->
                <!-- 검색 & 페이징을 동시에 처리하기 위한 form = 하나의 cvo저장 -->
                <form class="form-inline text-right"  id="f_search">
                    <input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}" />
                    <input type="hidden" name="amount" value="${pageMaker.cvo.amount}" />
                    <input type="text"  name="keyword"  id="keyword" class="form-control" placeholder="검색내용을 입력해주세요.."/>
                    <button type="button" class="btn btn-outline-primary btn-lg"  id="searchBtn">Search</button>
                </form>

    <form id="detailForm">
        <input type="hidden" id="qna_no" name="qna_no"/>
        <input type="hidden" id="qna_group" name="qna_group"/>
    </form>
    <table class="table table-striped">
        <thead>
            <tr>
                <th data-value="b_num" class="order text-center col-sm-1">No.</th>
                <th class="text-left col-md-4" >제목</th>
                <th data-value="b_date" class="text-center col-md-1">작성자</th>
                <th class="text-center col-md-1">등록일</th>
                <th class="text-center col-md-1">관리</th>
            </tr>
        </thead>
        <tbody id="list" class="table-striped text-left">

        <c:choose>
            <c:when test="${not empty qnaBoardList}">
                <c:forEach var="qnaBoard" items="${qnaBoardList}" varStatus="status">
                    <c:if test="${qnaBoard.qna_category != '공지'}">
                    <tr data-num="${qnaBoard.qna_no}" group-num="${qnaBoard.qna_group}">
                        <%--<td class="text-center">${qnaBoard.qna_no}</td>--%>
                            <td class="text-center">${count + status.index + 1}</td>
                        <%--<td class="goDetail text-left">${qnaBoard.qna_title}</td>--%>
                        <td class="text-left">
                        <c:if test="${qnaBoard.qna_step>0}">
                            <c:forEach begin="1" end="${qnaBoard.qna_indent}">
                                &nbsp;&nbsp;&nbsp;
                            </c:forEach>
                        <i class="bi bi-arrow-return-right"></i> &nbsp
                        </c:if>
                                <span class="goDetail">[${qnaBoard.qna_category}]&nbsp ${qnaBoard.qna_title}</span>
                        <%--<td class="goDetail text-left">${qnaBoard.qna_title}</td>--%>
                        <td class="text-center">${qnaBoard.user_name}</td>
                        <td class="text-center">${qnaBoard.qna_date}</td>
                        <td class="text-center">
                            <button class="btn btn-success listUpdateBtn">수정</button>
                            <button class="btn btn-danger listDeleteBtn">삭제</button>
                        </td>
                    </tr>
                    </c:if>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="5" class="tac text-center">등록된 게시글이 존재하지 않습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
            </div>
        </div>
</div>
</div>

