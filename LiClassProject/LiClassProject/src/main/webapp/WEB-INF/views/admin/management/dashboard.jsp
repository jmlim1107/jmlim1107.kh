<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, java.text.*"%>
<%
    Date date = new Date();
    SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat yearDate = new SimpleDateFormat("yyyy");
    SimpleDateFormat monthDate = new SimpleDateFormat("MM");

    String today = simpleDate.format(date);
    String year = yearDate.format(date);
    String month = monthDate.format(date);
%>
<script type="text/javascript">
    $(function (){

    });

    function userStatistics(){
        location.href="/admin/statistics/userstatistics"
    }
    function salesStatistics(){
        location.href="/admin/statistics/salesstatistics"
    }
    function reserveStatistics(){
        location.href="/admin/statistics/reservestatistics"
    }
</script>


    <div class="pagetitle">
        <h1>LiClass 대시보드</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/management/dashboard">Home</a></li>
                <li class="breadcrumb-item active">Dashboard</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
        <div class="row">

            <!-- Left side columns -->
            <%--<div class="col-lg-8">--%>
            <div class="col-lg-12">
                <div class="row">

                    <!-- Sales Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card sales-card">

                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>Filter</h6>
                                    </li>

                                    <li><a class="dropdown-item" href="#">Today</a></li>
                                    <li><a class="dropdown-item" href="#">This Month</a></li>
                                    <li><a class="dropdown-item" href="#">This Year</a></li>
                                </ul>
                            </div>

                            <div class="card-body" onclick="userStatistics()">
                                <h5 class="card-title">활성화 계정<span>| <%=today%>&nbsp 기준</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <%--<i class="bi bi-cart"></i>--%><i class="bi bi-people"></i>
                                    </div>
                                    <div class="ps-3">
                                        <%--계정 통계데이터 삽입--%>
                                        <h6>&nbsp&nbsp&nbsp${userState.ACTIVEUSER} / ${userState.INACTIVEUSER}</h6><%--<canvas id="ActiveUserChart" height="40"></canvas>--%>
                                    </div>
                                </div>
                                <div class="progress mt-3">
                                    <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>

                        </div>
                    </div><!-- End Sales Card -->

                    <!-- Revenue Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card revenue-card">

                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>Filter</h6>
                                    </li>

                                    <li><a class="dropdown-item" href="#">Today</a></li>
                                    <li><a class="dropdown-item" href="#">This Month</a></li>
                                    <li><a class="dropdown-item" href="#">This Year</a></li>
                                </ul>
                            </div>

                            <div class="card-body" onclick="salesStatistics()">
                                <h5 class="card-title">전체 매출 통계 <span>| <%=today%>&nbsp 기준</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-currency-dollar"></i>
                                    </div>
                                    <div class="ps-3">
                                        <%--매출 통계 데이터 삽입--%>
                                        <h6>&nbsp&nbsp &#8361; ${allSales.ALLSALES}</h6><%--<canvas id="SalesChart" height="40"></canvas>--%>
                                    </div>
                                </div>
                                <div class="progress mt-3">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div><!-- End Revenue Card -->
                    <!-- Customers Card -->
                    <div class="col-xxl-4 col-xl-12">

                        <div class="card info-card customers-card">

                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>Filter</h6>
                                    </li>

                                    <li><a class="dropdown-item" href="#">Today</a></li>
                                    <li><a class="dropdown-item" href="#">This Month</a></li>
                                    <li><a class="dropdown-item" href="#">This Year</a></li>
                                </ul>
                            </div>

                            <div class="card-body" onclick="reserveStatistics()">
                                <h5 class="card-title">전체 예약 통계 <span>| <%=today%>&nbsp 기준</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-calendar2-check"></i>
                                    </div>
                                    <div class="ps-3">
                                        <%--예약 통계데이터 삽입--%>
                                        <h6>&nbsp&nbsp ${userReserve.RESERVECHECK} / ${userReserve.RESERVECANCEL}</h6><%--<canvas id="ReserveChart" height="40"></canvas>--%>
                                    </div>
                                </div>
                                <div class="progress mt-3">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
