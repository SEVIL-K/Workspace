<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Data</title>
</head>
<body>
	<div class="w3-content mx650 w3-center">
		<h1 class="w3-blue w3-margin-bottom">Login Data</h1>
		<h2>Login ID : <%= request.getParameter("id") %></h2>
		<h2>Login PW : <%= request.getParameter("pw") %></h2>
		<h2>Attr Login ID : ${ID }</h2>
		<h2>Attr Login PW : ${PW }</h2>
	</div>
</body>
</html>