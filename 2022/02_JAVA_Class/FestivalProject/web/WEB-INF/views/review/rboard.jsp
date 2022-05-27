<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
       <meta charset="utf-8" />
       <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
       <meta name="description" content="" />
       <meta name="author" content="" />
       <title>리뷰게시판 페이지</title>
       <!-- Favicon-->
       <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
       <!-- Font Awesome icons (free version)-->
       <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
       <!-- Google fonts-->
       <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
       <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
       <!-- Core theme CSS (includes Bootstrap)-->
       <link rel="stylesheet" type="text/css" href="/festival/resources/css/styles.css"/>
       <link rel="stylesheet" type="text/css" href="/festival/resources/css/w3.css"/>
	   <script type="text/javascript" src="/festival/resources/js/jquery-3.6.0.min.js"></script>
	   <script type="text/javascript" src="/festival/resources/js/base.js"></script>
	   <script type="text/javascript" src="/festival/resources/js/tmddus.js"></script>
       <style type="text/css">   
     	.logo {
     		margin: 0px;
     		padding: 0px;
}
.mt {
	margin-top: 100px;
}
.logo {
	margin: 0px;
	padding: 0px;
}

body {
	margin: 0;
	padding: 0;
	font-family: "Montserrat";
}

.searchbox {
	width: 90%;
	margin: 10px auto;
}

.header {
	background: gray;
	overflow: hidden;
	padding: 20px;
	text-align: center;
}

.header h1 {
	text-transform: uppercase;
	color: white;
	margin: 0;
	margin-bottom: 8px;
}

#value {
	border: none;
	background: lightgray;
	padding: 6px;
	font-size: 18px;
	width: 80%;
	border-radius: 6px;
	color: white;
}

#value:focus {
	outline: none;
}

.searchcontainer {
	background: lightgray;
	padding: 1%;
	display: none;
}

.item {
	margin: 3% 0px;
	display: flex;
	align-items: center;
}

.icon {
	width: 25px;
	height: 25px;
	background: #E0D3B6;
	color: white;
	font-size: 15px;
	text-align: center;
	line-height: 25px;
	border-radius: 50%;
	margin-right: 8px;
}

.name {
	font-size: 17px;
	font-weight: 470;
	color: #333;
}

