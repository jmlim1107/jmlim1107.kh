<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<script type="text/javascript">
    $(function (){
        /* 제목 클릭 시 상세페이지 이동을 위한 처리 이벤트 */
        $(".goDetail").click(function(){
            let qna_no = $(this).parents("div").attr("data-num");
            $("#qna_no").val(qna_no);
            console.log(qna_no);
            //상세페이지로 이동하기 위해 form 추가 (id : detailForm)
            $("#detailForm").attr({
                "method" : "get",
                "action" : "/client/qnaboard/noticeBoardDetail"
            });
            $("#detailForm").submit();
        });
        $(".page-item a").click(function(e){
            e.preventDefault();
            $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
            goPage();
        });
    });
    function goPage(){
        if($("#search").val()=="all"){
            $("#keyword").val("");
        }
        $("#f_search").attr({
            "method" : "get",
            "action" : "/client/qnaboard/noticeBoard"
        });
        $("#f_search").submit();
    }
</script>
<form id="detailForm">
    <input type="hidden" id="qna_no" name="qna_no"/>
</form>
<form id="f_search">
    <input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}">
    <input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">

    <input class="form-control me-2"  id="keyword" name="keyword" type="search" placeholder="검색...." aria-label="Search">
    <button class="btn btn-outline-secondary" id="searchData" type="submit"><i class="bi bi-search"></i></button>
</form>

<div class="board_wrap">
    <div class="board_title">
        <strong>공지사항</strong>
    </div>
    <div class="board_list_wrap">
        <div class="board_list">
            <%--상단--%>
            <div class="top">
                <div class="num">번호</div>
                <div class="title">제목</div>
                <div class="writer">글쓴이</div>
                <div class="date">작성일</div>
            </div>
            <%--내용--%>
            <c:choose>
                <c:when test="${not empty qnaBoardList}">
                    <c:forEach var="qnaBoard" items="${qnaBoardList}" varStatus="status">
                        <div data-num="${qnaBoard.qna_no}">
                            <div class="num" >${qnaBoard.qna_no}<%--${count + status.index + 1}--%><%--<i class="bi bi-bell"></i>--%></div>
                            <div class="title goDetail">${qnaBoard.qna_category} ${qnaBoard.qna_title}</div>
                                <%--<div class="title goDetail">${qnaBoard.qna_category} ${qnaBoard.qna_title}</a></div>--%>
                            <div class="writer">김이름</div>
                            <div class="date">${qnaBoard.qna_date}</div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="text-center">등록된 게시글이 존재하지 않습니다.</div>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="board_page">
            <nav aria-label="Page navigation example" style="text-align:center;">
                <ul class="pagination">
                    <%--이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인.--%>
                    <c:if test="${pageMaker.prev}">
                        <li class="page-item">
                            <a class="page-link" href="${pageMaker.startPage - 1}">Previous</a>
                        </li>
                    </c:if>

                    <%--바로가기 번호 출력--%>
                    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                        <li class="page-item ${pageMaker.cvo.pageNum == num ?'active':''}">
                            <a class="page-link" href="${num}">${num}</a>
                        </li>
                    </c:forEach>

                    <%--다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인. --%>
                    <c:if test="${pageMaker.next}">
                        <li class="page-item next">
                            <a class="page-link" href="${pageMaker.endPage + 1}">Next</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>
