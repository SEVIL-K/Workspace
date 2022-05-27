package com.githrd.festival.sql;

public class ReviewSQL {
	public final int SEL_MAIN_REVIEW	= 1001;
	public final int SEL_AVG_SCORE		= 1002;
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		switch(code) {
		case SEL_MAIN_REVIEW:
			buff.append("SELECT ");
			buff.append("    review_no, fest_name, review_title, review_body, review_wname, review_score ");
			buff.append("FROM ");
			buff.append("    FESTIVAL_INFO i, FESTIVAL_REVIEW r ");
			buff.append("WHERE ");
			buff.append("    i.FEST_NO = r.FEST_NO ");
			buff.append("    AND ROWNUM < 6 ");
			break;
		
		case SEL_AVG_SCORE:
			buff.append("SELECT ");
			buff.append("    AVG(review_score) score ");
			buff.append("FROM ");
			buff.append("    FESTIVAL_REVIEW ");
			buff.append("WHERE ");
			buff.append("    isshow = 'Y' ");
			buff.append("	AND fest_no = ? ");
			break;
		}
		return buff.toString();
	}
}
