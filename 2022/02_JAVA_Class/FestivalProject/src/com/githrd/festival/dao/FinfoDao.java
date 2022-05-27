package com.githrd.festival.dao;
/*
    작성자 : 윤한기
    작성일 : 22-05-22
*/

import com.githrd.festival.db.FesDBCP;
import com.githrd.festival.sql.FinfoSQL;
import com.githrd.festival.util.PageUtil;
import com.githrd.festival.vo.FestivalVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class FinfoDao {
    private FesDBCP db;
    private Connection con;
    private Statement stmt;
    private PreparedStatement pstmt;
    private ResultSet rs;

    private FinfoSQL iSQL;

    public FinfoDao() {
        db = new FesDBCP();
        iSQL = new FinfoSQL();
    }

    public ArrayList<FestivalVO> schFestInfo(PageUtil pag) {
        ArrayList<FestivalVO> list = new ArrayList<FestivalVO>();

        con = db.getCon();
        String sql = iSQL.getSQL(iSQL.SCH_FEST_INFO);
        pstmt = db.getPSTMT(con, sql);

        try {
            pstmt.setInt(1, pag.getStartCont());
            pstmt.setInt(2, pag.getEndCont());

            rs = pstmt.executeQuery();
            while (rs.next()) {
                FestivalVO iVO = new FestivalVO();
                iVO.setFno(rs.getInt("FNO"));
                iVO.setFname(rs.getString("FNAME"));
                iVO.setFcontext(rs.getString("FCONTEXT"));
                iVO.setHsdate(rs.getDate("sdate"));
                iVO.setHedate(rs.getDate("edate"));
                iVO.setSdate();
                iVO.setEdate();
                iVO.setIdir(rs.getString("FEST_IMG_SDIR"));
                iVO.setRsco(rs.getInt("REVIEW_SCORE"));
                list.add(iVO);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close(rs);
            db.close(pstmt);
            db.close(con);
        }
        return list;
    }

    public int calCount() {
        int cnt = 0;

        con = db.getCon();
        String sql = iSQL.getSQL(iSQL.CAL_FEST_CNT);
        stmt = db.getSTMT(con);

        try {
            rs = stmt.executeQuery(sql);
            rs.next();

            cnt = rs.getInt("cnt");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close(rs);
            db.close(stmt);
            db.close(con);
        }
        return cnt;
    }

    public FestivalVO getFestDetail(int fno) {
        FestivalVO fVO = new FestivalVO();

        con = db.getCon();
        String sql = iSQL.getSQL(iSQL.SEL_FEST_DETAIL);
        pstmt = db.getPSTMT(con, sql);

        try {
            pstmt.setInt(1, fno);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                fVO.setFname(rs.getString("FNAME"));
                fVO.setFcontext(rs.getString("FCONTEXT"));
                fVO.setFoplace(rs.getString("OPEN_PLACE"));
                fVO.setHsdate(rs.getDate("SDATE"));
                fVO.setHedate(rs.getDate("EDATE"));
                fVO.setSdate();
                fVO.setEdate();
                fVO.setFtel(rs.getString("FTEL"));
                fVO.setFhaddr(rs.getString("FHADDR"));
                fVO.setFroadaddr(rs.getString("ROAD_ADDR"));
                fVO.setIdir(rs.getString("FEST_IMG_SDIR"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close(rs);
            db.close(pstmt);
            db.close(con);
        }
        return fVO;
    }


    public ArrayList<FestivalVO> schKeywordInfo(PageUtil pag, String str) {
        ArrayList<FestivalVO> list = new ArrayList<FestivalVO>();

        con = db.getCon();
        String sql = iSQL.getSQL(iSQL.SCH_KEYWORD_INFO);
        pstmt = db.getPSTMT(con, sql);

        try {
            pstmt.setString(1,"%"+str+"%");
            pstmt.setString(2,"%"+str+"%");
            pstmt.setString(3,"%"+str+"%");
            pstmt.setString(4,"%"+str+"%");
            pstmt.setInt(5, pag.getStartCont());
            pstmt.setInt(6, pag.getEndCont());

            rs = pstmt.executeQuery();
            while (rs.next()) {
                FestivalVO iVO = new FestivalVO();
                iVO.setFno(rs.getInt("FNO"));
                iVO.setFname(rs.getString("FNAME"));
                iVO.setFcontext(rs.getString("FCONTEXT"));
                iVO.setHsdate(rs.getDate("sdate"));
                iVO.setHedate(rs.getDate("edate"));
                iVO.setSdate();
                iVO.setEdate();
                iVO.setIdir(rs.getString("FEST_IMG_SDIR"));
                iVO.setRsco(rs.getInt("REVIEW_SCORE"));
                list.add(iVO);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close(rs);
            db.close(pstmt);
            db.close(con);
        }
        return list;
    }
//
//    public int calSearchCount(String str) {
//        int cnt = 0;
//
//        con = db.getCon();
//        String sql = iSQL.getSQL(iSQL.CAL_SEARCH_CNT);
//        pstmt = db.getPSTMT(con, sql);
//
//        try {
//            pstmt.setString(1,"%"+str+"%");
//            pstmt.setString(2,"%"+str+"%");
//            pstmt.setString(3,"%"+str+"%");
//            pstmt.setString(4,"%"+str+"%");
//            rs.next();
//
//            cnt = rs.getInt("cnt");
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            db.close(rs);
//            db.close(pstmt);
//            db.close(con);
//        }
//        return cnt;
//    }
//
}
