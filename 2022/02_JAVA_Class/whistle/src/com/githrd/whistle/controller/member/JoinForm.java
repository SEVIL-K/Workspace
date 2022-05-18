package com.githrd.whistle.controller.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.githrd.whistle.controller.*;
import com.githrd.whistle.dao.*;
import com.githrd.whistle.vo.*;

public class JoinForm implements BlpInter {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view = "/member/join";
		// 세션 검사를 하고
		HttpSession session = req.getSession();
		if(session.getAttribute("SID") != null) {
			// 로그인 한 경우
			// 리다이렉트 셋팅
			req.setAttribute("isRedirect", true);
			// 요청주소 반환하고
			return "/whistle/main.blp";
		}
		MemberDao mDao = new MemberDao();
		ArrayList<MemberVO> list = mDao.getAvtList();
		
		// 데이터 심고
		req.setAttribute("LIST", list);
		
		// 뷰 부르고
		return view;
	}

}
