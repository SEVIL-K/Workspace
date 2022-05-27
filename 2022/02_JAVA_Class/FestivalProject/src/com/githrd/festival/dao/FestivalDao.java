//package com.githrd.festival.dao;
//
//import java.sql.*;
//import java.util.*;
//
//import com.githrd.festival.db.*;
//import com.githrd.festival.sql.*;
//import com.githrd.festival.vo.*;
//
//public class FestivalDao {
//	private FesDBCP db;
//	private Connection con;
//	private Statement stmt;
//	private PreparedStatement pstmt;
//	private ResultSet rs;
//
//	private FestivalSQL fSQL;
//
//	public FestivalDao() {
//		db = new FesDBCP();
//		fSQL = new FestivalSQL();
//	}
//
//	// 메인페이지 축제 정보 전담 처리 함수
//	public ArrayList<FestivalVO> getFestivalInfo() {
//		ArrayList<FestivalVO> list = new ArrayList<FestivalVO>();
//		con = db.getCon();
//		String sql = fSQL.getSQL(fSQL.SEL_MAIN_INFO);
//		stmt = db.getSTMT(con);
//		try {
//			rs = stmt.executeQuery(sql);
//			while(rs.next()) {
//				FestivalVO fVO = new FestivalVO();
//				fVO.setFno(rs.getInt("fest_no"));
//				fVO.setFname(rs.getString("fest_name"));
//				fVO.setPlace(rs.getString("open_place"));
//				fVO.setSs(rs.getDate("sdate"));
//				fVO.setSdate();
//				fVO.setEe(rs.getDate("edate"));
//				fVO.setEdate();
//				list.add(fVO);
//			}
//		} catch(Exception e) {
//			e.printStackTrace();
//		} finally {
//			db.close(rs);
//			db.close(stmt);
//			db.close(con);
//		}
//		return list;
//	}
//}
