<%@page import="com.trendypeop.myapp.entity.Style"%>
<%@page import="java.util.List"%>
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

			<!-- 컨텐츠 영역 -->
			<div class="card support-bar full">
				<!-- 헤더 -->
				<div class="row">
					<div class="col">
						<h4 class="mt-4 text-center">
							<!-- <i class="feather icon-briefcase m-r-5"></i> -->
							My Closet
						</h4>
						<hr>
					</div>
				</div>
				
				<!-- 이미지 출력 -->
				<div class="row">
					<div class="col">
						<%
						List<Style> myClosetList = (List<Style>) request.getAttribute("myClosetList");

						for (int i = 0; i <= (myClosetList.size() / 5 + 1); i++) {
							int j = i * 5;
						%>
						<div class="card-deck">
							<c:forEach items="${myClosetList }" var="c" begin="<%=j %>"
								end="<%=j+4 %>" varStatus="status">

								<div class="card" id="max">
									<img data-toggle="modal" data-target="#item${status.index }"
										class="img-fluid card-img-top" src="${c.style_img_url}"
										alt="Card image cap">
									<div class="card-footer">
										<div class="modal fade bd-example-modal-lg"
											id="item${status.index }" tabindex="-1" role="dialog"
											aria-labelledby="myLargeModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">
													<div class="modal-body">
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
														<img class="img-fluid card-img-top"
															src="${c.style_img_url}" alt="Card image cap">
													</div>
												</div>
											</div>
										</div>
										<button type="button" class="btn btn-icon btn-success"
											onclick="location.href='deleteCloset?style_idx=${c.style_idx }&user_id=${loginUser.user_id}'">
											<i class="feather icon-briefcase"></i>
										</button>
									</div>
								</div>
							</c:forEach>
						</div>
						<br><br>
						<%
						}
						%>
					</div>
				</div>
				<!-- 이미지 출력 끝 -->
				<!-- 페이지 이동 -->
				<div class="row">
					<div class="col">
						<!-- <hr>
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link" href="#!"
								aria-label="Previous"><span aria-hidden="true">&laquo;</span><span
									class="sr-only">Previous</span></a></li>
							<li class="page-item"><a class="page-link" href="#!">1</a></li>
							<li class="page-item"><a class="page-link" href="#!">2</a></li>
							<li class="page-item"><a class="page-link" href="#!">3</a></li>
							<li class="page-item"><a class="page-link" href="#!"
								aria-label="Next"><span aria-hidden="true">&raquo;</span><span
									class="sr-only">Next</span></a></li>
						</ul> -->
					</div>
				</div>
				<!-- 페이지 이동 끝 -->
			</div>
			<!-- 컨텐츠 영역 끝 -->
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