<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax Test</title>
<link rel="stylesheet" type="text/css" href="/whistle/resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="/whistle/resources/css/base.css">
<script type="text/javascript" src="/whistle/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.ano').click(function(){
			// 할일
			// 1. 어떤 버튼이 클릭이 됬는지 알아낸다.
			var txt = $(this).html();
			txt = txt.substring(3);
			
			$.ajax({
				url: '/whistle/test/avtInfo.pink',
				type: 'post',
				dataType: 'json',
				data: {
					ano: txt
				},
				success: function(data){
					/*
						{
							"ano": "11",
							"savename": "img_avatar1.png",
							"dir": "/img/avatar/",
							"gen": "M"
						}
					*/
					
					var ano = data.ano;
					var sname = data.savename;
					var dir = data.dir;
					var gen = ((data.gen == 'M') ? '남자':'여자');
					
					$('.avtbox').attr('src', '/whistle/resources/img/avatar/' + sname);
					$('#anum').html(ano);
					$('#aname').html(sname);
					$('#adir').html(dir);
					$('#agen').html(gen);
				},
				error: function(){
					alert('### 통신 에러 ###');
				}
			});
		});
		
//		alert($('#d1').text());
	});
</script>
</head>
<body>
	<div class="w3-content w3-center mx650">
		<h1 class="w3-green w3-padding">아바타 리스트</h1>
		<div class="w3-container w3-margin-top" id="d1">
<c:forEach var="ano" begin="11" end="16">
			<div class="box ml10 w200 w3-blue w3-margin-top w3-padding w3-button ano">avt${ano}</div>
</c:forEach>
		</div>
		
		<!-- 아바타 정보태그 -->
		<div class="w3-col w3-padding w3-margin-top w3-card-4">
			<h1 class="w3-blue"><span id="atitle">noimage</span> Info</h1>
			<div class="w3-col w3-display-container w3-border" 
										style="width: 250px; height: 250px;">
				<img src="/whistle/resources/img/avatar/noimage.jpg" 
										class="avtbox w3-display-middle">
			</div>
			<div class="w3-rest w3-left-align">
				<h4>아바타번호 : <span id="anum"></span></h4>
				<h4>저장 이름 : <span id="aname"></span></h4>
				<h4>저장 경로 : <span id="adir"></span></h4>
				<h4>아바타성별 : <span id="agen"></span></h4>
			</div>
		</div>
	</div>
</body>
</html>