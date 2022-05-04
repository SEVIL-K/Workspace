package com.githrd.test;
/*
    Created by HG on 2022-05-04
    
*/

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MainTest extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse resp)  {
        try {
            RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/main.jsp");
            rd.forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
