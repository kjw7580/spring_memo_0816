<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 - 회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="d-flex justify-content-center">
			<div class="signup-box h-100 d-flex justify-content-center align-items-center">
				<div class="w-100">
					<h1 class="text-center">회원가입</h1>
					<form method="post" action="/user/sign_up" id="signupForm">
						<div class="input-group mt-3">
							<div class="input-group-prepend">
								<span class="input-group-text">ID</span>
							</div>
							<input type="text" id="loginIdInput" name="loginId" class="form-control" placeholder="아이디">
						</div>
						<div class="input-group mt-3">
							<div class="input-group-prepend">
								<span class="input-group-text">P/W</span>
							</div>
							<input type="password" id="passwordInput" name="password" class="form-control" placeholder="비밀번호">
						</div>
						<input type="password" id="passwordConfirmInput" class="form-control mt-3" placeholder="비밀번호 확인">
						<small id="errorPassword" class="text-danger d-none">비밀번호가 일치하지 않습니다.</small>
						<small id="successPassword" class="text-success d-none">비밀번호가 일치합니다.</small>
						<input type="text" id="nameInput" name="name" class="form-control mt-3" placeholder="이름">
						<input type="text" id="emailInput" name="email" class="form-control mt-3" placeholder="이메일 주소">
						
						<button type="submit" id="signUpBtn" class="btn btn-secondary btn-block mt-3">가입</button>
					</form>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#signupForm").on("submit", function(e) {
				
				e.preventDefault();
				
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				var passwordConfirm = $("#passwordConfirmInput").val();
				var name = $("#nameInput").val().trim();
				var email = $("#emailInput").val().trim();
				
				if(loginId == null || loginId == "") {
					alert("아이디를 입력해주세요.");
					return false;
				}
				
				if(password == null || password == "") {
					alert("비밀번호를 입력해주세요.");
					return false;
				}
				
				if(password != passwordConfirm) {
					$("#errorPassword").removeClass("d-none");
					$("#successPassword").addClass("d-none");
					return false;
				}
				
				if(password == passwordConfirm) {
					$("#successPassword").removeClass("d-none");
					$("#errorPassword").addClass("d-none");
				}
				
				if(name == null || name == "") {
					alert("이름을 입력해주세요.");
					return false;
				}
				
				if(email == null || email == "") {
					alert("이메일을 입력해주세요.");
					return false;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_up",
					data:{"loginId":loginId, "password":password, "name":name, "email":email},
					success:function(data) {
						if(data.result == "success") {
							location.href="/user/signin_view";
							
						} else {
							alert("회원 가입 실패");
						}
					},
					error:function(e) {
						alert("회원 가입 실패");
					}
				});
				
				return false;
			});
		});
	</script>
</body>
</html>