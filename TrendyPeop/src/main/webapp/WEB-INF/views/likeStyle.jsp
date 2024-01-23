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
                        <h4 class="mt-4 text-center">Like It</h4>
                        <button type="button" class="btn btn-sm btn-outline-primary" 
                        onclick="location.href='goLikeStyle?user_id=${loginUser.user_id}'">Item</button>
                        <button type="button" class="btn btn-sm btn-outline-primary"
                        onclick="location.href='goLikeCody?user_id=${loginUser.user_id}'">Cody</button>
                        <hr>
                    </div>
                </div>
                <!-- 이미지 출력 -->
                <div class="row">
                	<div class="col">
						<% 
							List<Style> likeStyleList = (List<Style>) request.getAttribute("likeStyleList");
		                  
                  			for(int i=0;i<=(likeStyleList.size()/5+1);i++) {
                    		int j = i*5;
                  		%>
						
						<div class="card-deck">
						
						<c:forEach items="${likeStyleList }" var="s" begin="<%=j %>" end="<%=j+4 %>"  varStatus="status">
							<div class="card" id="max">
								<img data-toggle="modal" data-target="#item${status.index }" class="img-fluid card-img-top"
									src="${s.style_img_url }" alt="Card image cap">
								<div class="card-footer">
									<div class="modal fade bd-example-modal-lg" id="item${status.index }" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="${s.style_img_url }"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary" onclick="location.href='deleteStyleHeart?style_idx=${s.style_idx }&user_id=${loginUser.user_id}'"><i
                                        class="feather icon-heart"></i></button>
								</div>
							</div>
						</c:forEach>
						</div>
						<br><br>
						<%} %>
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

let posColor ="#FFBE98";
 
  //2. 내가 원하는 색깔 선택시 바뀜 --> changeHeaderColor 만듬
  //3. 텍스트 색깔도 바뀜
  
//|| e.target.classList[i]=="nav-link" ||e.target.classList[i]=="pcoded-mtext"
document.getElementById("navColor").addEventListener('mouseover', e => {
    console.log(e)
    for(let i=0;i<e.target.classList.length;i++){
        if(e.target.classList[i]=="nav-item"|| e.target.classList[i]=="nav-link"){
        let childList = e.target.childNodes
        for(let j=0;j<childList.length;j++){
            childList[j].style.backgroundColor=posColor;
        }
        e.target.style.backgroundColor=posColor
    
        }
    }
});

document.getElementById("navColor").addEventListener('mouseout', e => {
    console.log(e)
    for(let i=0;i<e.target.classList.length;i++){
        if(e.target.classList[i]=="nav-item"|| e.target.classList[i]=="nav-link"){
             e.target.style.backgroundColor="white"

             let childList = e.target.childNodes
            for(let j=0;j<childList.length;j++){
                childList[j].style.backgroundColor="white"
            }
        }
    }
});


    

    function animateImages() {
        var images = document.getElementById("pantone-images");
        var width = images.scrollWidth - images.clientWidth;
        var start = Date.now();

        function step() {
            var elapsed = Date.now() - start;
            var position = (elapsed / 20) % (width * 2);
            if (position < width) {
                images.scrollLeft = position;
            } else {
                images.scrollLeft = width * 2 - position;
            }
            requestAnimationFrame(step);
        }
        requestAnimationFrame(step);
    }

    document.addEventListener('DOMContentLoaded', function () {
        document.querySelectorAll('.pantone-image').forEach(function(image) {
            image.addEventListener('click', function () {
                var color = image.getAttribute('data-color');
                changeHeaderColor(color);
                posColor =color;
            });
        });

        animateImages();
    });

    function changeHeaderColor(color) {
        // 바디 배경색 변경

        // 'nav-item pcoded-menu-caption' 클래스를 가진 요소들의 색상 변경
        var menuCaptions = document.querySelectorAll('.nav-item.pcoded-menu-caption');
        menuCaptions.forEach(function(element) {
        });

        // 'nav-link has-ripple' 클래스를 가진 요소들의 색상 변경
        var navLinks = document.querySelectorAll('.nav-link.has-ripple');
        navLinks.forEach(function(element) {
        });

        
    }

       // 'nav-link has-ripple' 클래스를 가진 요소들의 색상 변경
       var navLinks = document.querySelectorAll('mobile-menu on');
        navLinks.forEach(function(element) {
        });

      
        var navLinks = document.querySelectorAll('.pcoded-navbar.menu-light .pcoded-inner-navbar > li.pcoded-trigger > a');
        navLinks.forEach(function(element) {
        });



</script>
	
</body>

</html>