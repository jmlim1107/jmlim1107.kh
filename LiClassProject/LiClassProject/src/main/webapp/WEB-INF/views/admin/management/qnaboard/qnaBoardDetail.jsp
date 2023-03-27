<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script type="text/javascript">

    $(function (){
        $("#qnaAnswerBtn").click(function(){
            console.log("dddd")
            $("#f_data").attr({
               "method" : "post",
               "action" : "/management/qnaboard/qnaAnswerForm/"
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
    });


</script>

<div class="contentContainer container">
    <!-- <div class="contentTit page-header"><h3 class="text-center">게시판 상세보기</h3></div>  -->

    <form name="f_data" id="f_data" method="post">
        <input type="hidden" name="qna_no" id="qna_no" value="${detail.qna_no}"/>
    </form>

        <div class="btnArea col-md-4 text-right">
            <input type="button" value="답변" id="qnaAnswerBtn" class="btn btn-success" />
            <input type="button" value="글삭제" id="noticeDeleteBtn" class="btn btn-success" />
        </div>


    <%-- =============== 상세 정보 보여주기 시작 ============ --%>
    <div class="contentTB text-center">
        <table class="table table-bordered">
            <tbody>
            <tr>
                <td class="col-md-3 text-left">관리자(${detail.qna_date})</td>
            </tr>
            <tr>
                <td class="col-md-4">글제목</td>
                <td colspan="3" class="col-md-8 text-left">${detail.qna_title}</td>
            </tr>
            <tr class="table-tr-height">
                <td class="col-md-4">글내용</td>
                <td colspan="3" class="col-md-8 text-left">${detail.qna_content}</td>
            </tr>

            </tbody>
        </table>
    </div>

    <div id="reviewList">
        <div id="item-template" class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <span class="name">관리자 / </span>
                    <span class="date">(${detail.qna_date})</span>
                    <button type="button" data-btn="upBtn" class="btn btn-default gap">수정하기</button>
                    <button type="button" data-btn="delBtn" class="btn btn-default gap">삭제하기</button>
                </h3>
            </div>
            <div class="panel-body">${detail.qna_content}</div>
        </div>
    </div>

</div>
