package com.githrd.test;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/test/test01_redirect.pink")
public class Test01_Redirect extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse resp) 
									throws ServletException, IOException {
		
		req.setAttribute("NAME", "jennie");
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/test/test01_redirect.jsp");
		rd.forward(req, resp);
	}
}
