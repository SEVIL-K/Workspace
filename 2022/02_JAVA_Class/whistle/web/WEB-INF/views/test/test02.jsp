<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test02 Page</title>
<link rel="stylesheet" type="text/css" href="/whistle/resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="/whistle/resources/css/base.css">
</head>
<body>
	<div class="w3-content mx650">
		<h1 class="w3-pink w3-center">여기는 Test02 Page</h1>
		<div class="w3-col w3-margin-top w3-card-4 w3-padding">
			<h3 class="w3-center w3-text-purple">전송된 이름 : <%= request.getAttribute("NAME") %></h3>
		</div>
	</div>
</body>
</html>