package com.githrd.test.sql;

public class MemberSQL {
    public final int SEL_LOGIN_CNT = 1001;

    public String getSQL(int code) {
        StringBuffer buff = new StringBuffer();
        switch (code) {
            case SEL_LOGIN_CNT:
                buff.append("SELECT ");
                buff.append("	COUNT(*) cnt ");
                buff.append("FROM ");
                buff.append("	member ");
                buff.append("WHERE ");
                buff.append("	isshow = 'Y' ");
                buff.append("	AND id = ? ");
                buff.append("	AND pw = ? ");
                break;
        }
        return buff.toString();
    }
}
