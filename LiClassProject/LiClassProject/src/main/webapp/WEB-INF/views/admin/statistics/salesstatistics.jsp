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
                            <c:forEach items="${allSaleList}" var="sales" varStatus="type">
                                <input type="hidden" id="${type.index+1}_type" name="allSales_sales" value="${sales}">
                            </c:forEach>

                            <div class="d-flex align-items-center">

                                <div class="ps-3">
                                    <%--전체 매출 데이터 삽입--%>
                                    <h6 style="font-size: 20px;">총 매출 : ${allSaleList[0]-allSaleList[1]} <br />
                                        환불 금액 : ${allSaleList[1]}
                                    </h6>
                                </div>
                            </div>
                            <div class="progress mt-4">
                                <div id="userBar1" class="progress-bar bg-success progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                <div id="userBar2" class="progress-bar  bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
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

                                <div class="ps-3">
                                    <%--분기별매출 현황--%>
                                        <c:forEach items="${salesList}" var="sales" varStatus="quarter">
                                            <input type="hidden" id="${quarter.index+1}_quarter" name="quarter_sales" value="${sales}">
                                        </c:forEach>
                                    <h6 style="font-size: 20px;">${salesList[0]} / ${salesList[1]} <br/>
                                        ${salesList[2]} / ${salesList[3]}
                                    </h6>
                                </div>
                            </div>
                            <div class="progress mt-4 ">
                                <div id="userBar1" class="progress-bar bg-success progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                <div id="userBar2" class="progress-bar  bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
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
                                <div class="ps-3">
                                    <c:forEach items="${levelList}" var="level" varStatus="level_sales">
                                        <input type="hidden" id="${level_sales.index+1}level" name="quarter_sales" value="${level}">
                                    </c:forEach>
                                    <%--난이도별 매출 데이터 입력--%>
                                    <h6 style="font-size: 20px;">상 : ${levelList[1]} <br/>
                                        중 : ${levelList[0]}<br/>
                                        하 : ${levelList[2]}
                                    </h6>
                                </div>
                            </div>
                            <div class="progress mt-1">
                                <div id="userBar1" class="progress-bar bg-success progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                <div id="userBar2" class="progress-bar  bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
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
                            <%--분기별 매출 출력--%>

                            <!-- Line Chart -->
                            <%--차트 통계데이터 기반으로 삽입--%>
                            <canvas id="barChart" <%--style="max-height: 400px;"--%> height="150"></canvas>
                            <%--난이도별 매출 출력--%>

                        </div>
                    </div>
                </div><!-- End Reports -->
            </div>
        </div><!-- End Left side columns -->
    </div>
</section>
<script>
    const allSales_data = ${allSaleList[0]-allSaleList[1]}
    const allSales_data2 = document.getElementById("2_type").value;
    const quarter_data_1 = document.getElementById("1_quarter").value;
    const quarter_data_2 = document.getElementById("2_quarter").value;
    const quarter_data_3 = document.getElementById("3_quarter").value;
    const quarter_data_4 = document.getElementById("4_quarter").value;
    const level_data_1 = document.getElementById("1level").value;
    const level_data_2 = document.getElementById("2level").value;
    const level_data_3 = document.getElementById("3level").value;

    var ctx = document.getElementById("barChart");
    var barChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['전체 매출', '분기별 매출', '난이도별 매출'],
            datasets: [{
                label: '',
                data: [allSales_data, quarter_data_1, level_data_2],
                backgroundColor: "rgb(153,204,255)",
                borderColor: "rgb(153,204,255)",

            },
                {
                    label: '',
                    data: [0, quarter_data_2, level_data_1],
                    backgroundColor: "rgb(229,204,255)",
                    borderColor: "rgb(229,204,255)",
                },
                {
                    label: '',
                    data: [0, quarter_data_3, level_data_3],
                    backgroundColor: "rgb(255,229,204)",
                    borderColor: "rgb(255,229,204)",
                },
                {
                    label: '',
                    data: [0, quarter_data_4, 0],
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