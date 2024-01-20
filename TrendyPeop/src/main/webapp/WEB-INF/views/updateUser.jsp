<%@page import="com.trendypeop.myapp.entity.User"%>
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

		<% User loginUser = (User)session.getAttribute("loginUser"); %>

<!-- [ auth-edit-profile ] start -->
<div class="auth-wrapper">
    <div class="auth-content">
        <div class="card">
            <div class="row align-items-center text-center">
                <div class="col-md-12">
                	<form action="updateSuccess" method="post">
	                    <div class="card-body">
	                        <img src="resources/assets/images/로고_누끼(160X23).png" alt="" class="img-fluid mb-4">
	                        <h4 class="mb-4 f-w-400">개인정보수정</h4>
	                        <div class="form-group mb-4">
	                            <label class="floating-label" for="UserID">UserID</label>
	                            <input type="text" class="form-control" id="userid" name="user_id" readonly value="${loginUser.user_id}">
	                        </div>
	                        <div class="form-group mb-4">
	                            <label class="floating-label" for="NewPassword">New Password</label>
	                            <input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="새 비밀번호를 입력하세요" onchange="isSame()">
	                        </div>
	                        <div class="form-group mb-4">
	                            <label class="floating-label" for="ConfirmPassword">Confirm New Password</label>
	                            <input type="password" class="form-control" id="user_pwcheck" name="user_pwcheck" placeholder="새 비밀번호 확인" onchange="isSame()">
	                        	<label id="same"></label>
	                        </div>
	                        <div class="form-group mb-4">
	                            <label class="floating-label" for="Nickname">Nickname</label>
	                            <input type="text" class="form-control" id="nickname" name="user_nick" placeholder="새 닉네임을 입력하세요">
	                            <input type="hidden" name="user_name" value="${loginUser.user_name }"
	                        </div>
	                        <button class="btn btn-primary btn-block mb-4">Update</button>
	                        <p class="mb-2">홈화면 돌아가기 <a href="goMain" class="f-w-400">home</a></p>
	                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

    <script type="text/javascript">
    
	    function isSame(){
	        if(document.getElementById('user_pw').value != '' && document.getElementById('user_pwcheck').value!='') {
	            if(document.getElementById('user_pw').value==document.getElementById('user_pwcheck').value) {
	                document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
	                document.getElementById('same').style.color='black';
	            }
	            else{
	                document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
	                document.getElementById('same').style.color='red';
	            }
	        }
		}
    
    </script>
              

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