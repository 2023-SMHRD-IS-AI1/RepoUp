
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.trendypeop.myapp.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
.pantone-section {
	overflow-x: auto; /* 오른쪽으로 스크롤 가능하도록 설정 */
}

.pantone-images {
	display: flex;
	justify-content: flex-start;
	overflow-x: hidden; /* 스크롤 바 숨김 */
	width: 100%;
	/* 기존 스타일 유지 */
}

.pantone-image-container {
	width: calc(100%/ 6); /* 전체 너비의 1/6 */
	flex-shrink: 0; /* 이미지 크기 유지 */
	display: inline-block;
	position: relative;
}

.pantone-image {
	width: 100%; /* 이미지 컨테이너에 맞게 크기 조정 */
	height: auto;
	display: inline-block;
	cursor: pointer;
}

.year-label {
	display: none; /* Hide by default */
	position: absolute;
	bottom: 5px;
	left: 50%;
	transform: translateX(-50%);
	background-color: rgba(0, 0, 0, 0.7);
	color: white;
	padding: 5px;
	border-radius: 5px;
}

.pantone-title {
	display: block; /* Change to block-level element for centering */
	text-align: center; /* Center the text horizontally */
	font-weight: bold; /* Make the text bold */
	font-size: 15px; /* Optional: Adjust the font size as needed */
	margin-top: 5px; /* Optional: Adjust top margin */
	margin-bottom: 5px; /* Optional: Adjust bottom margin */
}

.pantone-image-container:hover .year-label, .pantone-image-container:active .year-label
	{
	display: block; /* Show on hover */
}

.pantone-section {
	position: relative;
	width: 100%; /* 전체 너비 사용 */
}

.pantone-image-container {
	display: inline-block;
	width: 100%; /* 전체 너비 사용 */
}

.pantone-image {
	width: 150px; /* Increased size */
	height: auto;
	display: inline-block;
	cursor: pointer;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	/* Smooth transition for emphasis */
}

.pantone-image:active {
	transform: scale(1.1); /* Scale up the image when clicked */
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.3); /* Add shadow for emphasis */
}
</style>

<script>
  var style = document.createElement('style');
  style.innerHTML = `
    body {
      font-family: "Open Sans", sans-serif;
      ...
    }
  `;
  document.head.appendChild(style);
</script>

