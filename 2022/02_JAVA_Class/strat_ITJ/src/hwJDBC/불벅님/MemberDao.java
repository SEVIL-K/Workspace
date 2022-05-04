package interdb.dao;

import interdb.db.GitJDBC;
import interdb.sql.MemberSQL;
import interdb.vo.MemberVO;

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
    private MemberSQL MSQL;

    public MemberDao() {
        db = new GitJDBC();
        MSQL = new MemberSQL();
    }

    public MemberVO getMember(int mno) {
        con = db.getCon();
        String sql = MSQL.getSQL(MSQL.SEL_MEMBER_INFO);
        pstmt = db.getPstmt(con, sql);
        MemberVO mvo = new MemberVO();
        try {
            pstmt.setInt(1, mno);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                mvo.setId(rs.getString("MEMBER_ID"));
                mvo.setName(rs.getString("MEMBER_NAME"));
                mvo.setMail(rs.getString("MEMBER_MAIL"));
            }
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
