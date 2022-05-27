<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
       <meta charset="utf-8" />
       <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
       <meta name="description" content="" />
       <meta name="author" content="" />
       <title>마이페이지</title>
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
   		<div class="w3-col" style="margin-top: 200px">
	   		<h1>마이페이지</h1>
	   		<h1>즐겨찾기목록</h1>
	   		<h1>내가쓴후기</h1>
	    </div>
   </div>
    
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