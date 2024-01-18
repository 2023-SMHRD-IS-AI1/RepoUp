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

			<!-- 헤더 -->
			<div class="row">
				<div class="card support-bar overflow-hidden">
					<div class="col-xl-12">
						<h4 class="mt-4">
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
								class="bi bi-arrow-through-heart" viewBox="0 0 16 16">
								<path fill-rule="evenodd"
									d="M2.854 15.854A.5.5 0 0 1 2 15.5V14H.5a.5.5 0 0 1-.354-.854l1.5-1.5A.5.5 0 0 1 2 11.5h1.793l.53-.53c-.771-.802-1.328-1.58-1.704-2.32-.798-1.575-.775-2.996-.213-4.092C3.426 2.565 6.18 1.809 8 3.233c1.25-.98 2.944-.928 4.212-.152L13.292 2 12.147.854A.5.5 0 0 1 12.5 0h3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-.854.354L14 2.707l-1.006 1.006c.236.248.44.531.6.845.562 1.096.585 2.517-.213 4.092-.793 1.563-2.395 3.288-5.105 5.08L8 13.912l-.276-.182a21.86 21.86 0 0 1-2.685-2.062l-.539.54V14a.5.5 0 0 1-.146.354l-1.5 1.5Zm2.893-4.894A20.419 20.419 0 0 0 8 12.71c2.456-1.666 3.827-3.207 4.489-4.512.679-1.34.607-2.42.215-3.185-.817-1.595-3.087-2.054-4.346-.761L8 4.62l-.358-.368c-1.259-1.293-3.53-.834-4.346.761-.392.766-.464 1.845.215 3.185.323.636.815 1.33 1.519 2.065l1.866-1.867a.5.5 0 1 1 .708.708L5.747 10.96Z" />
							</svg>
							Style Main
						</h4>
						<hr>
						<!-- 첫번째줄 -->
						<div class="card-deck">
							<div class="card">
								<img data-toggle="modal" data-target="#item1" class="img-fluid card-img-top"
									src="resources/assets/images/의상 이미지/스타일/301884058.jpg" alt="Card image cap">
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-info" data-toggle="modal"
										data-target="#item1"><i class="feather icon-search"></i></button>
									<div class="modal fade bd-example-modal-lg" id="item1" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="resources/assets/images/의상 이미지/스타일/301884058.jpg"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-success"><i
											class="feather icon-briefcase"></i></button>
								</div>
							</div>
							<div class="card">
								<img data-toggle="modal" data-target="#item2" class="img-fluid card-img-top"
									src="resources/assets/images/의상 이미지/스타일/301898266.jpg" alt="Card image cap">
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-info" data-toggle="modal"
										data-target="#item2"><i class="feather icon-search"></i></button>
									<div class="modal fade bd-example-modal-lg" id="item2" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="resources/assets/images/의상 이미지/스타일/301898266.jpg"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-success"><i
											class="feather icon-briefcase"></i></button>
								</div>
							</div>
							<div class="card">
								<img data-toggle="modal" data-target="#item3" class="img-fluid card-img-top"
									src="resources/assets/images/의상 이미지/스타일/301901294.jpg" alt="Card image cap">
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-info" data-toggle="modal"
										data-target="#item3"><i class="feather icon-search"></i></button>
									<div class="modal fade bd-example-modal-lg" id="item3" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="resources/assets/images/의상 이미지/스타일/301901294.jpg"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-success"><i
											class="feather icon-briefcase"></i></button>
								</div>
							</div>
							<div class="card">
								<img data-toggle="modal" data-target="#item4" class="img-fluid card-img-top"
									src="resources/assets/images/의상 이미지/스타일/301904450.jpg" alt="Card image cap">
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-info" data-toggle="modal"
										data-target="#item4"><i class="feather icon-search"></i></button>
									<div class="modal fade bd-example-modal-lg" id="item4" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="resources/assets/images/의상 이미지/스타일/301904450.jpg"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-success"><i
											class="feather icon-briefcase"></i></button>
								</div>
							</div>
							<div class="card">
								<img data-toggle="modal" data-target="#item5" class="img-fluid card-img-top"
									src="resources/assets/images/의상 이미지/스타일/301911608.jpg" alt="Card image cap">
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-info" data-toggle="modal"
										data-target="#item5"><i class="feather icon-search"></i></button>
									<div class="modal fade bd-example-modal-lg" id="item5" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="resources/assets/images/의상 이미지/스타일/301911608.jpg"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-success"><i
											class="feather icon-briefcase"></i></button>
								</div>
							</div>
						</div>
						<!-- 두번째줄 -->
						<br><br>
						<div class="card-deck">
							<div class="card">
								<img data-toggle="modal" data-target="#item6" class="img-fluid card-img-top"
									src="resources/assets/images/의상 이미지/스타일/301963373.jpg" alt="Card image cap">
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-info" data-toggle="modal"
										data-target="#item6"><i class="feather icon-search"></i></button>
									<div class="modal fade bd-example-modal-lg" id="item6" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="resources/assets/images/의상 이미지/스타일/301963373.jpg"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-success"><i
											class="feather icon-briefcase"></i></button>
								</div>
							</div>
							<div class="card">
								<img data-toggle="modal" data-target="#item7" class="img-fluid card-img-top"
									src="resources/assets/images/의상 이미지/스타일/301986311.jpg" alt="Card image cap">
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-info" data-toggle="modal"
										data-target="#item7"><i class="feather icon-search"></i></button>
									<div class="modal fade bd-example-modal-lg" id="item7" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="resources/assets/images/의상 이미지/스타일/301986311.jpg"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-success"><i
											class="feather icon-briefcase"></i></button>
								</div>
							</div>
							<div class="card">
								<img data-toggle="modal" data-target="#item8" class="img-fluid card-img-top"
									src="resources/assets/images/의상 이미지/스타일/302114111.jpg" alt="Card image cap">
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-info" data-toggle="modal"
										data-target="#item8"><i class="feather icon-search"></i></button>
									<div class="modal fade bd-example-modal-lg" id="item8" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="resources/assets/images/의상 이미지/스타일/302114111.jpg"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-success"><i
											class="feather icon-briefcase"></i></button>
								</div>
							</div>
							<div class="card">
								<img data-toggle="modal" data-target="#item9" class="img-fluid card-img-top"
									src="resources/assets/images/의상 이미지/스타일/302118908.jpg" alt="Card image cap">
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-info" data-toggle="modal"
										data-target="#item9"><i class="feather icon-search"></i></button>
									<div class="modal fade bd-example-modal-lg" id="item9" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="resources/assets/images/의상 이미지/스타일/302118908.jpg"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-success"><i
											class="feather icon-briefcase"></i></button>
								</div>
							</div>
							<div class="card">
								<img data-toggle="modal" data-target="#item10" class="img-fluid card-img-top"
									src="resources/assets/images/의상 이미지/스타일/302121022.jpg" alt="Card image cap">
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-info" data-toggle="modal"
										data-target="#item10"><i class="feather icon-search"></i></button>
									<div class="modal fade bd-example-modal-lg" id="item10" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="resources/assets/images/의상 이미지/스타일/302121022.jpg"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-success"><i
											class="feather icon-briefcase"></i></button>
								</div>
							</div>
						</div>
						<br><br>
						<!-- 세번째줄 -->
						<div class="card-deck">
							<div class="card">
								<img data-toggle="modal" data-target="#item11" class="img-fluid card-img-top"
									src="resources/assets/images/의상 이미지/스타일/302122052.jpg" alt="Card image cap">
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-info" data-toggle="modal"
										data-target="#item11"><i class="feather icon-search"></i></button>
									<div class="modal fade bd-example-modal-lg" id="item11" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="resources/assets/images/의상 이미지/스타일/302122052.jpg"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-success"><i
											class="feather icon-briefcase"></i></button>
								</div>
							</div>
							<div class="card">
								<img data-toggle="modal" data-target="#item12" class="img-fluid card-img-top"
									src="resources/assets/images/의상 이미지/스타일/302130226.jpg" alt="Card image cap">
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-info" data-toggle="modal"
										data-target="#item12"><i class="feather icon-search"></i></button>
									<div class="modal fade bd-example-modal-lg" id="item12" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="resources/assets/images/의상 이미지/스타일/302130226.jpg"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-success"><i
											class="feather icon-briefcase"></i></button>
								</div>
							</div>
							<div class="card">
								<img data-toggle="modal" data-target="#item13" class="img-fluid card-img-top"
									src="resources/assets/images/의상 이미지/스타일/302138891.jpg" alt="Card image cap">
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-info" data-toggle="modal"
										data-target="#item13"><i class="feather icon-search"></i></button>
									<div class="modal fade bd-example-modal-lg" id="item13" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="resources/assets/images/의상 이미지/스타일/302138891.jpg"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-success"><i
											class="feather icon-briefcase"></i></button>
								</div>
							</div>
							<div class="card">
								<img data-toggle="modal" data-target="#item14" class="img-fluid card-img-top"
									src="resources/assets/images/의상 이미지/스타일/302194630.jpg" alt="Card image cap">
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-info" data-toggle="modal"
										data-target="#item14"><i class="feather icon-search"></i></button>
									<div class="modal fade bd-example-modal-lg" id="item14" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="resources/assets/images/의상 이미지/스타일/302194630.jpg"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-success"><i
											class="feather icon-briefcase"></i></button>
								</div>
							</div>
							<div class="card">
								<img data-toggle="modal" data-target="#item15" class="img-fluid card-img-top"
									src="resources/assets/images/의상 이미지/스타일/302202610.jpg" alt="Card image cap">
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-info" data-toggle="modal"
										data-target="#item15"><i class="feather icon-search"></i></button>
									<div class="modal fade bd-example-modal-lg" id="item15" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="resources/assets/images/의상 이미지/스타일/302202610.jpg"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-success"><i
											class="feather icon-briefcase"></i></button>
								</div>
							</div>
						</div>
						<!-- 네번째줄 -->
						<br><br>
						<div class="card-deck">
							<div class="card">
								<img data-toggle="modal" data-target="#item16" class="img-fluid card-img-top"
									src="resources/assets/images/의상 이미지/스타일/7f70decd-eda1-4ec0-8b4e-e584d80006a4.jpg"
									alt="Card image cap">
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-info" data-toggle="modal"
										data-target="#item16"><i class="feather icon-search"></i></button>
									<div class="modal fade bd-example-modal-lg" id="item16" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="resources/assets/images/의상 이미지/스타일/7f70decd-eda1-4ec0-8b4e-e584d80006a4.jpg"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-success"><i
											class="feather icon-briefcase"></i></button>
								</div>
							</div>
							<div class="card">
								<img data-toggle="modal" data-target="#item17" class="img-fluid card-img-top"
									src="resources/assets/images/의상 이미지/스타일/301884058.jpg" alt="Card image cap">
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-info" data-toggle="modal"
										data-target="#item17"><i class="feather icon-search"></i></button>
									<div class="modal fade bd-example-modal-lg" id="item17" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="resources/assets/images/의상 이미지/스타일/301884058.jpg"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-success"><i
											class="feather icon-briefcase"></i></button>
								</div>
							</div>
							<div class="card">
								<img data-toggle="modal" data-target="#item18" class="img-fluid card-img-top"
									src="resources/assets/images/의상 이미지/스타일/301898266.jpg" alt="Card image cap">
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-info" data-toggle="modal"
										data-target="#item18"><i class="feather icon-search"></i></button>
									<div class="modal fade bd-example-modal-lg" id="item18" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="resources/assets/images/의상 이미지/스타일/301898266.jpg"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-success"><i
											class="feather icon-briefcase"></i></button>
								</div>
							</div>
							<div class="card">
								<img data-toggle="modal" data-target="#item19" class="img-fluid card-img-top"
									src="resources/assets/images/의상 이미지/스타일/301904450.jpg" alt="Card image cap">
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-info" data-toggle="modal"
										data-target="#item19"><i class="feather icon-search"></i></button>
									<div class="modal fade bd-example-modal-lg" id="item19" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="resources/assets/images/의상 이미지/스타일/301904450.jpg"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-success"><i
											class="feather icon-briefcase"></i></button>
								</div>
							</div>
							<div class="card">
								<img data-toggle="modal" data-target="#item20" class="img-fluid card-img-top"
									src="resources/assets/images/의상 이미지/스타일/301911608.jpg" alt="Card image cap">
								<div class="card-footer">
									<button type="button" class="btn btn-icon btn-info" data-toggle="modal"
										data-target="#item20"><i class="feather icon-search"></i></button>
									<div class="modal fade bd-example-modal-lg" id="item20" tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close"><span
															aria-hidden="true">&times;</span></button>
													<img class="img-fluid card-img-top"
														src="resources/assets/images/의상 이미지/스타일/301911608.jpg"
														alt="Card image cap">
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-icon btn-primary"><i
											class="feather icon-heart"></i></button>
									<button type="button" class="btn btn-icon btn-success"><i
											class="feather icon-briefcase"></i></button>
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