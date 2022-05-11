package com.githrd.test;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.githrd.test.dao.*;

//@WebServlet("/test/loginAjax.pink")
public class LoginAjax extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 할일
		// 0. 세션 검사하고
		HttpSession session = req.getSession();
		if(session.getAttribute("SID") != null) {
			resp.sendRedirect("/whistle/");
			return;
		}
		
		// 1. 파라미터 받고
		String pid = req.getParameter("id");
		String ppw = req.getParameter("pw");
		// 임시 비밀번호
		ppw = "12345";
		
		// 2. 데이터베이스 작업하고 결과받고
		MemberDao mDao = new MemberDao();
		int cnt = mDao.getLoginCnt(pid, ppw);
		// 3. 결과에 따라서 처리하고
		// 문저 제작 도구 꺼내오고
		PrintWriter pw = resp.getWriter();
		pw.println("{");
		if(cnt == 1) {
			// 로그인 처리해줘야 하는 경우
			session.setAttribute("SID", pid);
			
			pw.println("\"result\": \"OK\"");
		} else {
			pw.println("\"result\": \"NO\"");
		}
		
		pw.println("}");
	}

}
