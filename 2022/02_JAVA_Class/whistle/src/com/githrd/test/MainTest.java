package com.githrd.test;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/main.pink")
public class MainTest extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse resp) {
		try {
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/main.jsp");
			rd.forward(req, resp);
		} catch(Exception e) {}
		
	}
}
