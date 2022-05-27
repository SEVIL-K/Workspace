
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%--

<%@page import="com.bbs.BoardDTO"%>
<%@page import="com.bbs.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
 request.setCharacterEncoding("utf-8");
 String cp = request.getContextPath();
 
 String pageNum = request.getParameter("pageNum");
 int num = Integer.parseInt(request.getParameter("num"));
 
 BoardDAO dao = new BoardDAO();
 BoardDTO dto = dao.getReadData(num); //->데이터를 가져온다.
 
 if(dto==null){//-->dto가 null값이라함을 글을 보는도중 누군가 삭제 했을 경우이다.. 그럴경우 list.jsp로 돌아가게 된다.
  response.sendRedirect(cp+"/board/list.jsp?pageNum="+pageNum);
  return;
 }
 
 if(dto.getEmail()==null)
  dto.setEmail("");//앞에서 email은 입력 검사에 넣지 않아서 null값이 들어 갈수 있다.
 
%>
--%>

<!DOCTYPE html>
<html>
<head>
<title>게 시 판</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<link rel="stylesheet" href="<%=cp%>/data/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/board/css/created.css" type="text/css"/>

<script type="text/javascript" src="<%=cp%>/data/js/util.js"></script>
<script type="text/javascript">
    function sendIt() {
        f = document.myForm;

     str = f.subject.value;
     str = str.trim();
        if(!str) {
            alert("\n제목을 입력하세요. ");
            f.subject.focus();
            return;
        }
     f.subject.value = str;

     str = f.name.value;
     str = str.trim();
        if(!str) {
            alert("\n이름을 입력하세요. ");
            f.name.focus();
            return;
        }
  /*
        if(!isValidKorean(str))  {
            alert("\n이름을 정확히 입력하세요");
            f.name.focus();
            return;
        }
  */
     f.name.value = str;

        if(f.email.value) {
      if(!isValidEmail(f.email.value)) {
                alert("\n정상적인 E-Mail을 입력하세요. ");
                f.email.focus();
                return;
      }
        }

     str = f.content.value;
     str = str.trim();
        if(!str) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return;
        }
     f.content.value = str;

     str = f.pwd.value;
     str = str.trim();
        if(!str) {
            alert("\n패스워드를 입력하세요. ");
            f.pwd.focus();
            return;
        }
     f.pwd.value = str;
     
        f.action = "<%=cp%>/board/update_ok.jsp";
        f.submit();
    }

</script>

</head>

<body>

<div id="bbs">
 <div id="bbs_title">
 게 시 판
 </div>

 <form name="myForm" method="post" action="">
 <div id="bbsCreated">
  <div class="bbsCreated_bottomLine">
   <dl>
    <dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
    <dd>
          <input type="text" name="subject" size="74" maxlength="100"  class="boxTF" value="<%=dto.getSubject() %>" />         -->//value속성을 이용해서 초기값을 준다.
    </dd>
   </dl>
  </div>

  <div class="bbsCreated_bottomLine">
   <dl>
    <dt>작성자</dt>
    <dd>
          <input type="text" name="name" size="35" maxlength="20" class="boxTF" value="<%=dto.getName()%>" />
    </dd>
   </dl>
  </div>

  <div class="bbsCreated_bottomLine">
   <dl>
    <dt>E-Mail</dt>
    <dd>
          <input type="text" name="email" size="35" maxlength="50" class="boxTF" value="<%=dto.getEmail()%>" />
    </dd>
   </dl>
  </div>

  <div id="bbsCreated_content">
   <dl>
    <dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
    <dd>
          <textarea name="content" cols="63" rows="12" class="boxTA"><%=dto.getContent()%></textarea>
    </dd>
   </dl>
  </div>

  <div class="bbsCreated_noLine">
   <dl>
    <dt>패스워드</dt>
    <dd>
          <input type="password" name="pwd" size="35" maxlength="7" class="boxTF" value="<%=dto.getPwd() %>"/>&nbsp;(게시물 수정 및 삭제시 필요 !!!)
    </dd>
   </dl>
  </div>
 </div>

 <div id="bbsCreated_footer">
  <input type="hidden" name="num" value="<%=dto.getNum() %>"/><!-- 안보이게 전송되는 값들. -->
  <input type="hidden" name="pageNum" value="<%=pageNum %>"/>
  
        <input type="button" value=" 등록하기 " class="btn2" onclick="sendIt();"/>
        <input type="reset" value=" 다시입력 " class="btn2" onclick="document.myForm.subject.focus();"/>
        <input type="button" value=" 작성취소 " class="btn2" onclick="javascript:location.href='<%=cp%>/board/list.jsp?pageNum=<%=pageNum%>';"/>
 </div>

    </form>
</div>

</body>

</html>