<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 내장객체 Study</title>
<link rel="stylesheet" type="text/css" href="/whistle/resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="/whistle/resources/css/base.css">
<script type="text/javascript" src="/whistle/resources/js/jquery-3.6.0.min.js"></script>
<style type="text/css">
	label {
		font-size: 14pt;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#rbtn').click(function(){
			// 리셋버튼 처리
			document.frm.reset();
		});
		
		$('#lbtn').click(function(){
			$('#frm').submit();
		});
	});
</script>
</head>
<body>
	
	<div class="w3-content mx650">
		<h1 class="w3-blue w3-center w3-margin-bottom w3-padding">Login</h1>
		<form method="get" action="/whistle/test/logindata.pink" name="frm" id="frm"
				class="w3-col w3-padding w3-card-4">
			<div class="w3-col">
				<label for="id" class="w3-col m2 w3-right-align" 
						style="padding-top: 10px;">아이디 : </label>
				<input type="text" class="w3-col m9 w3-input w3-border" style="margin-left: 10px;"
						id="id" name="id" placeholder="아이디를 입력하세요!">
			</div>
			<div class="w3-col w3-margin-top">
				<label for="pw" class="w3-col m2 w3-right-align" 
						style="padding-top: 10px;">비밀번호 : </label>
				<input type="password" class="w3-col m9 w3-input w3-border" style="margin-left: 10px;"
						id="pw" name="pw" placeholder="비밀번호를 입력하세요!">
			</div>
		</form>
		<div class="w3-col w3-margin-top w3-card-4">
			<div class="w3-half w3-button w3-orange" id="rbtn">reset</div>
			<div class="w3-half w3-button w3-blue" id="lbtn">Login</div>
		</div>
	</div>
</body>
</html>