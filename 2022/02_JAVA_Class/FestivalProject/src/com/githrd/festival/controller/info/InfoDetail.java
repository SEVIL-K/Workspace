package com.githrd.festival.controller.info;
/*
    Created by HG on 2022-05-26
    
*/

import com.githrd.festival.controller.FesInter;
import com.githrd.festival.dao.FinfoDao;
import com.githrd.festival.vo.FestivalVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class InfoDetail implements FesInter {
    @Override
    public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String view = "/info/finfodetail";


        String num = req.getParameter("fno");
        if (num == null) {
            System.out.println("fno가 범인이다");
            return view;
        }
        int fno = Integer.parseInt(req.getParameter("fno"));


        String num2 = req.getParameter("nowPage");
        if (num2 == null) {
            System.out.println("nowPage가 범인이다");
            return view;
        }
        int nowPage = Integer.parseInt(req.getParameter("nowPage"));



        FinfoDao fDao = new FinfoDao();
        FestivalVO fVO = fDao.getFestDetail(fno);

        req.setAttribute("DATA", fVO);
        req.setAttribute("nowPage", nowPage);

        return view;
    }
}
