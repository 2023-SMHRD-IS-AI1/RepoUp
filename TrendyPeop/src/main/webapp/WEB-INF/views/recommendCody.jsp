<%@page import="com.trendypeop.myapp.entity.Cody"%>
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
<link rel="icon" href="resources/assets/images/favicon.png" type="image/x-icon">

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
								<li class="breadcrumb-item"><a href="goMain">
								<i class="feather icon-home"></i></a></li>
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
							<i class="feather icon-thumbs-up m-r-5"></i> Cody recommend
						</h4>
						<hr>
					</div>
				</div>
				<!-- 이미지 업로드 -->
				<div class="row">
					<div class="col">
						<%
						List<Cody> recoList = (List<Cody>) request.getAttribute("recoList");

						for (int i = 0; i < 10; i++) {
							int j = i * 5;
						%>

						<div class="card-deck">
							<c:forEach items="${recoList }" var="c" begin="<%=j %>" end="<%=j+4 %>" varStatus="status">
								<div class="card" id="max">
									<a href="goCodyDetail?cody_idx=${c.cody_idx }"> 
									<img class="img-fluid card-img-top" src="${c.cody_img_url}" alt="Card image cap">
									</a>
									<div class="card-body">
										<h5 class="card-title">${c.cody_name }</h5>
									</div>
									<div class="card-footer">
										<button type="button" class="btn btn-icon btn-outline-primary" onclick="insertCodyHeart('${c.cody_idx}', '${loginUser.user_id}')">
											<i class="feather icon-heart"></i>
										</button>
									</div>
								</div>
							</c:forEach>
						</div>
						<br><br>
						<% } %>
					</div>
				</div>
				<!-- 이미지 업로드 끝 -->
			</div>
			<!-- 컨텐츠 영역 끝 -->
			<button type="button" class="btn btn-icon btn-primary" id="scrollToTopBtn">
				<a href="#" style="color: white;"><i class="feather icon-arrow-up"></i></a>
			</button>
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
		function insertCodyHeart(cody_idx, user_id) {

			console.log('cody_idx:', cody_idx);
			console.log('user_id:', user_id);
			//Ajax로 전송
			$.ajax({
				url : './insertCodyHeart',
				data : {
					cody_idx : cody_idx,
					user_id : user_id
				},
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					if (result.success) {
						pass;
					}
				}
			}); //End Ajax
		}
	</script>

</body>

</html>