package com.githrd.festival.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.githrd.festival.dao.*;
import com.githrd.festival.vo.*;

public class Main implements FesInter {
	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view ="/main";
		
//		FestivalDao fDao = new FestivalDao();
//		ArrayList<FestivalVO> Info = fDao.getFestivalInfo();
		
		ReviewDao rDao = new ReviewDao();
		ArrayList<ReviewVO> Review = rDao.getMainReview();
		
		// 축제번호 어케 넘겨옴 ??
		//float score = rDao.getAvgScore("");
		
//		req.setAttribute("INFO", Info);
		req.setAttribute("REVIEW", Review);
		
		return view;
	}

}
