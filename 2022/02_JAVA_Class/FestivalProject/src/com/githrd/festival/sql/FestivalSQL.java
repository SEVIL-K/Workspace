package com.githrd.festival.sql;

public class FestivalSQL {
	public final int SEL_MAIN_INFO	= 1001;
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		switch(code) {
		case SEL_MAIN_INFO:
			buff.append("SELECT ");
			buff.append("    fest_no, fest_name, open_place, sdate, edate, ");
			buff.append("    TO_DATE(sdate, 'YY/MM/DD') - TO_DATE(sysdate, 'YY/MM/DD') diff ");
			buff.append("FROM ");
			buff.append("    festival_info ");
			buff.append("WHERE ");
			buff.append("    TO_DATE(sdate, 'YY/MM/DD') - TO_DATE(sysdate, 'YY/MM/DD') > 0 ");
			buff.append("    AND ROWNUM < 7 ");
			buff.append("order by ");
			buff.append("    diff asc ");
			break;
		}
		return buff.toString();
	}
}
