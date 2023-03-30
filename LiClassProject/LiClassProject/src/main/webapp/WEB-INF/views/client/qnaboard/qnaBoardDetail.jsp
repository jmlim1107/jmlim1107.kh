<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">

    $(function (){
        $("#updateBtn").click(function (){
            $("#f_data").attr({
               "method" : "post",
                "action" : "/client/qnaboard/qnaUpdateForm"
            });
            $("#f_data").submit();
        });
/*        $("#noticeDeleteBtn").click(function(){
            if(confirm("정말 삭제하시겠습니까?")){
                $("#f_data").attr({
                    "method" : "post",
                    "action" : "/management/qnaboard/qnaBoardDelete"
                });
                $("#f_data").submit();
            }
        });*/
        $("#listBtn").click(function (){
            location.href="/client/qnaboard/qnaBoard";
        });
    });


</script>

<div class="board_wrap">

    <form name="f_data" id="f_data" method="post">
        <input type="hidden" name="qna_no" id="qna_no" value="${detail.qna_no}"/>
        <input type="hidden" name="user_no" id="user_no" value="${detail.user_no}"/>
    </form>

    <div class="board_title">
        <c:choose>
            <c:when test="${detail.qna_category == '공지'}">
                <strong>공지사항</strong>
                <p>공지사항을 잘 확인하시기 바랍니다.</p>
            </c:when>
            <c:otherwise>
                <strong>문의사항</strong>
                <p>문의사항을 잘 작성하시고 답변을 잘 확인 바랍니다.</p>
            </c:otherwise>
        </c:choose>

    </div>
    <div class="board_view_wrap">
        <div class="board_view">
            <div class="title">
                ${detail.qna_title}
                <div class="info">
                    <dl>
                        <dt>작성자</dt>
                        <c:choose>
                            <c:when test="${detail.admin_no > 0}">
                                <dd>${detail.admin_name}</dd>
                            </c:when>
                            <c:otherwise>
                                <dd>${detail.user_name}</dd>
                            </c:otherwise>
                        </c:choose>
                    </dl>
                    <dl>
                        <dt>작성날짜 : </dt>
                        <dd>${detail.qna_date}&nbsp;&nbsp;</dd>
                        <c:if test="${not empty detail.qna_date_fix}">
                        <dd>(</dd>
                        <dt>수정날짜 : </dt>
                        <dd>${detail.qna_date_fix})</dd>
                        </c:if>
                    </dl>
                </div>
            </div>

            <div class="cont">
                ${detail.qna_content}
            </div>
            <div>
            </div>
        </div>

        <div class="bt_wrap">
            <button type="button" class="on" id="listBtn">목록</button>
            <button type="button" class="on" id="updateBtn">수정</button>
        </div>
    </div>
</div>