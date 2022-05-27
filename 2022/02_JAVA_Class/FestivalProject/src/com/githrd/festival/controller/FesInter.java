package com.githrd.festival.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public interface FesInter {
	String exec(HttpServletRequest req, HttpServletResponse resp) 
									throws ServletException, IOException;
}
