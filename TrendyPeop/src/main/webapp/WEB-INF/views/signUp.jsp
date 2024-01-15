<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>TrendyPeop</title>
<meta charset="UTF-8">
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

<body>
<!-- [ auth-signup ] start -->
<div class="auth-wrapper">
	<div class="auth-content">
		<div class="card">
			<div class="row align-items-center text-center">
				<div class="col-md-12">
					<div class="card-body">
					<form action="joinUser" method="post">
						<img src="resources/assets/images/트렌디핍_글자_로고(195x28).png" alt="" class="img-fluid mb-4">
						<h4 class="mb-3 f-w-400">Sign up</h4>
                        <div class="form-group mb-3">
							<label class="floating-label" for="userid">UserID</label>
							<input type="text" class="form-control" id="userid" name="user_id" placeholder="아이디를 입력하세요">
						</div>
                        <div>
                            <button class="btn btn-primary btn-block mb-4">아이디 중복 체크</button>
                        </div>
                        <div class="form-group mb-4">
							<label class="floating-label" for="Password">Password</label>
							<input type="password" class="form-control" id="password" name="user_pw" placeholder="비밀번호를 입력하세요">
						</div>
                        <div class="form-group mb-4">
							<label class="floating-label" for="PasswordCheck">Password Check</label>
							<input type="password" class="form-control" id="passwordcheck" placeholder="비밀번호 확인">
						</div>
						<div class="form-group mb-3">
							<label class="floating-label" for="Username">Username</label>
							<input type="text" class="form-control" id="username" name="user_name" placeholder="이름을 입력하세요">
						</div>
						<div class="form-group mb-3">
							<label class="floating-label" for="Nickname">Nickname</label>
							<input type="text" class="form-control" id="nickname" name="user_nick" placeholder="닉네임을 입력하세요">
						</div>
						
						<button class="btn btn-primary btn-block mb-4"><a href="joinUser">Sign up</a></button>
						<p class="mb-2">이미 계정이 있으신가요? <a href="signIn" class="f-w-400">Signin</a></p>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- [ auth-signup ] end -->

<!-- Required Js -->
<script src="resources/assets/js/vendor-all.min.js"></script>
<script src="resources/assets/js/plugins/bootstrap.min.js"></script>
<script src="resources/assets/js/ripple.js"></script>
<script src="resources/assets/js/pcoded.min.js"></script>

</body>


<!-- 
<body bgcolor="lavender">
	<form action="joinUser" method="post">
		user_id<input type="text" name="user_id"><br>
		user_pw<input type="text" name="user_pw"><br>
		user_name<input type="text" name="user_name"><br>
		user_nick<input type="text" name="user_nick"><br>
		user_type<input type="text" name="user_type"><br>
		
		<input type="submit" value="SEND">
	</form>
</body> -->
</html>