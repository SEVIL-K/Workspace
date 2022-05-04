package com.githrd.black.controller;

import java.io.PrintWriter;
import java.util.*;

import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/idCheck.pink")
public class AjaxTest extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse resp) {
		// 여기서는 비동기 통신에 대한 테스트만 진행할 예정이므로
		// 데이터베이스에 접근하는 기능은 구현하지 않고
		// 임의로 만든 ArrayList에 필요한 데이터를 넣고
		// 클라이언트가 요청할 때 전달 받은 데이터로 ArrayList에 채워놓은 데이터와
		// 비교해서 응답해주는 것으로 대신한다.
		
		// 리스트데이터 준비
		ArrayList<String> list = new ArrayList<String>();
		list.add("jennie");
		list.add("lisa");
		list.add("rose");
		list.add("jisoo");
		list.add("euns");
		
		// 할일
		// 1. 전달받은 데이터를 꺼낸다.
		String sid = req.getParameter("id");
		System.out.println("sid : " + sid);
		// 2. 전달받은 아이디가 위의 리스트에 있는지 확인한다.
		boolean bool = list.contains(sid);
		// 3. 결과에 따라서 결과를 클라이언트에게 전달한다.
		// 		결과는 JSON 타입으로 전달한다.
		// 따라서 이 함수가 만들어줘야 하는 문서는 
		// 		{"result": "OK"} 또는 {"result": "NO"}
		
		// 응답문서 작성 도구를 꺼낸다.
		PrintWriter pw = null;
		try {
			pw = resp.getWriter();
			pw.println("{");
			if(bool) {
				pw.println("\"result\": \"NO\"");
			} else {
				pw.println("\"result\": \"OK\"");
			}
			pw.println("}");
			
		} catch(Exception e) {}
		
	}
}
