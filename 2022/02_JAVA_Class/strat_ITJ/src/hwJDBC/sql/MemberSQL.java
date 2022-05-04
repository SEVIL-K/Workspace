package hwJDBC.sql;
/*
    Created by HG on 2022-05-01
    
*/

public class MemberSQL {
    public final int SEL_MEMBER_INFO = 1001;

    public String getSQL(int code) {
        StringBuffer buff = new StringBuffer();
        switch (code) {
            case SEL_MEMBER_INFO:
                buff.append("SELECT ");
                buff.append("        name, id, mail ");
                buff.append("FROM ");
                buff.append("        MEMBER ");
                buff.append("WHERE ");
                buff.append("        user_no = ? ");
                break;
        }

        return buff.toString();
    }
}
