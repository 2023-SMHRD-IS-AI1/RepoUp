<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			
			<!-- 이미지 나열 -->
			<!-- 헤더 -->
			<div class="row">
				<div class="card support-bar overflow-hidden">
					<div class="col-xl-12">
                        <h4 class="mt-4 text-center">Like It</h4>
                        <button type="button" class="btn btn-sm btn-outline-primary" 
                        onclick="location.href='golikeStyle'">Item</button>
                        <button type="button" class="btn btn-sm btn-outline-primary"
                        onclick="location.href='golikeCody'">Cody</button>
                        <hr>
						<!-- 첫번째줄 -->
						<div class="card-deck">
							<div class="card">
								<img class="img-fluid card-img-top" src="resources/assets/images/의상 이미지/코디맵/l_3_2024010811172600000000678.jpg"
									alt="Card image cap">
								<div class="card-body">
									<h5 class="card-title">코디 이름</h5>
								</div>
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
								</div>
							</div>
							<div class="card">
								<img class="img-fluid card-img-top" src="resources/assets/images/의상 이미지/코디맵/l_3_2024010811172900000032724.jpg"
									alt="Card image cap">
								<div class="card-body">
									<h5 class="card-title">코디 이름</h5>
								</div>
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
								</div>
							</div>
							<div class="card">
								<img class="img-fluid card-img-top" src="resources/assets/images/의상 이미지/코디맵/l_3_2024010811172900000032724.jpg"
									alt="Card image cap">
								<div class="card-body">
									<h5 class="card-title">코디 이름</h5>
								</div>
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
								</div>
							</div>
							<div class="card">
								<img class="img-fluid card-img-top" src="resources/assets/images/의상 이미지/코디맵/l_3_2024010811200700000019599.jpg"
									alt="Card image cap">
								<div class="card-body">
									<h5 class="card-title">코디 이름</h5>
								</div>
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
								</div>
							</div>
							<div class="card">
								<img class="img-fluid card-img-top" src="resources/assets/images/의상 이미지/코디맵/l_3_2024010811201000000023455.jpg"
									alt="Card image cap">
								<div class="card-body">
									<h5 class="card-title">코디 이름</h5>
								</div>
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
								</div>
							</div>
						</div>
						
						<!-- 페이지 이동 -->
						<hr>
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link" href="#!" aria-label="Previous"><span
										aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a>
							</li>
							<li class="page-item"><a class="page-link" href="#!">1</a></li>
							<li class="page-item"><a class="page-link" href="#!">2</a></li>
							<li class="page-item"><a class="page-link" href="#!">3</a></li>
							<li class="page-item"><a class="page-link" href="#!" aria-label="Next"><span
										aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a></li>
						</ul>
					</div>
				</div>
			</div>

			<!-- 이미지 나열 끝 -->
			
		</div>
	</div>
	<!-- [ Main Content ] end -->


	<!-- Required Js -->
	<script src="resources/assets/js/vendor-all.min.js"></script>
	<script src="resources/assets/js/plugins/bootstrap.min.js"></script>
	<script src="resources/assets/js/ripple.js"></script>
	<script src="resources/assets/js/pcoded.min.js"></script>

	<!-- Apex Chart -->
	<script src="resources/assets/js/plugins/apexcharts.min.js"></script>


	<!-- custom-chart js -->
	<script src="resources/assets/js/pages/dashboard-main.js"></script>
</body>

</html>