<%--                                <div class="progress mt-3">
                                    <div class="progress-bar progress-bar-striped bg-success" style="width: 20%;" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">Step 1</div>
                                    <div class="progress-bar progress-bar-striped bg-warning" style="width: 30%;" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">Step 2</div>
                                    <div class="progress-bar progress-bar-striped bg-danger" style="width: 50%;" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">Step 3</div>
                                </div>--%>
                            </div>

                        </div>

                    </div><!-- End Customers Card -->

                    <!-- Reports -->
                    <div class="col-12">
                        <div class="card">

                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>Filter</h6>
                                    </li>

                                    <li><a class="dropdown-item" href="#">Today</a></li>
                                    <li><a class="dropdown-item" href="#">This Month</a></li>
                                    <li><a class="dropdown-item" href="#">This Year</a></li>
                                </ul>
                            </div>

                            <div class="card-body">
                                <h5 class="card-title">Reports <span>/ <%=today%>></span></h5>

                                <!-- Line Chart -->
                                <%--차트 통계데이터 기반으로 삽입--%>
                                <div id="reportsChart"><canvas id="ReportChart" width="60%" height="15"></canvas>${userState.INACTIVEUSER} / ${userState.ACTIVEUSER}</div>
                                <script>

                                </script>
                            </div>
                        </div>
                    </div><!-- End Reports -->
                    <div class="col-12">
                        <div class="card top-selling overflow-auto">
                            <div class="card-body pb-0">
                                <h5 class="card-title">최근 공지사항<span>  |  <%=today%></span></h5>
                                <table class="table table-borderless">
                                    <thead>
                                    <tr>
                                        <th scope="col">구분</th>
                                        <th scope="col">글제목</th>
                                        <th scope="col">작성자</th>
                                        <th scope="col">등록일</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${not empty noticeList}">
                                             <c:forEach var="notice" items="${noticeList}" varStatus="status">
                                                <tr>
                                                    <td>${notice.qna_category}</td>
                                                    <td>${notice.qna_title}</td>
                                                    <td>관리자</td>
                                                    <td>${notice.qna_date}</td>
                                                </tr>
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
                    </div><!-- End Top Selling -->
                    <div class="col-12">
                        <div class="card top-selling overflow-auto">
                            <div class="card-body pb-0">
                                <h5 class="card-title">최근 문의사항<span>  |  <%=today%></span></h5>

                                <table class="table table-borderless">
                                    <thead>
                                    <tr>
                                        <th scope="col">구분</th>
                                        <th scope="col">글제목</th>
                                        <th scope="col">작성자</th>
                                        <th scope="col">등록일</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${not empty qnaList}">
                                            <c:forEach var="qna" items="${qnaList}" varStatus="status">
                                                <tr>
                                                    <td>${qna.qna_category}</td>
                                                    <td>${qna.qna_title}</td>
                                                    <td>사용자</td>
                                                    <td>${qna.qna_date}</td>
                                                </tr>
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
                    </div><!-- End Top Selling -->

                </div>
            </div><!-- End Left side columns -->
        </div>
        <script>
            //활성화 계정 통계 차트
            /*var ctx = document.getElementById("ActiveUserChart");
            var ActiveUserChart = new Chart(ctx, {
                type: 'horizontalBar',
                data: {
                    labels: [],
                    datasets: [{
                        label: '활성',
                        data: [200],
                        backgroundColor: "rgb(153,255,153)",
                        borderColor: "rgb(153,255,153)",
                    },
                        {
                            label: '탈퇴',
                            data: [50],
                            backgroundColor: "rgb(255,204,51)",
                            borderColor: "rgb(255,204,51)",
                        }]
                },
                options: {
                    legend:{
                        display : false
                    },
                    responsive: true,
                    title: {
                        display: false,
                        text: 'Report',
                    },
                    tooltips: {
                        enabled: false,
                        intersect: false,
                    },
                    hover: {
                        mode: 'nearest',
                        intersect: true
                    },
                    scales: {
                        yAxes: [{
                            stacked: true,
                            display: true,
                            scaleLabel: {
                                display: false,
                            },
                            gridLines :{
                                display: false,
                                drawBorder: false,
                            },
                        }],
                        xAxes: [{
                            stacked: true,
                            display: true,
                            ticks: {
                                display :false,
                                autoSkip: false
                            },
                            gridLines :{
                                display: false,
                                drawBorder: false,
                            },
                            scaleLabel: {
                                display: false,
                            },

                        }]
                    },
                }
            });*/

            //전체 매출 통계 차트
