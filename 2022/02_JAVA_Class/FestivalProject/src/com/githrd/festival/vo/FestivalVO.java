package com.githrd.festival.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FestivalVO {
    private int fno, ffee;
    private String fname, foplace, sdate, edate, fcontext, hostinst, hostorgan, ftel, fhaddr, froadaddr, latitude, logitude;
    private Date hsdate;
    private Date hedate;


/*
    작성자 : 윤한기
    작성일 : 22-05-22
*/
//  축제정보에 사용하려고 추가한 부분
//------------------------------------------------------------
    private int rsco;
    private String idir;

    public int getRsco() {return rsco;}
    public void setRsco(int rsco) {this.rsco = rsco;}
    public String getIdir() {return idir;}
    public void setIdir(String idir) {this.idir = idir;}
//------------------------------------------------------------


    public int getFno() {
        return fno;
    }
    public void setFno(int fno) {
        this.fno = fno;
    }
    public int getFfee() {
        return ffee;
    }
    public void setFfee(int ffee) {
        this.ffee = ffee;
    }
    public String getFname() {
        return fname;
    }
    public void setFname(String fname) {
        this.fname = fname;
    }
    public String getFoplace() {
        return foplace;
    }
    public void setFoplace(String foplace) {
        this.foplace = foplace;
    }
    public String getSdate() {
        return sdate;
    }
    public void setSdate(String sdate) {
        this.sdate = sdate;
    }
    public void setSdate() {
        SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd");
        sdate = form.format(hsdate);
    }

    public String getEdate() {
        return edate;
    }
    public void setEdate(String edate) {
        this.edate = edate;
    }
    public void setEdate() {
        SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd");
        edate = form.format(hedate);
    }


    public String getFcontext() {
        return fcontext;
    }
    public void setFcontext(String fcontext) {
        this.fcontext = fcontext;
    }
    public String getHostinst() {
        return hostinst;
    }
    public void setHostinst(String hostinst) {
        this.hostinst = hostinst;
    }
    public String getHostorgan() {
        return hostorgan;
    }
    public void setHostorgan(String hostorgan) {
        this.hostorgan = hostorgan;
    }
    public String getFtel() {
        return ftel;
    }
    public void setFtel(String ftel) {
        this.ftel = ftel;
    }
    public String getFhaddr() {
        return fhaddr;
    }
    public void setFhaddr(String fhaddr) {
        this.fhaddr = fhaddr;
    }
    public String getFroadaddr() {
        return froadaddr;
    }
    public void setFroadaddr(String froadaddr) {
        this.froadaddr = froadaddr;
    }
    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLogitude() {
        return logitude;
    }

    public void setLogitude(String logitude) {
        this.logitude = logitude;
    }

    public Date getHsdate() {
        return hsdate;
    }
    public void setHsdate(Date hsdate) {
        this.hsdate = hsdate;
    }
    public Date getHedate() {
        return hedate;
    }
    public void setHedate(Date hedate) {
        this.hedate = hedate;
    }

    @Override
    public String toString() {
        return "FestivalVO{" +
                "fno=" + fno +
                ", ffee=" + ffee +
                ", latitude=" + latitude +
                ", logitude=" + logitude +
                ", fname='" + fname + '\'' +
                ", foplace='" + foplace + '\'' +
                ", sdate='" + sdate + '\'' +
                ", edate='" + edate + '\'' +
                ", fcontext='" + fcontext + '\'' +
                ", hostinst='" + hostinst + '\'' +
                ", hostorgan='" + hostorgan + '\'' +
                ", ftel='" + ftel + '\'' +
                ", fhaddr='" + fhaddr + '\'' +
                ", froadaddr='" + froadaddr + '\'' +
                ", hsdate=" + hsdate +
                ", hedate=" + hedate +
                '}';
    }
}