</head>
<body>

	<%
	User loginUser = (User) session.getAttribute("loginUser");
	Date date = new Date();
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM");
	String month = simpleDateFormat.format(date);
	String season;

	if (month.equals("01") || month.equals("02") || month.equals("03") || month.equals("04") || month.equals("10")
			|| month.equals("11") || month.equals("12")) {
		season = "여름";
	} else {
		season = "겨울";
	} ;
	%>

	<!-- [ Pre-loader ] start -->
	<div class="loader-bg">
		<div class="loader-track">
			<div class="loader-fill"></div>
		</div>
	</div>
	<!-- [ Pre-loader ] End -->
	<!-- [ navigation menu ] start -->
	<nav class="pcoded-navbar menu-light" id="navColor">
		<div class="navbar-wrapper  ">
			<div class="navbar-content scroll-div ">

				<!-- 여기는 로그인을 해야 뜰 수 있게 -->
				<%
				if (loginUser == null) {
				%>
				<%
				} else {
				%>
				<div class="">
					<div class="main-menu-header">
						<img class="img-radius"
							src="resources/assets/images/user/default.png"
							alt="User-Profile-Image">
						<div class="user-details">
							<div id="more-details">${loginUser.user_nick}
								<i class="fa fa-caret-down"></i>
							</div>
						</div>
					</div>
					<div class="collapse" id="nav-user-link">
						<ul class="list-unstyled">
							<li class="list-group-item"><a href="goUpdateUser"><i
									class="feather icon-settings m-r-5"></i>Settings</a></li>
							<li class="list-group-item"><a href="logoutUser"><i
									class="feather icon-log-out m-r-5"></i>Logout</a></li>
						</ul>
					</div>
				</div>
				<%
				}
				%>

				<ul class="nav pcoded-inner-navbar ">
					<li class="nav-item pcoded-menu-caption"><label>Pages</label></li>
					<li class="nav-item"><a href="goMain" class="nav-link "><span
							class="pcoded-micon"><i class="feather icon-home"></i></span><span
							class="pcoded-mtext">Main</span></a></li>
					<li class="nav-item pcoded-hasmenu"><a href="#!"
						class="nav-link"><span class="pcoded-micon"><i
								class="feather icon-align-justify"></i></span><span
							class="pcoded-mtext">Item</span></a>
						<ul class="pcoded-submenu">
							<li><a href="goStyleMain" target="_self"><i
									class="feather icon-tag"></i> Item Main</a></li>
							<%
							if (loginUser == null) {
							%>
							<li><a href="" onclick="user()" target="_self"><i
									class="feather icon-thumbs-up m-r-5"></i> 추천</a></li>
							<%
							} else {
							%>
							<li><a href="goRecoStyle?user_id=${loginUser.user_id}"
								target="_self"><i class="feather icon-thumbs-up m-r-5"></i>추천</a></li>
							<%
							}
							%>
						</ul></li>
					<li class="nav-item pcoded-hasmenu"><a href="#!"
						class="nav-link"> <span class="pcoded-micon"><i
								class="feather icon-align-justify"></i></span> <span
							class="pcoded-mtext">Cody </span></a>
						<ul class="pcoded-submenu">
							<li><a href="goCodyMain" target="_self"><i
									class="feather icon-tag"></i> Cody Main</a></li>
							<%
							if (loginUser == null) {
							%>
							<li><a href="" onclick="user()" target="_self"><i
									class="feather icon-thumbs-up m-r-5"></i> 추천</a></li>
							<%
							} else {
							%>
							<li><a
								href="goRecoCody?user_id=${loginUser.user_id}&cody_season=<%=season %>"
								target="_self"><i class="feather icon-thumbs-up m-r-5"></i>추천</a></li>
							<%
							}
							%>
						</ul></li>
					<li class="nav-item pcoded-hasmenu"><a href="#!"
						class="nav-link"><span class="pcoded-micon"><i
								class="feather icon-align-justify"></i></span><span
							class="pcoded-mtext">My Page</span></a>
						<ul class="pcoded-submenu">
							<%
							if (loginUser == null) {
							%>
							<li><a href="" onclick="user()" target="_self"><i
									class="feather icon-briefcase m-r-5"></i> 나만의 옷장</a></li>
							<%
							} else {
							%>
							<li><a href="goMyCloset?user_id=${loginUser.user_id}"
								target="_self"><i class="feather icon-briefcase m-r-5"></i>
									나만의 옷장</a></li>
							<%
							}
							%>
							<%
							if (loginUser == null) {
							%>
							<li><a href="" onclick="user()" target="_self"><i
									class="feather icon-heart m-r-5"></i> 좋아요 보기</a></li>
							<%
							} else {
							%>
							<li><a href="goLikeStyle?user_id=${loginUser.user_id}"
								target="_self"><i class="feather icon-heart m-r-5"></i> 좋아요
									보기</a></li>
							<%
							}
							%>
						</ul></li>
				</ul>
				<span class="pantone-title"><연도별 팬톤컬러></span>
				<div class="pantone-images" id="pantone-images">

					<div class="pantone-image-container">
						<img src="resources/assets/images/2024_peachFuzz.png"
							alt="Peach Fuzz" class="pantone-image" data-color="#FF6F61">
						<span class="year-label">2024</span>
					</div>
					<!-- 각 팬톤 이미지에 대해 반복 -->
					<!-- ... 다른 팬톤 이미지와 그들의 컨테이너 및 연도 라벨 ... -->
					<div class="pantone-image-container">
						<img src="resources/assets/images/widget/2023_vivaMagenta.png"
							alt="Viva Magenta" class="pantone-image" data-color="#9B1B30">
						<span class="year-label">2023</span>
					</div>
					<div class="pantone-image-container">
						<img src="resources/assets/images/widget/2022_veryPeri.png"
							alt="Very Peri" class="pantone-image" data-color="#6667AB">
						<span class="year-label">2022</span>
					</div>
					<div class="pantone-image-container">
						<img src="resources/assets/images/widget/2021_illuminating.png"
							alt="Illuminating" class="pantone-image" data-color="#F5DF4D">
						<span class="year-label">2021</span>
					</div>
					<div class="pantone-image-container">
						<img src="resources/assets/images/widget/2021_ultimateGray.png"
							alt="Ultimate Gray" class="pantone-image" data-color="#939597">
						<span class="year-label">2020</span>
					</div>
					<div class="pantone-image-container">
						<img src="resources/assets/images/widget/2020_classicBlue.png"
							alt="Classic Blue" class="pantone-image" data-color="#34568B">
						<span class="year-label">2019</span>
					</div>
				</div>
			</div>
		</div>
	</nav>
	<!-- [ navigation menu ] end -->
	<!-- [ Header ] start -->
	<header
		class="navbar pcoded-header navbar-expand-lg navbar-light header-blue">

		<div class="m-header">
			<a class="mobile-menu" id="mobile-collapse" href="#!"><span></span></a>
			<a href="goMain" class="b-brand"> <!-- ========   change your logo hear   ============ -->
				<!-- 로고 길이 짧게, 배경색 없애기 --> <img
				src="resources/assets/images/로고_누끼(160X23).png" alt="" class="logo">
				<!-- <img src="resources/assets/images/logo-icon(30x30).png" alt="" class="logo-thumb"> -->
			</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"></li>
			</ul>
			<%
			if (loginUser == null) {
			%>
			<ul class="navbar-nav ml-auto">
				<li>
					<div class="dropdown drp-user">
						<a href="signUp" class="dropdown-toggle" title="SignUp"> <i
							class="feather icon-user"></i>
						</a>
					</div>
				</li>
				<li>
					<div class="dropdown drp-user">
						<a href="signIn" class="dropdown-toggle" title="SignIn"> <i
							class="feather icon-log-in"></i>
						</a>
					</div>
				</li>
			</ul>
			<%
			} else {
			%>
			<%
			}
			%>
		</div>
		<script>
					function user() {
						alert("로그인후 사용 가능합니다.")
					}
		</script>
	</header>

</body>

</html>