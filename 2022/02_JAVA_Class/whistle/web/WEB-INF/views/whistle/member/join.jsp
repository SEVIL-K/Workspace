<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whistle Join</title>
<link rel="stylesheet" type="text/css" href="/whistle/resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="/whistle/resources/css/user.css">
<script type="text/javascript" src="/whistle/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/whistle/resources/js/whistle/join.js"></script>
<style type="text/css">
	.avtimg {
		width: 100px;
		height: 100px;
	}
	.avtbox {
		display: inline-block;
		width: 102px;
		height: 117px;
	}
	#pwmsg, #repwmsg, #avtfr, #idmsg {
		display: none;
	}
	
	label.s3 {
		position: relative;
		top: 5px;
		font-size: 14pt;
		font-weight: normal;
		opacity: 0.7;
	}
	
	#gen label {
		position: relative;
		top: 2px;
		left: 7px;
	}
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="w3-content w3-margin-top mxw700">
		<!-- 타이틀 -->
		<h1 class="w3-pink w3-center w3-padding w3-card-4">Whistle 회원가입</h1>
		<form method="POST" action="" name="frm" id="frm"
			class="w3-col w3-margin-top w3-margin-bottom w3-padding w3-card-4">
			<div>
				<label for="name" class="w3-col s3 w3-right-align w3-margin-top clrgrey ft14 mgb10">회원이름 : </label>
				<input type="text" name="name" id="name" class="w3-col s8 w3-margin-top mgl10 w3-input w3-border mgb10">
			</div>
			<div>
				<label for="id" class="w3-col s3 w3-right-align clrgrey ft14 mgb10">아 이 디 : </label>
				<div class="w3-col s8 mgl10">
						<div class="w3-col w100 w3-button w3-blue w3-right pd9-16" id="idck">id check</div>
					<div class="w3-rest pdr10">
						<input type="text" name="id" id="id" class="w3-input w3-border mgb10">
					</div>
					<span class="w3-col mgb10 w3-center" id="idmsg"></span>
				</div>
			</div>
			<div>
				<label for="pw" class="w3-col s3 w3-right-align clrgrey ft14 mgb10">비밀번호 : </label>
				<div class="w3-col s8 mgl10 mgb10">
					<input type="password" name="pw" id="pw" class="w3-col w3-input w3-border">
					<span class="w3-col w3-text-red" id="pwmsg"># 비밀번호는 12345 만 가능합니다.</span>
				</div>
			</div>
			<div>
				<label for="repw" class="w3-col s3 w3-right-align clrgrey ft14 mgb10">pw check : </label>
				<div class="w3-col s8 mgl10 mgb10">
					<input type="password" name="repw" id="repw" class="w3-col w3-input w3-border">
					<span class="w3-col w3-text-red" id="repwmsg"># 비밀번호가 일치하지 않습니다.</span>
				</div>
			</div>
			<div>
				<label for="mail" class="w3-col s3 w3-right-align clrgrey ft14 mgb10">회원메일 : </label>
				<input type="text" name="mail" id="mail" class="w3-col s8 mgl10 w3-input w3-border mgb10">
			</div>
			<div>
				<label for="tel" class="w3-col s3 w3-right-align clrgrey ft14 mgb10">전화번호 : </label>
				<input type="text" name="tel" id="tel" class="w3-col s8 mgl10 w3-input w3-border mgb10">
			</div>
			<div>
				<label class="w3-col s3 w3-right-align clrgrey ft14 mgb10">회원성별 : </label>
				<div class="w3-col s8 mgl10 mgb10 w3-center" id="gen">
					<div class="w3-half">
						<input type="radio" name="gen" id="mgen" class="w3-radio" value="M"> <label for="mgen"> 남자</label>
					</div>
					<div class="w3-half">
						<input type="radio" name="gen" id="fgen" class="w3-radio" value="F"> <label for="fgen"> 여자</label>
					</div>
				</div>
			</div>
			<div class="w3-col" id="avtfr">
				<label class="w3-col s3 w3-right-align clrgrey ft14 mgb10">아 바 타 : </label>
				<div class="w3-col s8 mgl10 mgb10 w3-center">
						<div class="avtboxfr w3-center w3-margin-top" id="mavt">
		<c:forEach var="data" items="${LIST}">
			<c:if test="${data.gen eq 'M'}">
						 	<div class="avtbox">
						 		<label for="mavt${data.ano}">
						 			<img src="/whistle/resources/img/avatar/${data.savename}" class="w3-col avtimg">
						 		</label>
						 		<input type="radio" name="ano" id="mavt${data.ano}" value="${data.ano}">
						 	</div>
			</c:if>
		</c:forEach>
						</div>
						 <div class="avtboxfr w3-center w3-margin-top" id="favt">
		<c:forEach var="data" items="${LIST}">
			<c:if test="${data.gen eq 'F'}">
						 	<div class="avtbox">
						 		<label for="favt${data.ano}">
						 			<img src="/whistle/resources/img/avatar/${data.savename}" class="w3-col avtimg">
						 		</label>
						 		<input type="radio" name="ano" id="favt${data.ano}" value="${data.ano}">
						 	</div>
			</c:if>
		</c:forEach>
				 		</div>
				</div>
			</div>
		</form>
		
		<!-- 버튼 태그 -->
		<div class="w3-col w3-margin-top w3-card-4">
			<div class="w3-third w3-deep-orange w3-hover-orange w3-button" id="rbtn">reset</div> 
			<div class="w3-third w3-green w3-hover-lime w3-button" id="hbtn">home</div> 
			<div class="w3-third w3-blue w3-hover-aqua w3-button" id="jbtn">join</div> 
		</div>
	</div>
</body>
</html>
