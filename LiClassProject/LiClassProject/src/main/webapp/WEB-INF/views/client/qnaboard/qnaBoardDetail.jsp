<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<script type="text/javascript">

    $(function (){
        $("#updateBtn").click(function (){
            $("#f_data").attr({
               "method" : "post",
                "action" : "/client/qnaboard/qnaUpdateForm"
            });
            $("#f_data").submit();
        });
        $("#noticeDeleteBtn").click(function(){
            if(confirm("정말 삭제하시겠습니까?")){
                $("#f_data").attr({
                    "method" : "post",
                    "action" : "/management/qnaboard/qnaBoardDelete"
                });
                $("#f_data").submit();
            }
        });
        $("#listBtn").click(function (){
            location.href="/client/qnaboard/qnaBoard";
        });
    });


</script>

<div class="board_wrap">

    <form name="f_data" id="f_data" method="post">
        <input type="hidden" name="qna_no" id="qna_no" value="${detail.qna_no}"/>
    </form>

    <div class="board_title">
        <strong>문의사항</strong>
        <p></p>
    </div>
    <div class="board_view_wrap">
        <div class="board_view">
            <div class="title">
                ${detail.qna_title}
                <div class="info">
                    <dl>
                        <dt>작성자</dt>
                        <dd>김이름</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd>${detail.qna_date}</dd>
                    </dl>
                </div>
            </div>

            <div class="cont">
                ${detail.qna_content}
            </div>
        </div>
        <div class="bt_wrap">
            <button type="button" class="on" id="listBtn">목록</button>
            <button type="button" class="on" id="updateBtn">수정</button>
        </div>
    </div>
</div>