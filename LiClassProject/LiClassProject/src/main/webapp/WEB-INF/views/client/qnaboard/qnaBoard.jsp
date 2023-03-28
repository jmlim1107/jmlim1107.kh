<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<script type="text/javascript">
    $(function (){

        $("#insertForm").click(function(){
            location.href="/client/qnaboard/qnaInsertForm";
        });
        /* 제목 클릭 시 상세페이지 이동을 위한 처리 이벤트 */
        $(".goDetail").click(function(){
            let qna_no = $(this).parents("div").attr("data-num");
            $("#qna_no").val(qna_no);
            console.log(qna_no);
            //상세페이지로 이동하기 위해 form 추가 (id : detailForm)
            $("#detailForm").attr({
                "method" : "get",
                "action" : "/client/qnaboard/qnaBoardDetail"
            });
            $("#detailForm").submit();
        });
    });
</script>
    <form id="detailForm">
        <input type="hidden" id="qna_no" name="qna_no"/>
    </form>

    <div class="board_wrap">
        <div class="board_title">
            <strong>문의사항</strong>
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
                             <div class="num" >${count + status.index + 1}<%--<i class="bi bi-bell"></i>--%></div>
                            <div class="title goDetail">
                            <c:if test="${qnaBoard.qna_step>0}">
                                <c:forEach begin="1" end="${qnaBoard.qna_indent}">

                                </c:forEach>
                                &nbsp;&nbsp;&nbsp;<i class="bi bi-arrow-return-right"></i>
                            </c:if>
                                <span>${qnaBoard.qna_category} ${qnaBoard.qna_title}</span>
                            </div>
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
                <a href="#" class="bt first"><<</a>
                <a href="#" class="bt prev"><</a>
                <a href="#" class="num on">1</a>
                <a href="#" class="num">2</a>
                <a href="#" class="num">3</a>
                <a href="#" class="num">4</a>
                <a href="#" class="num">5</a>
                <a href="#" class="bt next">></a>
                <a href="#" class="bt last">>></a>
            </div>
            <div class="bt_wrap">
                <button type="button" class="on" id="insertForm">등록</button>
                <!--<a href="#">수정</a>-->
            </div>
        </div>
    </div>