.sub_news,.sub_news th,.sub_news td{border:0}
.sub_news a{color:#383838;text-decoration:none}
.sub_news{width:100%;border-bottom:1px solid #999;color:#666;font-size:12px;table-layout:fixed}
.sub_news caption{display:none}
.sub_news th{padding:5px 0 6px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#f1f1f4;color:#333;font-weight:bold;line-height:20px;vertical-align:top}
.sub_news td{padding:8px 0 9px;border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}
.sub_news .date,.sub_news .hit{padding:0;font-family:Tahoma;font-size:11px;line-height:normal}
.sub_news .title{text-align:left; padding-left:15px; font-size:13px;}
.sub_news .title .pic,.sub_news .title .new{margin:0 0 2px;vertical-align:middle}
.sub_news .title a.comment{padding:0;background:none;color:#f00;font-size:12px;font-weight:bold}
.sub_news tr.reply .title a{padding-left:16px;background:url(/FestivalProject/resources/img/ic_reply.png) 0 1px no-repeat}
</style>
	
	
</head>
<body>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand logo" id="logo" href=""><img src="/festival/resources/img/logo.png" style="width:170px; height:auto"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars ms-1"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
<%--
	나중에 검사
	<c:if test="{empty SID}">
 --%>
                    <li class="nav-item"><a class="nav-link" href="" id="loginbtn">로그인</a></li>
                    <li class="nav-item"><a class="nav-link" href="" id="joinbtn">회원가입</a></li>
<%--
	</c:if>
	<c:if test="${not empty SID}">
--%>
						<li class="nav-item"><a class="nav-link" href="">tmddus</a></li>
                        <li class="nav-item"><a class="nav-link" href="" id="logoutbtn">로그아웃</a></li>	
                        <li class="nav-item"><a class="nav-link" href="" id="mybtn">마이페이지</a></li>
<%--    
    </c:if>
--%>
                    <li class="nav-item"><a class="nav-link" href="" id="infobtn">축제정보</a></li>
                    <li class="nav-item"><a class="nav-link" href="" id="boardbtn">리뷰게시판</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
<div class="w3-content w3-center mx650 mt">
   	<!-- 검색창 
DB에서 목록불러와서 최대10개까지
인기순서대로???
-->
	<div class="searchbox">
		<div class="header">
			<h1>축제 검색</h1>
			<input onkeyup="filter()" type="text" id="value"
				placeholder="축제이름으로 검색하기">
		</div>

		<!-- 이 부분을 모달창으로 -->
		<div class="searchcontainer" id="searchlist">

			<div class="item">
				<span class="icon">1</span> <span class="name"><a href="http://stackoverflow.com">서울 한강축제</a></span>
			</div>

			<div class="item">
				<span class="icon">2</span> <span class="name">광주 비엔날레</span>
			</div>

			<div class="item">
				<span class="icon">3</span> <span class="name">대구 컬러풀</span>
			</div>

			<div class="item">
				<span class="icon">4</span> <span class="name">부산 다이나믹</span>
			</div>

			<div class="item">
				<span class="icon">5</span> <span class="name">인천 돌핀스</span>
			</div>

			<div class="item">
				<span class="icon">6</span> <span class="name">강릉 기행</span>
			</div>

			<div class="item">
				<span class="icon">7</span> <span class="name">상주 곶감</span>
			</div>

			<div class="item">
				<span class="icon">8</span> <span class="name">제주 하르방</span>
			</div>

			<div class="item">
				<span class="icon">9</span> <span class="name">천안 버드나무</span>
			</div>

			<div class="item">
				<span class="icon">10</span> <span class="name">울릉 호박엿</span>
			</div>
		</div>
	</div>

	<div class="w3-content w3-center mx650">
		<div style="margin-top: 100px">
			<h1>리뷰게시판</h1>
			<p>n개의 후기 	평점 : 4.3</p>
		</div>
	</div>
	<div class="w3-button" id="rwritebtn">글쓰기</div>
	<div class="w3-button" id="reditbtn">수정하기</div>



</div>





<!-- 리스트 게시판 시작-->
<div class="w3-content mx650">
<table class="sub_news" border="1" cellspacing="0" summary="게시판의 글제목 리스트">
<caption>게시판 리스트</caption>
<colgroup>
<col>
<col width="110">
<col width="100">
<col width="80">
</colgroup>
<thead>
<tr>
<th scope="col">제목</th>
<th scope="col">글쓴이</th>
<th scope="col">날짜</th>
<th scope="col">조회수</th>
</tr>
</thead>
<tbody>
<tr>
<td class="title">
<a href="#">후기 제목</a>
<img width="13" height="12" class="pic" alt="첨부이미지" src="/FestivalProject/resources/img/ic_pic.gif"> <a class="comment" href="#">[8]</a> <img width="10" height="9" class="new" alt="새글" src="/FestivalProject/resources/img/ic_new.gif">
</td>
<td class="name">글쓴이</td>
<td class="date">2022/05/05</td>
<td class="hit">1111</td>
</tr>
<tr class="reply">
<td class="title" style="padding-left:30px;">
<a href="#">후기 답글</a>
</td>
<td class="name">답글맨</td>
<td class="date">2944/02/64</td>
<td class="hit">0</td>
</tr>
<tr>
<td class="title">
<a href="#">후기 제목</a>
<img width="13" height="12" class="pic" alt="첨부이미지" src="/FestivalProject/resources/img/ic_pic.gif"> <a class="comment" href="#">[0]</a> <img width="10" height="9" class="new" alt="새글" src="/FestivalProject/resources/img/ic_new.gif">
</td>
<td class="name">글쓴이</td>
<td class="date">2022/05/05</td>
<td class="hit">1111</td>
</tr>
<tr>
<td class="title">
<a href="#">후기 제목</a>
<img width="13" height="12" class="pic" alt="첨부이미지" src="/FestivalProject/resources/img/ic_pic.gif"> <a class="comment" href="#">[0]</a> <img width="10" height="9" class="new" alt="새글" src="/FestivalProject/resources/img/ic_new.gif">
</td>
<td class="name">글쓴이</td>
<td class="date">2022/05/05</td>
<td class="hit">1111</td>
</tr>
<tr>
<td class="title">
<a href="#">후기 제목</a>
<img width="13" height="12" class="pic" alt="첨부이미지" src="/FestivalProject/resources/img/ic_pic.gif"> <a class="comment" href="#">[4]</a> <img width="10" height="9" class="new" alt="새글" src="/FestivalProject/resources/img/ic_new.gif">
</td>
<td class="name">글쓴이</td>
<td class="date">2022/05/05</td>
<td class="hit">1111</td>
</tr>
<tr>
<td class="title">
<a href="#">후기 제목</a>
<img width="13" height="12" class="pic" alt="첨부이미지" src="/FestivalProject/resources/img/ic_pic.gif"> <a class="comment" href="#">[0]</a> <img width="10" height="9" class="new" alt="새글" src="/FestivalProject/resources/img/ic_new.gif">
</td>
<td class="name">글쓴이</td>
<td class="date">2022/05/05</td>
<td class="hit">1111</td>
</tr>
<tr>
<td class="title">
<a href="#">후기 제목</a>
<img width="13" height="12" class="pic" alt="첨부이미지" src="/FestivalProject/resources/img/ic_pic.gif"> <a class="comment" href="#">[0]</a> <img width="10" height="9" class="new" alt="새글" src="/FestivalProject/resources/img/ic_new.gif">
</td>
<td class="name">글쓴이</td>
<td class="date">2022/05/05</td>
<td class="hit">1111</td>
</tr>
<tr>
<td class="title">
<a href="#">후기 제목</a>
<img width="13" height="12" class="pic" alt="첨부이미지" src="/FestivalProject/resources/img/ic_pic.gif"> <a class="comment" href="#">[99]</a> <img width="10" height="9" class="new" alt="새글" src="/FestivalProject/resources/img/ic_new.gif">
</td>
<td class="name">글쓴이</td>
<td class="date">2022/05/05</td>
<td class="hit">1111</td>
</tr>
<tr>
<td class="title">
<a href="#">후기 제목</a>
<img width="13" height="12" class="pic" alt="첨부이미지" src="/FestivalProject/resources/img/ic_pic.gif"> <a class="comment" href="#">[0]</a> <img width="10" height="9" class="new" alt="새글" src="/FestivalProject/resources/img/ic_new.gif">
</td>
<td class="name">글쓴이</td>
<td class="date">2022/05/05</td>
<td class="hit">1111</td>
</tr>
<tr>
<td class="title">
<a href="#">후기 제목</a>
<img width="13" height="12" class="pic" alt="첨부이미지" src="/FestivalProject/resources/img/ic_pic.gif"> <a class="comment" href="#">[0]</a> <img width="10" height="9" class="new" alt="새글" src="/FestivalProject/resources/img/ic_new.gif">
</td>
<td class="name">글쓴이</td>
<td class="date">2022/05/05</td>
<td class="hit">1111</td>
</tr>




<!-- tr이 제목 1줄입니다 보일 list 갯수만큼 li반복합니다.-->
</tbody>
</table>
</div>
<!-- 리스트 게시판 끝-->
   
    
    
        <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script type="text/javascript" src="/festival/resources/js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</html>