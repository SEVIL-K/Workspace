package com.githrd.festival.dao;

import com.githrd.festival.db.FesDBCP;
import com.githrd.festival.sql.ApiSQL;
import com.githrd.festival.vo.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ApiDao {
    private FesDBCP db;
    private Connection con;
    private Statement stmt;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private ApiSQL asql;

    public ApiDao() {
        // 커넥션 풀 찾고
        db = new FesDBCP();
        // 질의명령 준비
        asql = new ApiSQL();
    }

    public int SelFesCnt() {
        int cnt = 0;
        con = db.getCon();
        String sql = asql.getSQL(asql.SEL_FES_CNT);
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

    public int DelFesInfo() {
        int cnt = 0;
        con = db.getCon();
        String sql = asql.getSQL(asql.DEL_FESINFO);
        stmt = db.getSTMT(con);
        try {
            cnt = stmt.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close(stmt);
            db.close(con);
        }
        return cnt;
    }

    public int InsFesInfo(FestivalVO fvo) {
        int cnt = 0;
        con = db.getCon();
        String sql = asql.getSQL(asql.INS_FESTIVAL_INFO);
        pstmt = db.getPSTMT(con, sql);
        try {
            pstmt.setString(1, fvo.getFname());
            pstmt.setString(2, fvo.getFoplace());
            pstmt.setString(3, fvo.getSdate());
            pstmt.setString(4, fvo.getEdate());
            pstmt.setString(5, fvo.getFcontext());
            pstmt.setString(6, fvo.getHostinst());
            pstmt.setString(7, fvo.getHostorgan());
            cnt = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close(pstmt);
            db.close(con);
        }
        return cnt;
    }
    public int InsFesTel(String tel) {
        int cnt = 0;
        con = db.getCon();
        String sql = asql.getSQL(asql.INS_FESTIVAL_TEL);
        pstmt = db.getPSTMT(con, sql);
        try {
            pstmt.setString(1, tel);
            cnt = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close(pstmt);
            db.close(con);
        }
        return cnt;
    }
    public int InsFesHaddr(String haddr) {
        int cnt = 0;
        con = db.getCon();
        String sql = asql.getSQL(asql.INS_FESTIVAL_HADDR);
        pstmt = db.getPSTMT(con, sql);
        try {
            pstmt.setString(1, haddr);
            cnt = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close(pstmt);
            db.close(con);
        }
        return cnt;
    }
    public int InsFesRaddr(String raddr) {
        int cnt = 0;
        con = db.getCon();
        String sql = asql.getSQL(asql.INS_FESTIVAL_RADDR);
        pstmt = db.getPSTMT(con, sql);
        try {
            pstmt.setString(1, raddr);
            cnt = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close(pstmt);
            db.close(con);
        }
        return cnt;
    }
    public int InsFesLat(String lat) {
        int cnt = 0;
        con = db.getCon();
        String sql = asql.getSQL(asql.INS_FESTIVAL_LAT);
        pstmt = db.getPSTMT(con, sql);
        try {
            pstmt.setString(1, lat);
            cnt = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close(pstmt);
            db.close(con);
        }
        return cnt;
    }
    public int InsFesLog(String log) {
        int cnt = 0;
        con = db.getCon();
        String sql = asql.getSQL(asql.INS_FESTIVAL_LOG);
        pstmt = db.getPSTMT(con, sql);
        try {
            pstmt.setString(1, log);
            cnt = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close(pstmt);
            db.close(con);
        }
        return cnt;
    }
    public int InsFesList(ArrayList<FestivalVO> list) {
        int cnt = 0;
        int ocnt = 0;
        for (FestivalVO fvo : list) {
            cnt += InsFesInfo(fvo);
            if (fvo.getFtel() != null) {
                ocnt += InsFesTel(fvo.getFtel());
            }
            if (fvo.getFhaddr() != null) {
                ocnt += InsFesHaddr(fvo.getFhaddr());
            }
            if (fvo.getFroadaddr() != null) {
                ocnt += InsFesRaddr(fvo.getFroadaddr());
            }
            if (fvo.getLatitude() != null) {
                ocnt += InsFesLat(fvo.getLatitude());
            }
            if (fvo.getLogitude() != null) {
                ocnt += InsFesLog(fvo.getLogitude());
            }
        }
        return cnt;
    }
}