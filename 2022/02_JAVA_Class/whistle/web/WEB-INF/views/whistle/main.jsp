<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whistle Main</title>
<link rel="stylesheet" type="text/css" href="/whistle/resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="/whistle/resources/css/base.css">
<script type="text/javascript" src="/whistle/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/whistle/resources/js/whistle/main.js"></script>
<style>
	h5, span {
		height: 20px;
		line-height: 30%;
	}
	.pdh10 > h5 {
		font-size: 10.5pt;
	}
	.pdb3 {
		padding-bottom: 3px;
	}
	
	.mt10 h5 {
		margin-top: 0px;
		margin-bottom: 2px;
	}
	.mt10 {
		margin-top: 30px;
	}
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<form method="POST" action="" id="frm" name="frm">
		<input type="hidden" id="id" name="id" value="${SID}">
	</form>
	<div class="w3-content w3-center mw700">
		<h1 class="w3-teal w3-padding" style="margin-bottom: 5px;">Whistle Project</h1>
		<div class="w3-col">
<c:if test="${empty SID}">
				<div class="w3-col w3-border-bottom pdb3">
					<span class="w3-col m2 w3-button w3-small w3-lime w3-hover-green w3-left" id="jbtn">Join</span>
					<span class="w3-col m2 w3-button w3-small w3-blue w3-hover-light-blue w3-right" id="lbtn">Login</span>
				</div>
</c:if>
				<div class="w3-col" id="btnfr">
<c:if test="${not empty SID}">
					<script type="text/javascript">
						alert('${SID} 님이 로그인했습니다.');
					</script>

					<div class="w3-col w3-border-bottom pdb10">
						<span class="w3-cell m2 w3-button w3-small w3-red w3-hover-light-green w3-right mt0" id="obtn">LogOut</span>
						<span class="w3-cell m2 w3-button w3-small w3-red w3-hover-light-green w3-left mt0" id="ibtn">회원정보</span>
					</div>
</c:if>

					
					<div class="w3-col mt10">
						<div class="w3-col m3 pdh10">
							<h5 class="w3-col w3-button w3-purple w3-hover-amber" id="mlbtn">회원목록</h5>
						</div>
						<div class="w3-col m3 pdh10">
							<h5 class="w3-col w3-button w3-pink w3-hover-light-green" id="gbtn">방명록</h5>
						</div>
						<div class="w3-col m3 pdh10">
							<h5 class="w3-col w3-button w3-red w3-hover-light-green" id="sbtn">설문조사</h5>
						</div>

						<div class="w3-col m3 pdh10">
							<h5 class="w3-col w3-button w3-deep-orange w3-hover-light-green" id="irbtn">댓글쓰기</h5>
						</div>

						<div class="w3-col m3 pdh10">
							<h5 class="w3-col w3-button w3-orange w3-hover-light-green" id="rbtn">댓글게시판</h5>
						</div>
						<div class="w3-col m3 pdh10">
							<h5 class="w3-col w3-button w3-amber w3-hover-light-green" id="fbtn">파일게시판</h5>
						</div>
					</div>
				</div>
		</div>
	</div>
</body>
</html>