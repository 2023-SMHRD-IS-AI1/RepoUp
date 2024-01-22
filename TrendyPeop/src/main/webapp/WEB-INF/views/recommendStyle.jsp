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
						<h4 class="mt-4">
							<i class="feather icon-thumbs-up m-r-5"></i> Style Recommend
						</h4>
						<hr>
					</div>
				</div>
				<!-- 이미지 출력 -->
				<div class="row">
					<div class="col">

						<%
						List<Style> recoList = (List<Style>) request.getAttribute("recoList");

						for (int i = 0; i < 10; i++) {
							int j = i * 5;
						%>

						<div class="card-deck">
							<c:forEach items="${recoList1 }" var="s" begin="<%=j %>"
								end="<%=j+4 %>" varStatus="status">
								<div class="card" id="max">
									<img data-toggle="modal" data-target="#item${status.index }"
										class="img-fluid card-img-top" src="${s.style_img_url}"
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
															src="${s.style_img_url}" alt="Card image cap">
													</div>
												</div>
											</div>
										</div>
										<button type="button" class="btn btn-icon btn-outline-primary"
											onclick="insertStyleHeart('${s.style_idx}', '${loginUser.user_id}')">
											<i class="feather icon-heart"></i>
										</button>
										<button type="button" class="btn btn-icon btn-outline-success"
											id="insertStyleHeart"
											onclick="insertStyleCloset('${s.style_idx}', '${loginUser.user_id}')">
											<i class="feather icon-briefcase"></i>
										</button>
										<button type="button" class="btn btn-icon btn-outline-info"
											onclick="location.href='${s.style_google}'">
											<i class="feather icon-search"></i>
										</button>
									</div>
								</div>
							</c:forEach>
						</div>
						<br>
						<br>
						<%
						}
						%>
					</div>
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

		<script>
			function insertStyleHeart(style_idx, user_id) {

				console.log('style_idx:', style_idx);
				console.log('user_id:', user_id);
				//Ajax로 전송
				$.ajax({
					url : './insertStyleHeart',
					data : {
						style_idx : style_idx,
						user_id : user_id
					},
					type : 'POST',
					dataType : 'json',
					success : function(result1) {
						if (result1.success) {
							pass;
						}
					}
				}); //End Ajax
			}

			function insertStyleCloset(style_idx, user_id) {

				console.log('style_idx:', style_idx);
				console.log('user_id:', user_id);
				//Ajax로 전송
				$.ajax({
					url : './insertCloset',
					data : {
						style_idx : style_idx,
						user_id : user_id
					},
					type : 'POST',
					dataType : 'json',
					success : function(result2) {
						if (result2.success) {
							pass;
						}
					}
				}); //End Ajax
			}
		</script>
</body>

</html>