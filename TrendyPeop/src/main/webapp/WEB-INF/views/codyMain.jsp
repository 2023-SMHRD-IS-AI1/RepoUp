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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
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
	
<%@include file="./nav.jsp" %>
	
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
								<li class="breadcrumb-item"><a href="goMain"><i class="feather icon-home"></i></a></li>
								<li class="breadcrumb-item"><a>TrendyPeop</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- [ breadcrumb ] end -->

			<!-- 이미지 나열 -->
			<div class="row">
				<div class="card support-bar overflow-hidden">
					<div class="col-xl-12 ">
						<h4 class="mt-4">
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-through-heart-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M2.854 15.854A.5.5 0 0 1 2 15.5V14H.5a.5.5 0 0 1-.354-.854l1.5-1.5A.5.5 0 0 1 2 11.5h1.793l3.103-3.104a.5.5 0 1 1 .708.708L4.5 12.207V14a.5.5 0 0 1-.146.354l-1.5 1.5ZM16 3.5a.5.5 0 0 1-.854.354L14 2.707l-1.006 1.006c.236.248.44.531.6.845.562 1.096.585 2.517-.213 4.092-.793 1.563-2.395 3.288-5.105 5.08L8 13.912l-.276-.182A23.825 23.825 0 0 1 5.8 12.323L8.31 9.81a1.5 1.5 0 0 0-2.122-2.122L3.657 10.22a8.827 8.827 0 0 1-1.039-1.57c-.798-1.576-.775-2.997-.213-4.093C3.426 2.565 6.18 1.809 8 3.233c1.25-.98 2.944-.928 4.212-.152L13.292 2 12.147.854A.5.5 0 0 1 12.5 0h3a.5.5 0 0 1 .5.5v3Z"/>
                              </svg>
							Cody Main
						</h4>
						<hr>
						<%
							List<Cody> codyList = (List<Cody>) request.getAttribute("codyList");
		                  
	                  		for(int i=0;i<=(codyList.size()/5+1);i++) {
	                    	int j = i*5;
                		%>
						
						<div class="card-deck">
 						<c:forEach items="${codyList }" var="c" begin="<%=j %>"
                        end="<%=j+4 %>">
							<div class="card">
								<a href="goCodyDetail?cody_idx=${c.cody_idx }">
								<img class="img-fluid card-img-top" src="${c.cody_img_url}"
									alt="Card image cap">
								</a>
								<div class="card-body">
									<h5 class="card-title">${c.cody_name }</h5>
								</div>
								<div class="card-footer">
									<!-- 여기도 마찬가지, 좋아요 눌렀으면 btn-, 안눌렀으면 btn-outline-(빈하트) -->
									<button type="button" class="btn btn-icon btn-outline-primary" onclick="location.href='insertCodyHeart?cody_idx=${c.cody_idx }&user_id=${loginUser.user_id}'"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-outline-info" onclick="location.href='goCodyDetail?cody_idx=${c.cody_idx }'"><i
                                 	class="feather icon-search"></i></button>
								</div>
							</div>
							
							</c:forEach>
						</div>
						<br><br>
				<% } %>
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