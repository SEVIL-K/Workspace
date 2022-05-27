package com.githrd.festival.sql;

public class MemberSQL {
	public final int SEL_LOGIN_CNT	= 1001;
	public final int SEL_NAME_INFO	= 1002;
	
	public final int ADD_MEMBER		= 3001;
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		switch(code) {
		case SEL_LOGIN_CNT:
			buff.append("SELECT ");
			buff.append("    COUNT(*) cnt ");
			buff.append("FROM ");
			buff.append("    member ");
			buff.append("WHERE ");
			buff.append("    user_id = ? ");
			buff.append("    AND user_pw = ? ");
			break;
		
		case SEL_NAME_INFO:
			buff.append("SELECT ");
			buff.append("    USER_NAME ");
			buff.append("FROM ");
			buff.append("    member ");
			buff.append("WHERE ");
			buff.append("    user_id = ? ");
			break;
			
		case ADD_MEMBER:
			buff.append("INSERT INTO ");
			buff.append("    member (user_no, user_name, user_id, user_pw, user_birth, user_tel, user_mail, user_add, user_gen) ");
			buff.append("VALUES ( ");
			buff.append("    (SELECT NVL(MAX(user_no) + 1, 101) FROM member), ");
			buff.append("    ?, ?, ?, ?, ?, ?, ?, ? ");
			buff.append(") ");
			break;
		}
		return buff.toString();
	}
}
