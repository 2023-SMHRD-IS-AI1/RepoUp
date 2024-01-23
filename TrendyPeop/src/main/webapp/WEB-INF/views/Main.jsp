<%@page import="com.trendypeop.myapp.entity.Keyword"%>
<%@page import="com.trendypeop.myapp.entity.Cody"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>TrendyPeop</title>
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />

<!-- Favicon icon -->
<link rel="icon" href="resources/assets/images/favicon.png"
	type="image/x-icon">

<!-- vendor css -->
<link rel="stylesheet" href="resources/assets/css/style.css">
<link rel="stylesheet" href="resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="resources/assets/css/owl.theme.default.min.css">

<!-- 데이터 분석 그래프 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- 색상분석 파이차트 -->

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
/* Add custom styles for the chart text here */
.chart-title {
	font-family: Arial, sans-serif;
	font-size: 18px;
	font-weight: bold;
	color: #333;
}

.chart-legend {
	font-family: Arial, sans-serif;
	font-size: 14px;
	color: #666;
}
</style>

</head>

<body class="">

	<%@include file="./nav.jsp"%>
	<%
	Keyword keywordList = (Keyword) request.getAttribute("keywordList");
	%>


	<!-- [ Main Content ] start -->
	<div class="pcoded-main-container">
		<div class="pcoded-content">
			<!-- [ breadcrumb ] start -->
			<div class="page-header">
				<div class="page-block">
					<div class="row align-items-center">
						<div class="col-md-12">
							<div class="page-header-title">
								<h5 class="m-b-10">Fashion Trend Dashboard</h5>
							</div>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="goMain"><i
										class="feather icon-home"></i></a></li>
								<li class="breadcrumb-item"><a>TrendyPeop</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- [ breadcrumb ] end -->
			<!-- [ Main Content ] start -->
			<div class="row">
				<div class="col">
					<div class="card support-bar full">
						<div class="row" style="padding: inherit;">
							<div class="col">
								<div class="card">
									<div class="card-header">
										<h4 class="mt-4">Best Cody!</h4>
									</div>
									<%
									List<Cody> bestCody = (List<Cody>) request.getAttribute("bestCody");
									%>
									<div class="cardbody"
										style="padding: 40px 40px 30px 40px; margin: 0 10%;">
										<div class="bestCody">
											<div class="owl-carousel owl-theme owl-loaded">
												<div class="owl-stage-outer">
													<div class="owl-stage" style="height: 50% !important;">

														<div class="owl-item">
															<a
																href="goCodyDetail?cody_idx=<%=bestCody.get(0).getCody_idx()%>"
																class=""><img
																src="<%=bestCody.get(0).getCody_img_url()%>"></a>
														</div>
														<div class="owl-item">
															<a
																href="goCodyDetail?cody_idx=<%=bestCody.get(1).getCody_idx()%>"
																class=""><img
																src="<%=bestCody.get(1).getCody_img_url()%>"></a>
														</div>
														<div class="owl-item">
															<a
																href="goCodyDetail?cody_idx=<%=bestCody.get(2).getCody_idx()%>"
																class=""><img
																src="<%=bestCody.get(2).getCody_img_url()%>"></a>
														</div>
														<div class="owl-item">
															<a
																href="goCodyDetail?cody_idx=<%=bestCody.get(3).getCody_idx()%>"
																class=""><img
																src="<%=bestCody.get(3).getCody_img_url()%>"></a>
														</div>
														<div class="owl-item">
															<a
																href="goCodyDetail?cody_idx=<%=bestCody.get(4).getCody_idx()%>"
																class=""><img
																src="<%=bestCody.get(4).getCody_img_url()%>"></a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row" style="padding: inherit;">
							<div class="col-5">
								<div class="card">
									<div class="card-header">
										<h4 class="mt-3">2023년 12월 Best Color</h4>
									</div>
									<div class="card-body">
										<div style="width: 70%; height: 70%; margin: auto;">
											<canvas id="colorTrendChart"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div class="col-7">
								<div class="card">
									<div class="card-header">
										<h4 class="mt-4">패션 검색어 트렌드</h4>
									</div>
									<div class="card-body" style="margin: auto;">
										<div style="width: 700px; height: 400px;">
											<canvas id='myChart'></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row" style="padding: inherit;">
							<div class="col-7">
								<%
								List<Keyword> article_list = (List<Keyword>) request.getAttribute("article_list");
								%>
								<div class="card">
									<div class="card-header">
										<h4 class="mt-3">Fashion News</h4>
									</div>
									<div class="card-body">
										<% for (int i = 0; i < 5; i++) { %>
										<a style="color: black;" href="<%=article_list.get(i).getNews_url()%>"><%=article_list.get(i).getNews_title()%></a>
										<hr>
										<% } %>
									</div>
								</div>
							</div>
							<%	List<Cody> randomCody = (List<Cody>) request.getAttribute("randomCody"); %>
							
							<div class="col-5">
								<div class="card">
									<div class="card-header">
										<h4 class="mt-3">오늘의 코디 추천</h4>
									</div>
									<div class="card-body">
									
									<button type="button" class="btn btn-outline-info" id="float"
											style="margin-left: auto; margin-top: auto;"
											onclick="location.href='goCodyDetail?cody_idx=<%= randomCody.get(0).getCody_idx() %>'">
											<!-- <i class="feather icon-search"></i> -->추천 코디
										</button>
										
									</div>
								</div>
							</div>
							
							
						</div>
					</div>
				</div>
			</div>
			<!-- [ Main Content ] end -->
			<button type="button" class="btn btn-icon btn-primary"
				id="scrollToTopBtn">
				<a href="#" style="color: white;"><i
					class="feather icon-arrow-up"></i></a>
			</button>
		</div>
	</div>
	<!-- [ Main Content ] end -->


	<!-- 색상분석 파이차트 -->
	<script>
		var ctx = document.getElementById('colorTrendChart').getContext('2d');
		var colorTrendChart = new Chart(ctx, {
			type : 'pie',
			data: {
	            labels: ['Pink', 'Light Blue', 'Blue', 'Brown', 'Navy'],
	            datasets: [{
	                label: '색상 트렌드 비율',
	                data: [21.7, 15.8, 14.7, 14.0, 12.4],
	                backgroundColor: [
	                    'rgba(255, 192, 203, 1)', // Pink
	                    'rgba(173, 216, 230, 1)', // Light Blue  
	                    'rgba(0, 105, 180, 1)', // Blue
	                    'rgba(139, 69, 19, 1)', // Brown
	                    'rgba(0, 0, 128, 1)' // Navy
	                ],
	                borderColor: [
	                    'rgba(255, 192, 203, 1)',
	                    'rgba(173, 216, 230, 1)',
	                    'rgba(0, 105, 180, 1)',
	                    'rgba(139, 69, 19, 1)',
	                    'rgba(0, 0, 128, 1)', 
	                ],
	                borderWidth: 1
	            }]
	        },
			options : {
				responsive : true,
				maintainAspectRatio : true,
				plugins : {
					/* title : {
						display : true,
						text : ' 트렌디 컬러 TOP5 ', 
						position : 'top',
						font : {
							size : 25,
							family : 'Arial, sans-serif',
							weight : 'bold',
							style : 'italic'
						}
					}, */
					legend : {
						display : true,
						position : 'bottom',
						labels : {
							font : {
								size : 14,
								family : 'Arial, sans-serif'
							}
						}
					},
					tooltip : {
						callbacks : {
							label : function(context) {
								var label = context.label || '';
								if (label) {
									label += ': ';
								}
								if (context.parsed !== null) {
									label += new Intl.NumberFormat('en-US', {
										style : 'percent',
										minimumFractionDigits : 1
									}).format(context.parsed / 100);
								}
								return label;
							}
						}
					}
				}
			}
		});
	</script>

	<!-- Required Js -->
	<script src="resources/assets/js/vendor-all.min.js"></script>
	<script src="resources/assets/js/plugins/bootstrap.min.js"></script>
	<script src="resources/assets/js/ripple.js"></script>
	<script src="resources/assets/js/pcoded.min.js"></script>
	<script src="resources/assets/js/owl.carousel.min.js"></script>


	<!-- Apex Chart -->
	<script src="resources/assets/js/plugins/apexcharts.min.js"></script>


	<!-- Best Cody 슬라이드 -->
	<!-- custom-chart js -->
	<script src="resources/assets/js/pages/dashboard-main.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			var owl = $('.owl-carousel');

			owl.owlCarousel({
				items : 3, // 한번에 보여줄 아이템 수
				loop : true, // 반복여부
				margin : 100, // 오른쪽 간격
				autoplay : true, // 자동재생 여부
				autoplayTimeout : 3200, // 재생간격
				autoplayHoverPause : false,
				
				navigation : false,
				navigationText : [ "prev", "next" ],

				//Pagination
				pagination : false
				
			});

			$('.customNextBtn').click(function() {
				owl.trigger('next.owl.carousel');
			})

			$('.customPrevBtn').click(function() {
				owl.trigger('prev.owl.carousel', [ 300 ]);
			})
		});
	</script>

	<!-- 패션 검색어 트렌드 -->
	<script>
	const canvasArea = document.getElementById('myChart').getContext('2d');
	const myChart = new Chart(canvasArea, {
									type: 'bar',
									data: {
											labels: ['<%=keywordList.getTop1()%>', '<%=keywordList.getTop2()%>', '<%=keywordList.getTop3()%>', 
													'<%=keywordList.getTop4()%>', '<%=keywordList.getTop5()%>', '<%=keywordList.getTop6()%>', 
													'<%=keywordList.getTop7()%>', '<%=keywordList.getTop8()%>', '<%=keywordList.getTop9()%>', 
													'<%=keywordList.getTop10()%>' ],
				datasets : [ {
					label : 'Daily Search',
					data : [
	<%=keywordList.getTop1_rate()%>
		,
	<%=keywordList.getTop2_rate()%>
		,
	<%=keywordList.getTop3_rate()%>
		,
	<%=keywordList.getTop4_rate()%>
		,
	<%=keywordList.getTop5_rate()%>
		,
	<%=keywordList.getTop6_rate()%>
		,
	<%=keywordList.getTop7_rate()%>
		,
	<%=keywordList.getTop8_rate()%>
		,
	<%=keywordList.getTop9_rate()%>
		,
	<%=keywordList.getTop10_rate()%>
		],
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)' ],
					borderWidth : 1
				} ]
			},
			options : {
				maintainAspectRatio : false,
				scales : {
					y : {
						beginAtZero : true,
						max : 120,
						ticks : {
							stepSize : 15
						}
					}
				}
			}
		});
	</script>
</body>

</body>