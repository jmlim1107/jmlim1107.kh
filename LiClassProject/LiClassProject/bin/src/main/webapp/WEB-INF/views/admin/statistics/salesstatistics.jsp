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

<section class="section dashboard col-lg-12">
    <div class="row">

        <!-- Left side columns -->
        <%--<div class="col-lg-8">--%>
        <div class="col-lg-10">
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

                        <div class="card-body">
                            <h5 class="card-title">전체 매출<span>&nbsp | &nbsp<%=today%></span></h5>

                            <div class="d-flex align-items-center">
                                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                    <i class="bi bi-calendar3"></i>
                                </div>
                                <div class="ps-3">
                                    <%--계정 통계데이터 삽입--%>
                                    <h6>&nbsp&nbsp&nbsp${userState.ACTIVEUSER} 214124</h6>
                                    <canvas id="ActiveUserChart" width="250" height="40"></canvas>
                                </div>
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

                        <div class="card-body">
                            <h5 class="card-title">분기별 매출<span>&nbsp | &nbsp <%=today%></span></h5>

                            <div class="d-flex align-items-center">
                                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                    <i class="bi bi-calendar-check"></i>
                                </div>
                                <div class="ps-3">
                                    <%--매출 통계 데이터 삽입--%>
                                    <h6>&nbsp&nbsp 1234건</h6><canvas id="SalesChart" width="200" height="40"></canvas>
                                </div>
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

                        <div class="card-body">
                            <h5 class="card-title">난이도별 매출<span>&nbsp | &nbsp <%=today%></span></h5>

                            <div class="d-flex align-items-center">
                                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                    <i class="bi bi-calendar2-x"></i>
                                </div>
                                <div class="ps-3">
                                    <%--예약 통계데이터 삽입--%>
                                    <h6>&nbsp&nbsp424건</h6><canvas id="ReserveChart" width="250" height="40"></canvas>
                                </div>
                            </div>

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
                            <canvas id="barChart" <%--style="max-height: 400px;"--%> height="150"></canvas>

                        </div>
                    </div>
                </div><!-- End Reports -->
            </div>
        </div><!-- End Left side columns -->
    </div>
</section>
<script>
    //활성화 계정 통계 차트
    var ctx = document.getElementById("ActiveUserChart");
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
            responsive: false,
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
    });

    //전체 매출 통계 차트
    var ctx = document.getElementById("SalesChart");
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
    });

    //예약 통계 차트
    var ctx = document.getElementById("ReserveChart");
    var ReserveChart = new Chart(ctx, {
        type: 'horizontalBar',
        data: {
            labels: [],
            datasets: [{
                label: '활성',
                data: [80],
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
    });
    var ctx = document.getElementById("barChart");
    var barChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['전체 매출', '분기별 매출', '난이도별 매출'],
            datasets: [{
                label: '',
                data: [7, 12, 6],
                backgroundColor: "rgb(153,204,255)",
                borderColor: "rgb(153,204,255)",

            },
                {
                    label: '',
                    data: [0, 6, 3],
                    backgroundColor: "rgb(229,204,255)",
                    borderColor: "rgb(229,204,255)",
                },
                {
                    label: '',
                    data: [0, 8, 7],
                    backgroundColor: "rgb(255,229,204)",
                    borderColor: "rgb(255,229,204)",
                },
                {
                    label: '',
                    data: [0, 4, 0],
                    backgroundColor: "rgb(153,153,255)",
                    borderColor: "rgb(153,153,255)",
                }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            },
            responsive: true,
            title: {
                display: false,
                text: 'Report',
            },
            legend:{
                display : false
            }
        }
    });

</script>