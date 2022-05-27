package com.githrd.festival.db;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;

/**
 * 이 클래스는 커넥션 풀에 있는 커넥션을 이용해서
 * 데이터베이스 작업에 필요한 자원을 만들어주는 유틸리티적인 클래스이다.
 * @author	전은석
 * @since	2022.05.12
 * @version	v.1.0
 *
 */

public class FesDBCP {
	// 커넥션 풀을 관리할 변수를 준비한다.
	private DataSource ds;
	
	/*
		이 클래스를 누군가 new 시키면
		context.xml 파일에 등록된 자원을 자기고 오도록 해야 한다.
		이처럼 context.xml 파일에 등록된 자원을 가지고 오는 기법을
		JNDI(Java Naming and Directory Interface) 기법이라고 한다.
	 */
	
	public FesDBCP() {
		try {
			// 1. context.xml 파일에 등록된 자원을 알아낸다.
			InitialContext context = new InitialContext();
			// 2. 그 중에서 필요한 자원을 얻어온다.
			ds = (DataSource) context.lookup("java:/comp/env/jdbc/TestDB");
			/*
				찾을 이름을 정하는 규칙
					java:/comp/env/찾을이름
				
				우리의 경우
					
					java:/comp/env/jdbc/TestDB
					
				==>  서버의 환경중에서 jdbc/TestDB 라는 이름의 자원을 찾아주세요.
					==> 커넥션 풀을 찾아주세요.
					
					
				==> 이 작업이 무사히 완료되면
					커넥션 풀을 찾아서 기억해뒀다(ds 변수에..)는 것이 된다.
			 */
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 필요한 순간에 접속을 해야할 경우
	 * 이때 접속은 직접 하는 것이 아니고
	 * 커넥션 풀이 가지고 있는 커넥션을 하나 꺼내오는 것이된다.
	 */
	public Connection getCon() {
		// 반환값 변수
		Connection con = null;
		try {
			// ==> 커넥션 풀을 관리하는 DataSource 에서 하나 꺼내온다.
			con = ds.getConnection();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
	public Statement getSTMT(Connection con) {
		// 반환값 변수
		Statement stmt = null;
		try {
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		} catch(Exception e) {}
		
		return stmt;
	}
	
	// PreparedStatement 가 필요하면 만들어주는 함수
	public PreparedStatement getPSTMT(Connection con, String sql) {
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		} catch(Exception e) {}
		return pstmt;
	}
	
	//  다 사용한 자원을 되돌려주는 함수
	public void close(Object o) {
		/*
			이 함수를 호출할 때 어떤 자원을 입력해서 
			호출할 지 알 수 없으므로
			모든 타입을 받을 수 있는 Object 타입으로 받기로 한다.
			
			그리고 입력된 데이터의 타입을 확인한 후 
			확인된 형태로 강제형변환 한 후 닫으면 된다.
		 */
		try {
			if(o instanceof Connection) {
				((Connection) o).close();
			} else if(o instanceof Statement) {
				((Statement) o).close();
			} else if(o instanceof PreparedStatement) {
				((PreparedStatement) o).close();
			} else if(o instanceof ResultSet) {
				((ResultSet) o).close();
			}
		} catch(Exception e) {}
	}
}













