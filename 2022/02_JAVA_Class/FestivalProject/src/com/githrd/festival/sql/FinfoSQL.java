package com.githrd.festival.sql;
/*
    작성자 : 윤한기
    작성일 : 22-05-22
*/

public class FinfoSQL {
    public final int SCH_FEST_INFO = 1001;
    public final int CAL_FEST_CNT = 1002;
    public final int SEL_FEST_DETAIL = 1003;
    public final int SCH_KEYWORD_INFO = 1004;
    public final int CAL_SEARCH_CNT = 1005;

    public String getSQL(int code) {
        StringBuffer buff = new StringBuffer();

        switch (code) {
            case SCH_FEST_INFO:
                buff.append("SELECT ");
                buff.append("   FNO, FNAME, FCONTEXT, i.FEST_IMG_SDIR, SDATE, EDATE, r.REVIEW_SCORE ");
                buff.append("FROM ");
                buff.append("   FESTIVAL_INFO, FESTIVAL_IMG_FILE i, FESTIVAL_REVIEW r ");
                buff.append("WHERE ");
                buff.append("   FNO = i.FEST_NO(+) ");
                buff.append("   AND FNO = r.FEST_NO(+) ");
                buff.append("   AND FNO between ? and ? ");
                break;
            case CAL_FEST_CNT:
                buff.append("SELECT ");
                buff.append("    COUNT(*) cnt ");
                buff.append("FROM ");
                buff.append("    FESTIVAL_INFO ");
                break;
            case SEL_FEST_DETAIL:
                buff.append("SELECT ");
                buff.append("    FNAME, FCONTEXT, OPEN_PLACE, SDATE, EDATE, FTEL, FHADDR, ROAD_ADDR, FEST_IMG_SDIR ");
                buff.append("FROM ");
                buff.append("    FESTIVAL_INFO, FESTIVAL_IMG_FILE ");
                buff.append("WHERE ");
                buff.append("    FNO = FEST_NO(+) ");
                buff.append("    AND FNO = ? ");
                break;
            case SCH_KEYWORD_INFO:
                buff.append("SELECT FNO, FNAME, FCONTEXT, SDATE, EDATE, FEST_IMG_SDIR, REVIEW_SCORE ");
                buff.append("FROM ");
                buff.append("    ( ");
                buff.append("        SELECT ROWNUM RNO, FNO, FNAME, FCONTEXT,  SDATE, EDATE, i.FEST_IMG_SDIR, r.REVIEW_SCORE ");
                buff.append("        FROM FESTIVAL_INFO, FESTIVAL_IMG_FILE i, FESTIVAL_REVIEW r, ");
                buff.append("        ( ");
                buff.append("            SELECT FNO AS fno1, COUNT(*) cnt ");
                buff.append("            FROM FESTIVAL_INFO ");
                buff.append("            WHERE (FNAME LIKE ? OR ");
                buff.append("                OPEN_PLACE LIKE ? OR ");
                buff.append("                FCONTEXT LIKE ? OR ");
                buff.append("                ROAD_ADDR LIKE ? ) ");
                buff.append("            GROUP BY FNO ");
                buff.append("            ) ");
                buff.append("        WHERE fno = fno1 ");
                buff.append("            AND FNO = i.FEST_NO(+) ");
                buff.append("            AND FNO = r.FEST_NO(+) ");
                buff.append("       ) ");
                buff.append("WHERE RNO BETWEEN ? AND ? ");
                break;
            case CAL_SEARCH_CNT:
                buff.append("SELECT COUNT(*) cnt ");
                buff.append("FROM FESTIVAL_INFO ");
                buff.append("WHERE (FNAME LIKE ? OR ");
                buff.append("    OPEN_PLACE LIKE ? OR ");
                buff.append("    FCONTEXT LIKE ? OR ");
                buff.append("    ROAD_ADDR LIKE ? ) ");
                break;
        }
        return buff.toString();
    }
}
