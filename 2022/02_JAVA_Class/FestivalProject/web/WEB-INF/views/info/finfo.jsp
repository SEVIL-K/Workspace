<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>축제정보 페이지</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico"/>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" type="text/css" href="/festival/resources/css/styles.css"/>
    <link rel="stylesheet" type="text/css" href="/festival/resources/css/w3.css"/>
    <script type="text/javascript" src="/festival/resources/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="/festival/resources/js/base.js"></script>
    <script type="text/javascript" src="/festival/resources/js/tmddus.js"></script>
    <script type="text/javascript" src="/festival/resources/js/finfo.js"></script>
    <style type="text/css">
        .logo {
            margin: 0px;
            padding: 0px;
        }

        .star input {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            opacity: 0;
            cursor: pointer;
        }

        .star span {
            width: 0;
            position: absolute;
            left: 0;
            color: red;
            overflow: hidden;
            pointer-events: none;
        }
    </style>

</head>
<body>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand logo" id="logo" href=""><img src="/festival/resources/img/logo.png"
                                                            style="width:170px; height:auto"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
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
    <div class="w3-col" style="margin-top: 200px; margin-bottom: 50px">
        <h1>축제정보</h1>
        <div class="w3-right">
            <input type="text" id="searchtxt" name="searchtxt">
            <button id="searchbtn">검색</button>
        </div>
    </div>
    <hr>
</div>

<%--축제 리스트--%>
<div class="w3-content w3-center">
    <c:forEach var="data" items="${LIST}">
    <div class="row py-1">
            <%-- 이미지 --%>
        <div class="w3-col m3">
            <img src="/festival/resources/img/poster1.jpg" alt="" class="img-fluid img-circle"
                 style="width:200px; height: auto; margin-bottom:15px;">
        </div>
        <div class="w3-col m7" style="text-align : left;">
                <%-- 축제이름 --%>
            <div class="fest_title w3-button" id="${data.fno}"><h2>${data.fname}</h2></div>

                <%-- 시작일 종료일 --%>
            <div class=" fest_date" style="color:gray" ><h5>${data.sdate} ~ ${data.edate}</h5></div>

                <%-- 소개 --%>
            <div class="fest_info"><h5>${data.fcontext}</h5></div>
        </div>
        <div class="w3-col m2">
                <%-- 평점 --%>
            <div class="wrap-star">
                <h4>평점 : 4.0</h4>
                <div class='star-rating'>
                    <span style="width: 80%"></span>
                </div>
            </div>
        </div>
        <hr>
        </c:forEach>
    </div>

<%-- 페이지 버튼 --%>
    <div class="w3-center">
        <div class="w3-bar w3-border w3-margin-top w3-margin-bottom">
            <c:if test="${PAGE.startPage eq 1}">
                <div class="w3-bar-item w3-light-grey">&laquo;</div>
            </c:if>
            <c:if test="${PAGE.startPage ne 1}">
                <div class="w3-bar-item w3-button w3-hover-blue pbtn" id="${PAGE.startPage - 1}">&laquo;</div>
            </c:if>
            <c:forEach var="page" begin="${PAGE.startPage}" end="${PAGE.endPage}">
                <c:if test="${page eq PAGE.nowPage}">
                    <div class="w3-bar-item w3-orange">${page}</div>
                </c:if>
                <c:if test="${page ne PAGE.nowPage}">
                    <div class="w3-bar-item w3-button w3-hover-blue pbtn" id="${page}">${page}</div>
                </c:if>
            </c:forEach>
            <c:if test="${PAGE.endPage eq PAGE.totalPage}">
                <div class="w3-bar-item w3-light-grey">&raquo;</div>
            </c:if>
            <c:if test="${PAGE.endPage ne PAGE.totalPage}">
                <div class="w3-bar-item w3-button w3-hover-blue pbtn" id="${PAGE.endPage + 1}">&raquo;</div>
            </c:if>
        </div>
    </div>


    <!-- 데이터 전송용 form 태그 -->
    <form method="POST" action="/festival/info/finfo.fes" id="frm" name="frm">
        <input type="hidden" id="nowPage" name="nowPage" value="${PAGE.nowPage}">
        <input type="hidden" id="fno" name="fno">
        <input type="hidden" id="schstr" name="schstr">
    </form>
</body>

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