package interdb.db;

import java.sql.*;

public class GitJDBC {

    public GitJDBC() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch(Exception e) {
            System.out.println("##### 드라이버 로딩 실패 #####");
        }
    }
    public Connection getCon() {
        Connection con = null;

        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String user = "jennie";
        String pw = "12345";

        try {
            con = DriverManager.getConnection(url, user, pw);
        } catch(Exception e) {}
        return con;
    }

    public Connection getCon(String user, String pw) {
        Connection con = null;

        String url = "jdbc:oracle:thin:@localhost:1521:xe";

        try {
            con = DriverManager.getConnection(url, user, pw);
        } catch(Exception e) {}
        return con;
    }

    public Statement getStmt(Connection con) {
        Statement stmt = null;
        try {
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        } catch(Exception e) {}
        return stmt;
    }

    public PreparedStatement getPstmt(Connection con, String sql) {
        PreparedStatement pstmt = null;
        try {
            pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        } catch(Exception e) {}
        return pstmt;
    }
    public void close(Object o) {
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
