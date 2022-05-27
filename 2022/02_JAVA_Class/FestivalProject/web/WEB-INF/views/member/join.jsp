<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" type="text/css" href="/festival/resources/css/w3.css"/>
<link rel="stylesheet" type="text/css" href="/festival/resources/css/base.css"/>
<link rel="stylesheet" type="text/css" href="/festival/resources/css/tmddus.css"/>
<script type="text/javascript" src="/festival/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/festival/resources/js/base.js"></script>
<script type="text/javascript" src="/festival/resources/js/tmddus.js"></script>
</head>
<body>
	<div class="w3-content w3-center w600">
		<a href="/festival/"><img src="/festival/resources/img/logo.png" class="blogo"></a>
				<form method="POST" action="" name="frm" id="frm"
			class="w3-col w3-margin-top w3-margin-bottom w3-padding w3-border">
			   <h2>회원가입</h2>
			
			<div>
				<label for="name" class="f w3-col s3 w3-right-align w3-margin-top">회원이름 : </label>
				<input type="text" name="name" id="name" placeholder="10글자 이하" class="lab w3-col s8 w3-input w3-border">
			</div>
			<div>
				<label for="id" class="f w3-col s3 w3-right-align">아 이 디 : </label>
				<div class="w3-col s8">
						<div class="w3-col w3-button w3-blue w3-right" id="idck">ID확인</div>
					<div class="w3-rest">
						<input type="text" name="id" id="id" placeholder="20자 이내의 영문, 숫자" class="lab w3-input w3-border">
					</div>
					<span class="w3-col w3-center" id="idmsg"></span>
				</div>
			</div>
			<div>
				<label for="pw" class="f w3-col s3 w3-right-align">비밀번호 : </label>
				<div class="w3-col s8">
					<input type="password" name="pw" id="pw" placeholder="20자 이내의 영문, 숫자" class="lab w3-col w3-input w3-border">
					<!-- <span class="w3-col w3-text-red w3-center" id="pwmsg"># 비밀번호는 12345 만 가능합니다.</span>  -->
				</div>
			</div>
			<div>
				<label for="repw" class="f w3-col s3 w3-right-align">pw check : </label>
				<div class="w3-col s8">
					<input type="password" id="repw" class="lab w3-col w3-input w3-border">
					<!-- <span class="w3-col w3-text-red w3-center" id="repwmsg"># 비밀번호가 일치하지 않습니다.</span> -->
				</div>
			</div>
			<div>
				<label for="mail" class="f w3-col s3 w3-right-align">회원메일 : </label>
				<input type="text" name="mail" id="mail" placeholder="ex) aaa@githrd.com" class="lab w3-col s8 w3-input w3-border">
			</div>
			<div>
				<label for="tel" class="f w3-col s3 w3-right-align">전화번호 : </label>
				<input type="text" name="tel" id="tel" placeholder="ex) 010-1111-1111" class="lab w3-col s8 w3-input w3-border">
			</div>
			<div>
				<label for="mail" class="f w3-col s3 w3-right-align">생년월일 : </label>
				<input type="date" name="birth" id="birth" class="lab w3-col s8 w3-input w3-border">
			</div>
			<div>
				<label for="mail" class="f w3-col s3 w3-right-align">주소 : </label>
				<input type="text" name="add" id="add" placeholder="OO동" class="lab w3-col s8 w3-input w3-border">
			</div>
			<div>
				<label class="f w3-col s3 w3-right-align">회원성별 : </label>
				<div class="w3-col s8 w3-center w3-margin-top" id="gen">
					<div class="w3-half">
						<input type="radio" name="gen" id="mgen" class="ra" value="M"> <label for="mgen"> 남자</label>
					</div>
					<div class="w3-half">
						<input type="radio" name="gen" id="fgen" class="ra" value="F"> <label for="fgen"> 여자</label>
					</div>
				</div>
			</div>
			<div class="w3-col s6 w3-center ckb">
				<input type="checkbox" name="SMS" id="SMS"><label for="SMS" class="ckb"> SMS 수신 동의</label>
			</div>
			<div class="w3-col s4 w3-center ckb">
				<input type="checkbox" name="amail" id="amail"><label for="amail" class="ckb"> 메일 수신 동의</label>
			</div>
		</form>
		<div class="w3-col">
			<div class="w3-half w3-light-gray w3-button" id="backbtn">뒤로가기</div> 
			<div class="w3-half w3-dark-gray w3-button" id="jbtn">가입하기</div> 
		</div>
	</div>
</body>
</html>