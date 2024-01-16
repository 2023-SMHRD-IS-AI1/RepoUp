<%@page import="com.trendypeop.myapp.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TrendyPeop</title>
    <!-- vendor css -->
    <link rel="stylesheet" href="resources/assets/css/style.css">
    <!-- Favicon icon -->
    <link rel="icon" href="resources/assets/images/favicon.png" type="image/x-icon">
    
</head>
<body>

	<%
		User loginUser = (User)session.getAttribute("loginUser");

	%>
	
	<!-- [ Pre-loader ] start -->
	<div class="loader-bg">
		<div class="loader-track">
			<div class="loader-fill"></div>
		</div>
	</div>
	<!-- [ Pre-loader ] End -->
	<!-- [ navigation menu ] start -->
	<nav class="pcoded-navbar menu-light ">
		<div class="navbar-wrapper  ">
			<div class="navbar-content scroll-div " >
				
                <!-- 여기는 로그인을 해야 뜰 수 있게 -->
                <%if(loginUser == null){ %>
                
                <%}else{ %>
				<div class="">
					<div class="main-menu-header">
						<img class="img-radius" src="resources/assets/images/user/default.png" alt="User-Profile-Image">
						<div class="user-details">
							<div id="more-details">${loginUser.user_id} <i class="fa fa-caret-down"></i></div>
						</div>
					</div>
					<div class="collapse" id="nav-user-link">
						<ul class="list-unstyled">
							<li class="list-group-item"><a href="#!"><i class="feather icon-settings m-r-5"></i>Settings</a></li>
							<li class="list-group-item"><a href="logoutUser"><i class="feather icon-log-out m-r-5"></i>Logout</a></li>
						</ul>
					</div>
				</div>
				<%} %>
				
				<ul class="nav pcoded-inner-navbar ">
					<li class="nav-item pcoded-menu-caption">
					    <label>Pages</label>
					</li>
					<li class="nav-item">
					    <a href="goMain" class="nav-link "><span class="pcoded-micon"><i class="feather icon-home"></i></span><span class="pcoded-mtext">Main</span></a>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link"><span class="pcoded-micon"><i class="feather icon-align-justify"></i></span>
						<span class="pcoded-mtext">Item</span></a>
						<ul class="pcoded-submenu">
							<li><a href="styleMain" target="_self"><i class="feather icon-tag"></i> Item Main</a>
							</li>
							<li><a href="#!" target="_self"><i class="feather icon-thumbs-up m-r-5"></i> 추천</a>
							</li>
						</ul>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link"><span class="pcoded-micon"><i
									class="feather icon-align-justify"></i></span><span class="pcoded-mtext">Cody
								</span></a>
						<ul class="pcoded-submenu">
							<li><a href="codyMain" target="_self"><i class="feather icon-tag"></i> Cody Main</a>
							</li>
							<li><a href="#!" target="_self"><i class="feather icon-thumbs-up m-r-5"></i> 추천</a>
							</li>
						</ul>
					</li>
					<li class="nav-item pcoded-hasmenu">
					    <a href="#!" class="nav-link"><span class="pcoded-micon"><i class="feather icon-align-justify"></i></span><span class="pcoded-mtext">My Page</span></a>
					    <ul class="pcoded-submenu">
					        <li><a href="#!" target="_self"><i class="feather icon-briefcase m-r-5"></i> 나만의 옷장</a></li>
					        <li><a href="#!" target="_self"><i class="feather icon-heart m-r-5"></i> 좋아요 보기</a></li>
					    </ul>
					</li>
				</ul>

			</div>
		</div>
	</nav>
	<!-- [ navigation menu ] end -->
	<!-- [ Header ] start -->
	<header class="navbar pcoded-header navbar-expand-lg navbar-light header-blue">
		
				<div class="m-header">
					<a class="mobile-menu" id="mobile-collapse" href="#!"><span></span></a>
					<a href="#!" class="b-brand">
						<!-- ========   change your logo hear   ============ -->
                        <!-- 로고 길이 짧게, 배경색 없애기 -->
						<img src="resources/assets/images/로고_누끼(160X23).png" alt="" class="logo">
						<!-- <img src="resources/assets/images/logo-icon(30x30).png" alt="" class="logo-thumb"> -->
					</a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item">
							<a href="#!" class="pop-search"><i class="feather icon-search"></i></a>
							<div class="search-bar">
								<input type="text" class="form-control border-0 shadow-none" placeholder="Search hear">
								<button type="button" class="close" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</li>
					</ul>
					<%if(loginUser == null){ %>
					<ul class="navbar-nav ml-auto">
						<li>
							<div class="dropdown drp-user">
								<a href="signUp" class="dropdown-toggle" title="SignUp">
									<i class="feather icon-user"></i>
								</a>
							</div>
						</li>
                        <li>
							<div class="dropdown drp-user">
								<a href="signIn" class="dropdown-toggle" title="SignIn">
									<i class="feather icon-log-in"></i>
								</a>
							</div>
						</li>
					</ul>
					<%}else{ %>
					
					<%} %>
				</div>
				
	</header>

</body>

</html>