package com.githrd.test.dao;

import java.sql.*;

import com.githrd.test.db.*;
import com.githrd.test.vo.*;
import com.githrd.test.sql.*;

public class AvatarDao {
	private JenyJDBC db;
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private MemberSQL mSQL;
	
	public AvatarDao() {
		db = new JenyJDBC();
		mSQL = new MemberSQL();
	}
	
	// 아바타번호로 아바타 정보 조회 전담 처리함수
	public AvatarVO getAnoInfo(int ano) {
		// 반환값 변수
		AvatarVO aVO = new AvatarVO();
		
		// 1. con
		con = db.getCon();
		// 2. sql
		String sql = mSQL.getSQL(mSQL.SEL_AVT_INFO);
		// 3. pstmt
		pstmt = db.getPstmt(con, sql);
		try{
			// 4. 질의명령 완성하고
			pstmt.setInt(1, ano);
			// 5. 질의명령 보내고 결과받고
			rs = pstmt.executeQuery();
			// 6. 데이터 꺼내고
			rs.next();
			String savename = rs.getString("savename");
			int anum = rs.getInt("ano");
			String dir  = rs.getString("dir");
			String gen = rs.getString("gen");
			// 7. 꺼낸데이터 VO 담고
			aVO.setAno(anum);
			aVO.setSavename(savename);
			aVO.setDir(dir);
			aVO.setGen(gen);
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		// 데이터 반환하고
		return aVO;
	}

}
