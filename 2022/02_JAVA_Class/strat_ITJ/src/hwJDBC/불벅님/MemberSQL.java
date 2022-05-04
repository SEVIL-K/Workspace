package interdb.sql;

public class MemberSQL {
    public final int SEL_MEMBER_INFO = 1001;

    public String getSQL(int code) {
        StringBuffer buff = new StringBuffer();
        switch (code) {
            case SEL_MEMBER_INFO:
                buff.append("select ");
                buff.append("        MEMBER_NAME, MEMBER_ID, MEMBER_MAIL ");
                buff.append("from ");
                buff.append("        MEMBER ");
                buff.append("where ");
                buff.append("        MEMBER_NO = ? ");
                break;
        }

        return buff.toString();
    }
}
