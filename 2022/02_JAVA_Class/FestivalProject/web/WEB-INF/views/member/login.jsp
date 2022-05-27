<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" type="text/css" href="/festival/resources/css/w3.css"/>
<link rel="stylesheet" type="text/css" href="/festival/resources/css/base.css"/>
<link rel="stylesheet" type="text/css" href="/festival/resources/css/tmddus.css"/>
<script type="text/javascript" src="/festival/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/festival/resources/js/base.js"></script>
<script type="text/javascript" src="/festival/resources/js/tmddus.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
	<div class="w3-content w3-center">
		<a href="/festival/"><img src="/festival/resources/img/logo.png" class="blogo"></a>
		<div class="container w3-center w3-padding">
	 <div class="box w600 w3-margin-top w3-border w3-padding">
    <h2>로그인</h2>
	<form method="POST" action="" id="frm" name="frm">
    <div class="row">
        <div class="col-md-12 form-group">
            <input type="text" id="id" name="id" class="pd20 form-control" placeholder="아이디를 입력해주세요">
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 form-group">
            <input type="password" id="pw" name="pw" class="form-control" placeholder="비밀번호를 입력해주세요">
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 form-group">
            <div class="w3-button btn-block btn-login w3-black" id="lbtn">로그인</div>
        </div>
    </div>
    <div class="">
        <div class="fl">
            <a href="https://1.envato.market/ydVvD">회원가입</a>
            <a href="https://1.envato.market/ydVvD">아이디 찾기</a>
            <a href="https://1.envato.market/ydVvD">비밀번호 찾기</a>
        </div>
    </div>
	</form>
</div>
</div>
</div>
</body>
</html>