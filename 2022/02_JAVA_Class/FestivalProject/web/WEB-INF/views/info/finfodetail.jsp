<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>축제정보디테일 페이지</title>
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
    <style type="text/css">
        .logo {
            margin: 0px;
            padding: 0px;
        }
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

<div class="w3-content w3-center mx650">
    <div class="w3-col" style="margin-top: 200px; margin-bottom:100px;">
        <h1>축제정보보기</h1>
    </div>
    <hr>
</div>

<div class="w3-content">
    <div class="top_area w3-center">
        <div class="tag_area"></div>
        <div class="status_area"></div>
        <h2 id="mainTitles">${DATA.fname}</h2>
        <div class="addr_area" id="top_addr">
            <span>${DATA.foplace}  |  </span>
            <span style="color:gray">${DATA.sdate} ~ ${DATA.edate}</span>
        </div>
    </div>
    <div class="detail_area">
        <div class="fest_img w3-center">
            <img src="/festival/resources/img/poster1.jpg" alt="" class="img-fluid img-circle" style="width:200px; height: auto; margin-top:20px; margin-bottom:20px;">
        </div>
        <hr>
        <div class="fest_detail">
            <h3 style="text-align:left">축제 상세정보</h3>
            <div class="txt_area" style="padding-bottom: 50px; overflow:hidden; height: 100px; text-align:left">
                <p>${DATA.fcontext}</p>
                <hr>
            </div>
            <div class="info_area" style="padding-bottom: 50px; overflow:hidden; height: 200px">
                <ul>
                    <li><strong>시작일</strong><span>${DATA.sdate}</span></li>
                    <li><strong>종료일</strong><span>${DATA.edate}</span></li>
                    <li><strong>전화번호</strong><span>${DATA.ftel}</span></li>
                    <li><strong>홈페이지</strong><span><a href="${DATA.fhaddr}" target="_blank">${DATA.fhaddr}</a></span></li>
                    <li><strong>행사장소</strong><span>${DATA.foplace}</span></li>
                    <li><strong>주소</strong><span>${DATA.froadaddr}</span></li>
<%--                    <li><strong>주최</strong><span>주최</span></li>--%>
<%--                    <li><strong>주관</strong><span>주관</span></li>--%>
<%--                    <li><strong>이용요금</strong><span>무료/ 유료</span></li>--%>
                    <li><strong>행사시간</strong><span>홈페이지 참고</span></li>
                </ul>
            </div>
            <div style="height: 30px"> </div>
        </div>
    </div>
</div>