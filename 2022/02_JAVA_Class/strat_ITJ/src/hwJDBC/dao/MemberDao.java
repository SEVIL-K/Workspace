package hwJDBC.dao;
/*
    Created by HG on 2022-05-01
    
*/

import hwJDBC.db.GitJDBC;
import hwJDBC.sql.MemberSQL;
import hwJDBC.vo.MemberVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class MemberDao {
    private GitJDBC db;
    private Connection con;
    private Statement stmt;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private MemberSQL mSQL;

    public MemberDao() {
        db = new GitJDBC();
        mSQL = new MemberSQL();
    }

    public MemberVO getMember(int mno) {
        con = db.getCon();
        String sql = mSQL.getSQL(mSQL.SEL_MEMBER_INFO);

        pstmt = db.getPstmt(con, sql);
        MemberVO mvo = new MemberVO();


        try {
            pstmt.setInt(1, mno);
            rs = pstmt.executeQuery();


            rs.next();
            mvo.setId(rs.getString("id"));
            mvo.setName(rs.getString("name"));
            mvo.setMail(rs.getString("mail"));


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close(rs);
            db.close(pstmt);
            db.close(con);
        }

        return mvo;
    }
}
