package com.githrd.festival.controller.info;
/*
    작성자 : 윤한기
    작성일 : 22-05-22
*/

import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

import com.githrd.festival.controller.*;
import com.githrd.festival.dao.FinfoDao;
import com.githrd.festival.util.PageUtil;
import com.githrd.festival.vo.FestivalVO;

public class InfoForm implements FesInter {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view ="/info/finfo";
		int nowPage = 1;
		if (req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}

		// 검색어가 있으면 fno = null로 넘겨주고
		// 검색어가 없으면 fno = 넣어주고
		FinfoDao fDao = new FinfoDao();
		int resultCnt = fDao.calCount();
		PageUtil pag = new PageUtil();
		ArrayList<FestivalVO> list = new ArrayList<FestivalVO>();

		if (req.getParameter("schstr") != null) {
			String str = req.getParameter("schstr");
			pag = new PageUtil(nowPage, resultCnt, 5, 5);
			list = fDao.schKeywordInfo(pag, str);

			System.out.println("str : " + str);
		} else if (req.getParameter("schstr") == null){
			pag = new PageUtil(nowPage, resultCnt, 5, 5);
			list = fDao.schFestInfo(pag);
		}


		req.setAttribute("LIST", list);
		req.setAttribute("PAGE", pag);

		return view;
	}

}
