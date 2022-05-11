package com.githrd.test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.githrd.test.dao.MemberDao;

@WebServlet("/test/loginProc.pink")
public class LoginProc extends HttpServlet {
    
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 세션 검사
		String sid = (String) req.getSession().getAttribute("SID");
		if(sid != null) {
			// 이미 로그인한 경우이므로 메인으로 리다이렉트 시킨다.
			resp.sendRedirect("/whistle/");
			return;
		}
		
		// 할일
		// 1. 파라미터 받고
		String pid = req.getParameter("id");
		String ppw = req.getParameter("pw");
		
		// 여기서는 데이터베이스에 있는 비밀번호로 임시로 강제로 셋팅한다.
		ppw = "12345";
		
		// 2. 데이터베이스 작업하고(데이터베이스 작업은 dao 클래스에서 전담)
		MemberDao mDao = new MemberDao();
		int cnt = mDao.getLoginCnt(pid, ppw);
		// 3. 결과 받아서 처리하고
		/*
			데이터베이스 작업 처리 결과에 따라서
			카운트가 1인 경우는 입력한 아이디와 비밀번호가 맞는 회원이 1명이 있다는 것이고
			카운트가 0인 경우는 없는 회원이라는 것이다.
			
			따라서 카운트가 1인경우는 로그인 처리를 해고 메인페이지로 돌려보내고
			카운트가 0인 경우는 다시 로그인 페이지로 돌려보내야 한다.
			
			참고 ]
				로그인 처리
					세션에 "SID" 라는 키값으로 아이디를 입력해놓기로 약속했다.
		 */
		
		if(cnt == 1) {
			// 로그인 처리를 하고
			req.getSession().setAttribute("SID", pid);
			// 메인페이지로 리다이렉트
			resp.sendRedirect("/whistle/");
		} else {
			// 로그인 페이지로 돌려보낸다.
			resp.sendRedirect("/whistle/test/login.pink");
		}
	}

}
