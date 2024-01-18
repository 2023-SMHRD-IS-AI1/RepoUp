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

<body>
<!-- [ auth-signup ] start -->
<div class="auth-wrapper">
	<div class="auth-content">
		<div class="card">
			<div class="row align-items-center text-center">
				<div class="col-md-12">
					<div class="card-body">
					<form action="signUpSuccess" method="post">
						<img src="resources/assets/images/로고_누끼(160X23).png" alt="" class="img-fluid mb-4">
						<h4 class="mb-4 f-w-400">회원가입</h4>
						
                        <div class="form-group mb-4">
							<label class="floating-label" for="userid">UserID</label>
							<input type="text" class="form-control" id=user_id name="user_id" placeholder="아이디를 입력하세요"><br>
							<label id="label1"></label>
						</div>
						<div class="form-group mb-4">
					        <label class="floating-label" for="Password">Password</label>
					        <input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="비밀번호를 입력하세요" onchange="isSame()" >
					    </div>
					    <div class="form-group mb-4">
					        <label class="floating-label" for="PasswordCheck">PasswordCheck</label>
					        <input type="password" class="form-control" id="user_pwcheck"  name="user_pwcheck" placeholder="비밀번호 확인" onchange="isSame()" > 
					        <label id="same"></label>
					    </div>
						<div class="form-group mb-3">
							<label class="floating-label" for="Username">Username</label>
							<input type="text" class="form-control" id="username" name="user_name" placeholder="이름을 입력하세요">
						</div>
						<div class="form-group mb-3">
							<label class="floating-label" for="Nickname">Nickname</label>
							<input type="text" class="form-control" id="nickname" name="user_nick" placeholder="닉네임을 입력하세요">
						</div>
						<button class="btn btn-primary btn-block mb-4">Sign up</button>
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

	
	<!-- <script src="resources/assets/js/jquery-3.7.1.min.js"></script> -->
		
	<script type="text/javascript">
		$(document).ready(function() {
    		//ID 중복 확인
		   	//id를 입력할 수 있는 input text 영역을 벗어나면 동작한다.
    		$("#user_id").on("focusout", function() {
    		
    			var user_id = $("#user_id").val();
    	
    			if(user_id == '' || user_id.length == 0) {
    				$("#label1").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
    				return false;
    			}
				
    			
    				
        		//Ajax로 전송
        		$.ajax({
        			url : './ConfirmId',
        			data : {user_id : user_id},
        			type : 'POST',
        			dataType : 'json',
        			success : function(result) {
        				console.log(result);
        				if (result == true) {
        					$("#label1").css("color", "black").text("사용 가능한 ID 입니다.");
        				} else{
        					$("#label1").css("color", "red").text("사용 불가능한 ID 입니다.");
        					$("#user_id").val('');
        				}
        			}
        		}); //End Ajax
    			
    		});
 	   })
 	   
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


</body>

</html>