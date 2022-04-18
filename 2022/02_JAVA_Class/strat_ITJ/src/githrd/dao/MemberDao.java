package githrd.dao;
/*
    Created by HG on 2022-04-15
    
*/

import githrd.db.JenyJDBC;

import java.sql.Connection;

public class MemberDao {
    private JenyJDBC db;
    private Connection con;

    public MemberDao() {
        db = new JenyJDBC();

        con = db.getCon();
        System.out.println(" ##### 커넥션 꺼내오기 성공 #####");
        db.close(con);
    }
}
