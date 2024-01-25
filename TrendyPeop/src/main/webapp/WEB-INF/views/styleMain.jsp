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
								<li class="breadcrumb-item"><a href="goMain"><i class="feather icon-home"></i></a></li>
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
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-through-heart" viewBox="0 0 16 16">
                			<path fill-rule="evenodd" d="M2.854 15.854A.5.5 0 0 1 2 15.5V14H.5a.5.5 0 0 1-.354-.854l1.5-1.5A.5.5 0 0 1 2 11.5h1.793l.53-.53c-.771-.802-1.328-1.58-1.704-2.32-.798-1.575-.775-2.996-.213-4.092C3.426 2.565 6.18 1.809 8 3.233c1.25-.98 2.944-.928 4.212-.152L13.292 2 12.147.854A.5.5 0 0 1 12.5 0h3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-.854.354L14 2.707l-1.006 1.006c.236.248.44.531.6.845.562 1.096.585 2.517-.213 4.092-.793 1.563-2.395 3.288-5.105 5.08L8 13.912l-.276-.182a21.86 21.86 0 0 1-2.685-2.062l-.539.54V14a.5.5 0 0 1-.146.354l-1.5 1.5Zm2.893-4.894A20.419 20.419 0 0 0 8 12.71c2.456-1.666 3.827-3.207 4.489-4.512.679-1.34.607-2.42.215-3.185-.817-1.595-3.087-2.054-4.346-.761L8 4.62l-.358-.368c-1.259-1.293-3.53-.834-4.346.761-.392.766-.464 1.845.215 3.185.323.636.815 1.33 1.519 2.065l1.866-1.867a.5.5 0 1 1 .708.708L5.747 10.96Z" />
                			</svg>
							Style Main
						</h4>
					</div>
					<!-- 카테고리 버튼 -->
					<div class="col" style="margin-left: auto; margin-top: auto;">
						<div class="row" id="float">
							<div class="col-sm" style="padding: inherit">
								<div class="btn-group-sm mb-2 mr-2">
									<button class="btn btn-sm btn-outline-primary dropdown-toggle"
										type="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">Category</button>
									<div class="dropdown-menu dropdown-menu-right">
										<a class="dropdown-item" href="filterStyleCate?style_cate=청바지">청바지</a>
										<a class="dropdown-item" href="filterStyleCate?style_cate=셔츠">셔츠</a>
										<a class="dropdown-item" href="filterStyleCate?style_cate=코트">코트</a>
										<a class="dropdown-item" href="filterStyleCate?style_cate=캐주얼상의">캐주얼상의</a>
										<a class="dropdown-item" href="filterStyleCate?style_cate=팬츠">팬츠</a>
										<a class="dropdown-item" href="filterStyleCate?style_cate=블라우스">블라우스</a>
										<a class="dropdown-item" href="filterStyleCate?style_cate=스커트">스커트</a>
										<a class="dropdown-item" href="filterStyleCate?style_cate=니트웨어">니트웨어</a>
										<a class="dropdown-item" href="filterStyleCate?style_cate=재킷">재킷</a>
										<a class="dropdown-item" href="filterStyleCate?style_cate=베스트">베스트</a>
										<a class="dropdown-item" href="filterStyleCate?style_cate=점퍼">점퍼</a>
										<a class="dropdown-item" href="filterStyleCate?style_cate=패딩">패딩</a>
										<a class="dropdown-item" href="filterStyleCate?style_cate=탑">탑</a>
									</div>
								</div>
							</div>
							<div class="col-sm" style="padding: inherit">
								<div class="btn-group-sm mb-2 mr-2">
									<button class="btn btn-sm btn-outline-primary dropdown-toggle"
										type="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">Color</button>
									<div class="dropdown-menu dropdown-menu-right">
										<a class="dropdown-item" href="filterStyleColor?style_color=블랙">블랙</a>
										<a class="dropdown-item" href="filterStyleColor?style_color=화이트">화이트</a>
										<a class="dropdown-item" href="filterStyleColor?style_color=브라운">브라운</a>
										<a class="dropdown-item" href="filterStyleColor?style_color=그레이">그레이</a>
										<a class="dropdown-item" href="filterStyleColor?style_color=베이지">베이지</a>
										<a class="dropdown-item" href="filterStyleColor?style_color=블루">블루</a>
										<a class="dropdown-item" href="filterStyleColor?style_color=네이비">네이비</a>
										<a class="dropdown-item" href="filterStyleColor?style_color=카키">카키</a>
										<a class="dropdown-item" href="filterStyleColor?style_color=스카이블루">스카이블루</a>
										<a class="dropdown-item" href="filterStyleColor?style_color=라벤더">라벤더</a>
										<a class="dropdown-item" href="filterStyleColor?style_color=민트">민트</a>
										<a class="dropdown-item" href="filterStyleColor?style_color=레드">레드</a>
										<a class="dropdown-item" href="filterStyleColor?style_color=오렌지">오렌지</a>
										<a class="dropdown-item" href="filterStyleColor?style_color=옐로우">옐로우</a>
										<a class="dropdown-item" href="filterStyleColor?style_color=핑크">핑크</a>
										<a class="dropdown-item" href="filterStyleColor?style_color=퍼플">퍼플</a>
										<a class="dropdown-item" href="filterStyleColor?style_color=그린">그린</a>
									</div>
								</div>
							</div>
							<div class="col-sm" style="padding: inherit">
								<div class="btn-group-sm mb-2 mr-2">
									<button class="btn btn-sm btn-outline-primary dropdown-toggle"
										type="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">Style</button>
									<div class="dropdown-menu dropdown-menu-right">
										<a class="dropdown-item" href="filterStyleTag?style_tag=캐주얼">캐주얼</a>
										<a class="dropdown-item" href="filterStyleTag?style_tag=밀리터리">밀리터리</a>
										<a class="dropdown-item" href="filterStyleTag?style_tag=페미닌">페미닌</a>
										<a class="dropdown-item" href="filterStyleTag?style_tag=오피스룩">오피스룩</a>
										<a class="dropdown-item" href="filterStyleTag?style_tag=마린">마린</a>
										<a class="dropdown-item" href="filterStyleTag?style_tag=펑크">펑크</a>
										<a class="dropdown-item" href="filterStyleTag?style_tag=복고">복고</a>
										<a class="dropdown-item" href="filterStyleTag?style_tag=프레피">프레피</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 이미치 출력 -->
				<div class="row">
					<div class="col">
						<hr>
						<%
						List<Style> styleList = (List<Style>) request.getAttribute("styleList");

						for (int i = 0; i <= (styleList.size() / 5 + 1); i++) {
							int j = i * 5;
						%>
						<div class="card-deck">
							<c:forEach items="${styleList }" var="s" begin="<%=j %>" end="<%=j+4 %>" varStatus="status">
								<div class="card" id="max">
									<img data-toggle="modal" data-target="#item${status.index }" class="img-fluid card-img-top" src="${s.style_img_url}" alt="Card image cap">
									<div class="card-footer">
										<div class="modal fade bd-example-modal-lg" id="item${status.index }" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">
													<div class="modal-body">
														<button type="button" class="close" data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
														<img class="img-fluid card-img-top" src="${s.style_img_url}" alt="Card image cap">
													</div>
												</div>
											</div>
										</div>
										<% if (loginUser == null) { %>
										<button type="button" class="btn btn-icon btn-outline-primary" onclick="user()">
											<i class="feather icon-heart"></i>
										</button>
										<button type="button" class="btn btn-icon btn-outline-success" onclick="user()">
											<i class="feather icon-briefcase"></i>
										</button>
										<button type="button" class="btn btn-icon btn-outline-info"
											onclick="location.href='${s.style_google}'">
											<i class="feather icon-search"></i>
										</button>
										<% } else { %>
										<button type="button" class="btn btn-icon btn-outline-primary"
											onclick="insertStyleHeart('${s.style_idx}', '${loginUser.user_id}')">
											<i class="feather icon-heart"></i>
										</button>
										<button type="button" class="btn btn-icon btn-outline-success" id="insertStyleHeart"
											onclick="insertStyleCloset('${s.style_idx}', '${loginUser.user_id}')">
											<i class="feather icon-briefcase"></i>
										</button>
										<button type="button" class="btn btn-icon btn-outline-info" id="insertStyleCloset"
											onclick="location.href='${s.style_google}'">
											<i class="feather icon-search"></i>
										</button>
										<% } %>
									</div>
								</div>
							</c:forEach>
						</div>
						<br><br>
						<% } %>
					</div>
				</div>
				<!-- 이미지 출력 끝 -->
			</div>
			<!-- 컨텐츠 영역 끝 -->
			<button type="button" class="btn btn-icon btn-primary" id="scrollToTopBtn">
				<a href="#" style="color: white;"><i class="feather icon-arrow-up"></i></a>
			</button>
		</div>
	</div>
	
	<script>
		function user() {
			alert("로그인후 사용 가능합니다.")
		}
	</script>
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