package com.githrd.test;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/test/test02.pink")
public class Test02 extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse resp) 
										throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/test/test02.jsp");
		rd.forward(req, resp);
	}
}
