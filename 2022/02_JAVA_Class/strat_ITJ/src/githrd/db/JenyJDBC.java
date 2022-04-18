package githrd.db;
/*
    Created by HG on 2022-04-15

    이 클래스는 jennie 계정으로 데이터베이스 작업을 할 경우
    필요한 드라이버를 로딩하는 작업, 커넥션과 스테이트먼트를
    필요할 때 반환해주는 기능을 가지는 클래스

*/

import java.sql.*;

public class JenyJDBC {

    public JenyJDBC() {
        // 이 클래스가 new 될 때 드라이버 로딩이 되게 처리한다.

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (Exception e) {
            System.out.println("##### 드라이버 로딩 실패 #####");
//            e.printStackTrace();
        }
    }

    // 데이터베이스 작업을 위해 접속이 필요한 경우 커넥션을 만들어서 반환해주는 함수
    public Connection getCon() {
        Connection con = null;

        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String user = "jennie";
        String pw = "12345";

        try {
            con = DriverManager.getConnection(url, user, pw);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public Connection getCon(String user, String pw) {
        Connection con = null;

        String url = "jdbc:oracle:thin:@localhost:1521:xe";

        try {
            con = DriverManager.getConnection(url, user, pw);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    // Statement 가 필요하면 준비해서 반환해주는 함수
    public Statement getStmt(Connection con) {
        Statement stmt = null;

        try {
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return stmt;
    }


    public PreparedStatement getPStmt(Connection con, String sql) {
        PreparedStatement pstmt = null;

        try {
            pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return pstmt;
    }

    // 사용하지 않는 자원 반환해주는 함수
    public void close(Object o) {

        try {
            if (o instanceof Connection) {
                // 입력된 데이터가 커넥션이니?
                ((Connection) o).close();
                /*
                    (Connection) o.close();
                        ==> o 의 멤버 중 close() 함수를 호출한 결과를 Connection 로 강제형변환 ==> X
                 */
            } else if (o instanceof Statement) {
                ((Statement) o).close();
            } else if (o instanceof PreparedStatement) {
                ((PreparedStatement) o).close();
            } else if (o instanceof ResultSet) {
                ((ResultSet) o).close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
