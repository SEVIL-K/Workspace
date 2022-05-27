package com.githrd.festival.sql;

public class ApiSQL {
    public final int SEL_FES_CNT = 1011;

    public final int DEL_FESINFO = 2001;

    public final int INS_FESTIVAL_INFO = 3001;
    public final int INS_FESTIVAL_TEL = 3002;
    public final int INS_FESTIVAL_HADDR = 3003;
    public final int INS_FESTIVAL_RADDR = 3004;
    public final int INS_FESTIVAL_LAT = 3005;
    public final int INS_FESTIVAL_LOG = 3006;

    public String getSQL(int code) {
        StringBuffer buff = new StringBuffer();
        switch (code) {
            case SEL_FES_CNT:
                buff.append("select count(*) cnt from festival_info ");
                break;
            case DEL_FESINFO:
                buff.append("delete from festival_info ");
                break;
            case INS_FESTIVAL_INFO:
                buff.append("insert into festival_info ( ");
                buff.append("        fno, fname, open_place, sdate, edate, fcontext, hostinst, hostorgan) ");
                buff.append("values ( ");
                buff.append("        (select nvl(max(fno)+1, 1) from festival_info), ");
                buff.append("        ?,?,?,?,?,?,? ");
                buff.append(") ");
                break;
            case INS_FESTIVAL_TEL:
                buff.append("UPDATE festival_info set ftel = ? where fno = (select max(fno) from festival_info) ");
                break;
            case INS_FESTIVAL_HADDR:
                buff.append("UPDATE festival_info set fhaddr = ? where fno = (select max(fno) from festival_info) ");
                break;
            case INS_FESTIVAL_RADDR:
                buff.append("UPDATE festival_info set road_addr = ? where fno = (select max(fno) from festival_info) ");
                break;
            case INS_FESTIVAL_LAT:
                buff.append("UPDATE festival_info set latitude = ? where fno = (select max(fno) from festival_info) ");
                break;
            case INS_FESTIVAL_LOG:
                buff.append("UPDATE festival_info set longitude = ? where fno = (select max(fno) from festival_info) ");
                break;
        }

        return buff.toString();
    }
}
