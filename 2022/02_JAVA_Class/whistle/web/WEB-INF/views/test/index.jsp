<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/whistle/resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="/whistle/resources/css/base.css">
<script type="text/javascript" src="/whistle/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#infoX').click(function(){
			$('#infobox').css('display', 'none');
		});
		
		$('#obtn').click(function(){
			$(location).attr('href', '/whistle/test/logout.pink');
		});
		$('#lbtn').click(function(){
			$(location).attr('href', '/whistle/test/login.pink');
		});
		
		$('#ibtn').click(function(){
			var sid = '${SID}';
			if(!sid){
				$(location).attr('href', '/whistle/test/login.pink');
			}
			
			$.ajax({
				url: '/whistle/test/myInfo.pink',
				type: 'post',
				dataType: 'json',
				success: function(data){
					decodeURIComponent(data)
					$('.pdl10 > h4 > span').html('');
					$('#mno').html(data.mno);
					$('#name').html(decodeURIComponent(data.name));
					$('#id').html(data.id);
					$('#tname').html(data.id);
					$('#mail').html(data.mail);
					$('#tel').html(data.tel);
					$('#gen').html(decodeURIComponent(data.gen));
					$('#jdate').html(data.sdate);
					$('#infoavt').attr('src', '/whistle/resources/img/avatar/' + data.savename);
					
					$('#infobox').css('display', 'block');
				},
				error: function(){
					alert('### 통신 에러 ###');
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="w3-content mx650">
<c:if test="${not empty SID}">
		<h1 class="w3-blue w3-padding w3-center">Hello ${SID}</h1>
		<div class="w3-col m2 w3-button w3-red" id="obtn">logout</div>
		<div class="w3-col m2 w3-button w3-green w3-right" id="ibtn">myInfo</div>
</c:if>
<c:if test="${empty SID}">
		<h1 class="w3-blue w3-padding w3-center">Hello JSP!</h1>
		<div class="w3-col m2 w3-button w3-pink" id="lbtn">login</div>
</c:if>
	</div>
	
	<div id="infobox" class="w3-modal">
		<div class="w3-modal-content w3-animate-top w3-card-4 mx650">
			<header class="w3-container w3-pink"> 
				<span class="w3-button w3-display-topright" id="infoX">&times;</span>
				<h2 class="w3-center"><span id="tname"></span> Info</h2>
			</header>
			<div class="w3-container w3-padding">
				<div class="w3-display-container w3-col w3-border-right" style="width: 200px; height: 310px;">
					<div class="avtbox w3-display-middle">
						<img class="avtimg" src="/whistle/resources/img/avatar/noimage.jpg" id="infoavt">
					</div>
				</div>
				<div class="w3-rest w3-text-grey pdl10">
					<h4>회원번호 : <span id="mno"></span></h4>
					<h4>회원이름 : <span id="name"></span></h4>
					<h4>아 이 디 : <span id="id"></span></h4>
					<h4>전화번호 : <span id="tel"></span></h4>
					<h4>이 메 일 : <span id="mail"></span></h4>
					<h4>회원성별 : <span id="gen"></span></h4>
					<h4>가 입 일 : <span id="jdate"></span></h4>
				</div>
			</div>
			<footer class="w3-content w3-margin-top">
				<div class="w3-half w3-button w3-red" id="cbtn">cancel</div>
				<div class="w3-half w3-button w3-blue" id="ebtn">edit</div>
			</footer>
		</div>
	</div>
	
</body>
</html>