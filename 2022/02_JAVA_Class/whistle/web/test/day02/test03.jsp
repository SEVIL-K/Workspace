<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 페이지에서 자바 코딩</title>
<link rel="stylesheet" type="text/css" href="/whistle/resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="/whistle/resources/css/base.css">
</head>
<body>
<%--
	문자열 배열을 만들고 사용할 w3.css 에 있는 
	색상관련 클래스들을 모아놓는다. 
 --%>
<%
	String[] color = new String[]{
			"w3-pink", "w3-purple", "w3-deep-purple", "w3-indigo", 
			"w3-blue", "w3-aqua","w3-teal","w3-green"
	};  
%>
	<div class="w3-content mx650 w3-center">
		<h1 class="w3-orange w3-padding w3-margin-top">스크립트 릿 연습</h1>
		<div class="w3-col w3-padding">
		<%
			for(int i = 0 ; i < color.length ; i++ ){
		%>
			<div class="box wh100 ml10 <%= color[i] %>"><%= color[i] %></div>
		<%
			}
		%>
		</div>
	</div>
</body>
</html>