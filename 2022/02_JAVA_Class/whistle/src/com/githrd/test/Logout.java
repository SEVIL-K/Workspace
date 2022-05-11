package com.githrd.test;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/test/logout.pink")
public class Logout extends HttpServlet {

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		// 세션에 저장한 데이터 삭제
		session.removeAttribute("SID");
		
		// 로그인 페이지로 새로운 요청을 한다.
		resp.sendRedirect("/whistle/test/login.pink");
	}

}