/*            var ctx = document.getElementById("SalesChart");
            var SalesChart = new Chart(ctx, {
                type: 'horizontalBar',
                data: {
                    labels: [],
                    datasets: [{
                        label: '활성',
                        data: [20],
                        backgroundColor: "rgb(153,255,153)",
                        borderColor: "rgb(153,255,153)",
                    },
                        {
                            label: '탈퇴',
                            data: [20],
                            backgroundColor: "rgb(255,204,51)",
                            borderColor: "rgb(255,204,51)",
                        }]
                },
                options: {
                    legend:{
                        display : false
                    },
                    responsive: true,
                    title: {
                        display: false,
                        text: 'Report',
                    },
                    tooltips: {
                        enabled: false,
                        intersect: false,
                    },
                    hover: {
                        mode: 'nearest',
                        intersect: true
                    },
                    scales: {
                        yAxes: [{
                            stacked: true,
                            display: true,
                            scaleLabel: {
                                display: false,
                            },
                            gridLines :{
                                display: false,
                                drawBorder: false,
                            },
                        }],
                        xAxes: [{
                            stacked: true,
                            display: true,
                            ticks: {
                                display :false,
                                autoSkip: false
                            },
                            gridLines :{
                                display: false,
                                drawBorder: false,
                            },
                            scaleLabel: {
                                display: false,
                            },

                        }]
                    },
                }
            });*/

            //예약 통계 차트
            /*var ctx = document.getElementById("ReserveChart");
            var ReserveChart = new Chart(ctx, {
                type: 'horizontalBar',
                data: {
                    labels: [],
                    datasets: [{
                        label: '예약확정',
                        data: [80],
                        backgroundColor: "rgb(153,255,153)",
                        borderColor: "rgb(153,255,153)",
                    },
                        {
                            label: '예약취소',
                            data: [50],
                            backgroundColor: "rgb(255,204,51)",
                            borderColor: "rgb(255,204,51)",
                        }]
                },
                options: {
                    legend:{
                        display : false
                    },
                    responsive: true,
                    title: {
                        display: false,
                        text: 'Report',
                    },
                    tooltips: {
                        enabled: false,
                        intersect: false,
                    },
                    hover: {
                        mode: 'nearest',
                        intersect: true
                    },
                    scales: {
                        yAxes: [{
                            stacked: true,
                            display: true,
                            scaleLabel: {
                                display: false,
                            },
                            gridLines :{
                                display: false,
                                drawBorder: false,
                            },
                        }],
                        xAxes: [{
                            stacked: true,
                            display: true,
                            ticks: {
                                display :false,
                                autoSkip: false
                            },
                            gridLines :{
                                display: false,
                                drawBorder: false,
                            },
                            scaleLabel: {
                                display: false,
                            },

                        }]
                    },
                }
            });*/

            //리포트 통계 차트
            var ctx = document.getElementById("ReportChart");
            var ReportChart = new Chart(ctx, {
                type: 'horizontalBar',
                data: {
                    labels: ['계정', '매출', '예약'],
                    datasets: [{
                        label: '어제',
                        data: [${userState.INACTIVEUSER}, 3, ${userReserve.RESERVECANCEL}],
                        backgroundColor: "rgb(204,229,255)",
                        borderColor: "rgb(204,229,255)",
                    },
                        {
                            label: '오늘',
                            data: [${userState.ACTIVEUSER}, 7, ${userReserve.RESERVECHECK}],
                            backgroundColor: "rgb(255,229,204)",
                            borderColor: "rgb(255,229,204)",
                        }]
                },
                options: {
                    responsive: true,
                    title: {
                        display: false,
                        text: 'Report',
                    },
                    tooltips: {
                        mode: 'index',
                        intersect: false,
                    },
                    hover: {
                        mode: 'nearest',
                        intersect: true
                    },
                    scales: {
                        yAxes: [{
                            display: true,
                            scaleLabel: {
                                display: false,
                                labelString: 'x축'
                            },
                            gridLines :{
                                display: false,
                            },
                        }],
                        xAxes: [{
                            display: true,
                            ticks: {
                                display :false,
                                autoSkip: false
                            },
                            gridLines :{
                                display: false,
                            },
                            scaleLabel: {
                                display: false,
                                labelString: 'y축'
                            },

                        }]
                    },
                    legend:{
                        display : false
                    }
                }
            });
        </script>
    </section>


