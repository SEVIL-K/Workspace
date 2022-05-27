package com.githrd.festival.dispatch;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.githrd.festival.controller.*;

/**
 * 	이 클래스는 .blp라는 확장자로 요청이 된 경우 
 * 	요청 내용을 분석하고 실행할 클래스를 선택해서 실행(디스패치)시켜줄 서블릿클래스이다.
 * @author	이승연
 * @since	2022/05/11
 * @version	v.1.0
 * @see
 * 			com.githrd.jennie.controller.member.whistle.controller.BlpInter
 * 			com.githrd.whistle.resources.blp.properties
 * 
 * 			작업이력 ]
 * 				2022.05.11	-	클래스제작
 * 								담당자 : 
 *
 */


// 이 서블릿이 언제 실행될지 url-pattern을 지정하는 부분
@WebServlet("*.fes")
public class FesDispatch extends HttpServlet {

	private HashMap<String, FesInter> map; // 실제요청내용과 실제 실행할 객체를 입력할 맵
	
	public void init(ServletConfig config) throws ServletException {
		/*
			할일 ]
				최초로 이 서블릿이 시작되면(.blp 로 처음 요청이 올때...)
				준비된 properties 파일을 읽어서
				이것을 이용해서 맵을 만들어 놓는다.
				즉, 요청이 오면 사용할 클래스가 무엇인지를 먼저 등록해놓는다.
		 */
		
		// 파일에서 직접 읽어서 Map으로 만들어야 하므로
		// Properties 라는 클래스를 이용해서 작업한다.
		Properties prop = new Properties();
		FileInputStream fin = null;
		try {
			// 파일을 스트림으로 만들어서
			String path = this.getClass().getResource("").getPath();
			path = path + "../resources/fes.properties";
//			System.out.println("### dispatch path : " + path);
			fin = new FileInputStream(path);
			
			prop.load(fin);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fin.close();
			} catch(Exception e) {}
		}
		
		// properties에 기억된 클래스의 경로를 이용해서 Map을 완성한다.
		
		map = new HashMap<String, FesInter>();
		// 키값만 뽑아오고
		Enumeration en = prop.keys();
		// 키값에 해당하는 클래스 객체를 만들어서 map에 채운다.
		while(en.hasMoreElements()) {
			String key = (String) en.nextElement();
			// 실행할 클래스 경로 꺼내고...
			String classPath = prop.getProperty(key);
			try {
				Class tmp = Class.forName(classPath);
				// 실제 실행가능한 객체로 만들고...
				Object o = tmp.newInstance();
				map.put(key, (FesInter)o);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

	/*
	 	.blp 라는 확장자로 요청이 왔을때 매번 실행되는 함수
	 */
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
			이 함수에서는 실제 요청내용을 분석하고
			실행할 객체(클래스)를 꺼내서 요청을 처리해주면 된다.
		 */
		
		/*
		 	참고 ]
		 		이 함수를 실행할 때 이 함수가 뷰를 처리하는 방식이
		 		 forward, redirect, ajax 도 동시에 처리를 해야한다.
		 		 
		 		 따라서 각각의 작업을 구분해줄 수 있는 변수를 만들어서 처리하기로 하자.
		 		 
		 		 이때 변수는 실제 실행되는 함수내에서도 알수 있어야 하므로
		 		 요청 객체에 기억시키기로 한다.
		 		 
		 */
		
		Boolean bool = false;
		req.setAttribute("isRedirect", bool);
		/*
			이때 
				isRedirect의 속성값이 false 인경우는 forward 로 처리하고
									  true 인 경우는 redirect 로 처리하고
									  null 인 경우는 비동기 통신으로 처리하면 된다.
		 */
		
		// 1. 전체 요청 내용을 알아내고
		String full = req.getRequestURI();
		
		// 2. 도메인을 찾아낸다.
		String domain = req.getContextPath();
//		System.out.println("# service full : " + full);
//		System.out.println("# service domain : " + domain);
		// 3. 실제요청을 알아내고
 		String real = full.substring(domain.length());
 		
 		// 원하는 컨트롤러를 선택해서
 		// 위에서 map에 등록된 것을 이용해서 꺼내면 된다.
 		FesInter fes = map.get(real);
 		
 		// 응답문서 인코딩
 		resp.setCharacterEncoding("UTF-8");
 		
 		// 실행하고
 		String view = fes.exec(req, resp);
 		
 		bool = (Boolean) req.getAttribute("isRedirect");
 		
 		if(bool == null) {
 			// 이 경우는 비동기 통신이 처리되어야 한다.
 			PrintWriter pw = resp.getWriter();
 			pw.print(view);
 		} else if(bool) {
 			// 리다이렉트 작업으로 처리해야되는 경우
 			resp.sendRedirect(view);
 		} else {
 			// 포워드 시켜야 하는 경우
 			String prefix = "/WEB-INF/views";
 			String surrfix = ".jsp";
 			 			
 			RequestDispatcher rd = req.getRequestDispatcher(prefix + view + surrfix);
 			rd.forward(req, resp);
 		}
 		
	}

}
