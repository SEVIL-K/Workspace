package com.githrd.whistle.controller.member;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.githrd.whistle.controller.*;
import com.githrd.whistle.dao.*;

public class LoginProc implements BlpInter {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
			여기에서 작업은 
			로그인 처리 결과에 상관없이 
			요청이 새로 생겨야하는 작업이다.
			로그인 처리에 성공한 경우에는 
				main.blp
			로 다시 요청해야되고
			로그인 처리에 실패한 경우는
				/member/login.blp
			를 다시 요청해야 한다.
			
			그리고 만약 이미 로그인 한 경우는
				/main.blp
			를 다시 요청해야 한다.
			
			위에서 살폈듯이 어떤 상황에서든 요청을 새롭게 만들어야 한다.
			따라서 리다이렉트가 되어야한다.
			
		 */
		req.setAttribute("isRedirect", true);
		String view = "/whistle/main.blp";
		if(req.getSession().getAttribute("SID") != null) {
			// 이미 로그인 한 상태...
			return view;
		}
		
		// 아직 로그인 안된상태
		// 할일
		// 파라미터 받고
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		// 데이터베이스작업을 하고 결과받고
		MemberDao mDao = new MemberDao();
		int cnt = mDao.getLogin(id, pw);
		// 결과에 따라서 처리하고
		if(cnt == 1) {
			// 아이디와 비밀번호가 일치하는 회원이 1명 존재한다는 것이므로
			// 로그인 처리해준다.
			req.getSession().setAttribute("SID", id);
			// 세션에 데이터 기록했으면 메인페이지로 돌려보낸다.
			// 메인페이지로 돌려보내는 뷰는 위에서 만들어 뒀으니 그냥 사용하면된다.
		} else {
			// 로그인 처리하면 안된다.
			// 정보가 정확하지 않거나 없는 회원이다.
			view = "/whistle/member/login.blp";
		}
		
		return view;
	}

}
