<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script type="text/javascript">

    $(function (){
        $("#updateFormBtn").click(function(){
            console.log("dddd")
            $("#f_data").attr({
               "method" : "post",
               "action" : "/management/noticeboard/updateForm"
            });
            $("#f_data").submit();
        });
        $("#noticeDeleteBtn").click(function(){
            if(confirm("정말 삭제하시겠습니까?")){
                $("#f_data").attr({
                    "method" : "post",
                    "action" : "/management/noticeboard/noticeDelete"
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
            <input type="button" value="글수정" id="updateFormBtn" class="btn btn-success" />
            <input type="button" value="글삭제" id="noticeDeleteBtn" class="btn btn-success" />
        </div>
    </div>

    <%-- =============== 상세 정보 보여주기 시작 ============ --%>
    <div class="contentTB text-center">
        <table class="table table-bordered">
            <tbody>
            <tr>
                <td class="col-md-4">작성자</td>
                <td class="col-md-3 text-left">관리자</td>
            </tr>
            <tr>
                <td class="col-md-3 text-left">최초 등록일(${detail.qna_date})</td>
                <td class="col-md-3 text-left">최근 수정일(${detail.qna_date_fix})</td>
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
</div>
