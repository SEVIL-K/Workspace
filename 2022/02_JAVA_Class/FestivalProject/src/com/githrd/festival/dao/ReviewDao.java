package com.githrd.festival.dao;

import java.sql.*;
import java.util.*;

import com.githrd.festival.db.*;
import com.githrd.festival.sql.*;
import com.githrd.festival.vo.*;

public class ReviewDao {
	private FesDBCP db;
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private ReviewSQL rSQL;
	
	public ReviewDao() {
		db = new FesDBCP();
		rSQL = new ReviewSQL();
	}
	
	// 메인페이지 리뷰 보여주는 함수
	
	public ArrayList<ReviewVO> getMainReview() {
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
		con = db.getCon();
		String sql = rSQL.getSQL(rSQL.SEL_MAIN_REVIEW);
		stmt = db.getSTMT(con);
		try {
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				ReviewVO rVO = new ReviewVO();
				rVO.setRno(rs.getInt("review_no"));
				rVO.setFname(rs.getString("fest_name"));
				rVO.setTitle(rs.getString("review_title"));
				rVO.setBody(rs.getString("review_body"));
				rVO.setWriter(rs.getString("review_wname"));
				rVO.setScore(rs.getFloat("review_score"));
				list.add(rVO);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(stmt);
			db.close(con);
		}
		return list;
	}
	
	// 메인페이지 후기 평점 함수
	public float getAvgScore(int fno) {
		float score = 0;
		
		con = db.getCon();
		String sql = rSQL.getSQL(rSQL.SEL_AVG_SCORE);
		pstmt = db.getPSTMT(con, sql);
		try {
			pstmt.setInt(1, fno);
			
			rs = pstmt.executeQuery();
			rs.next();
			score = rs.getFloat("score");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		return score;
	}
	
}
