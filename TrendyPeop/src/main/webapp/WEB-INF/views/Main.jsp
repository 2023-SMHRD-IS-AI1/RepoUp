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

</head>

<body class="">

	<%@include file="./nav.jsp"%>

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
										<h4 class="mt-4">2024 01 Best!</h4>
									</div>
									<%
									List<Cody> bestCody = (List<Cody>) request.getAttribute("bestCody");
									%>

									<div class="bestCody" style="background-color: #f3f3f3;">
										<div class="owl-carousel owl-theme owl-loaded">
											<div class="owl-stage-outer">
												<div class="owl-stage">

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
						<br> <br>
					</div>
				</div>
			</div>
			<!-- [ Main Content ] end -->
		</div>
	</div>
	<!-- [ Main Content ] end -->


	<!-- Warning Section start -->
	<!-- Older IE warning message -->
	<!--[if lt IE 11]>
        <div class="ie-warning">
            <h1>Warning!!</h1>
            <p>You are using an outdated version of Internet Explorer, please upgrade
               <br/>to any of the following web browsers to access this website.
            </p>
            <div class="iew-container">
                <ul class="iew-download">
                    <li>
                        <a href="http://www.google.com/chrome/">
                            <img src="assets/images/browser/chrome.png" alt="Chrome">
                            <div>Chrome</div>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.mozilla.org/en-US/firefox/new/">
                            <img src="assets/images/browser/firefox.png" alt="Firefox">
                            <div>Firefox</div>
                        </a>
                    </li>
                    <li>
                        <a href="http://www.opera.com">
                            <img src="assets/images/browser/opera.png" alt="Opera">
                            <div>Opera</div>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.apple.com/safari/">
                            <img src="assets/images/browser/safari.png" alt="Safari">
                            <div>Safari</div>
                        </a>
                    </li>
                    <li>
                        <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                            <img src="assets/images/browser/ie.png" alt="">
                            <div>IE (11 & above)</div>
                        </a>
                    </li>
                </ul>
            </div>
            <p>Sorry for the inconvenience!</p>
        </div>
    <![endif]-->
	<!-- Warning Section Ends -->

	<!-- Required Js -->
	<script src="resources/assets/js/vendor-all.min.js"></script>
	<script src="resources/assets/js/plugins/bootstrap.min.js"></script>
	<script src="resources/assets/js/ripple.js"></script>
	<script src="resources/assets/js/pcoded.min.js"></script>
	<script src="resources/assets/js/owl.carousel.min.js"></script>


	<!-- Apex Chart -->
	<script src="resources/assets/js/plugins/apexcharts.min.js"></script>


	<!-- custom-chart js -->
	<script src="resources/assets/js/pages/dashboard-main.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			var owl = $('.owl-carousel');

			owl.owlCarousel({
				items : 3, // 한번에 보여줄 아이템 수
				loop : true, // 반복여부
				margin : 35, // 오른쪽 간격
				autoplay : true, // 자동재생 여부
				autoplayTimeout : 1800, // 재생간격
				autoplayHoverPause : false,

			    navigation : true,
			    navigationText : ["prev","next"],
			    
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
</body>
	
</body>