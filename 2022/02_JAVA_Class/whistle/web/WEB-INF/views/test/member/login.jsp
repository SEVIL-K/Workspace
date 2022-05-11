<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Study</title>
<link rel="stylesheet" type="text/css" href="/whistle/resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="/whistle/resources/css/base.css">
<script type="text/javascript" src="/whistle/resources/js/jquery-3.6.0.min.js"></script>
<style type="text/css">
	label {
		font-size: 16pt;
	}
	
	#msg {
		font-size: 20pt;
		font-weight: bold;
		color: indigo;
	}
</style>
</head>
<body>
	<div class="w3-content w3-center mx650">
		<h1 class="w3-blue w3-padding w3-card-4">Login</h1>
		<form method="POST" action="" class="w3-col w3-padding w3-card-4 w3-margin-top" id="frm" name="frm">
			<div class="w3-col w3-margin-top">
				<label for="id" class="w3-col s2 w3-right-align w3-text-grey">I D : &nbsp;</label>
				<div class="w3-col m9 pdl10">
					<input type="text" name="id" id="id" placeholder="아이디를 입력하세요!"
							class="w3-col w3-input w3-border w3-round-medium">
				</div>
			</div>
			<div class="w3-col w3-margin-top w3-margin-bottom">
				<label for="pw" class="w3-col s2 w3-right-align w3-text-grey">P W : &nbsp;</label>
				<div class="w3-col m9 pdl10">
					<input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요!"
							class="w3-col w3-input w3-border w3-round-medium">
				</div>
			</div>
		</form>
		<div class="w3-col w3-margin-top w3-card-4">
			<div class="w3-third w3-button w3-red w3-hover-orange" id="hbtn">Home</div>
			<div class="w3-third w3-button w3-blue w3-hover-aqua" id="lbtn">Login</div>
			<div class="w3-third w3-button w3-purple w3-hover-pink" id="abtn">ajax</div>
		</div>
		<div class="w3-col w3-padding w3-card-4 w3-hide"><span id="msg">${SID} 님은 이미 로그인했습니다!!!</span></div>
	</div>
<script type="text/javascript" src="/whistle/resources/js/test/login.js"></script>
</body>
</html>