package com.githrd.whistle.vo;

import java.text.*;
import java.sql.Time;
import java.util.Date;

public class MemberVO {
	private int mno, ano, cnt;
	private String id, name, pw, mail, tel, sdate, savename, gen;
	private Date jdate;
	private Time jtime;
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public void setSdate() {
		SimpleDateFormat form1 = new SimpleDateFormat("yyyy년 MM월 dd일 ");
		SimpleDateFormat form2 = new SimpleDateFormat("HH:mm:ss");
		sdate = form1.format(jdate) + form2.format(jtime);
	}
	public String getGen() {
		return gen;
	}
	public void setGen(String gen) {
		this.gen = gen;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public Date getJdate() {
		return jdate;
	}
	public void setJdate(Date jdate) {
		this.jdate = jdate;
	}
	public Time getJtime() {
		return jtime;
	}
	public void setJtime(Time jtime) {
		this.jtime = jtime;
	}
	@Override
	public String toString() {
		return "MemberVO [mno=" + mno + ", ano=" + ano + ", cnt=" + cnt + ", id=" + id + ", name=" + name + ", pw=" + pw
				+ ", mail=" + mail + ", tel=" + tel + ", sdate=" + sdate + ", savename=" + savename + ", gen=" + gen
				+ ", jdate=" + jdate + ", jtime=" + jtime + "]";
	}
	
	public String getJson() {
		StringBuffer buff = new StringBuffer();
		buff.append("{\r\n");
		buff.append("\"mno\": \"" + mno + "\",\r\n");
		buff.append("\"name\": \"" + name + "\",\r\n");
		buff.append("\"id\": \"" + id + "\",\r\n");
		buff.append("\"mail\": \"" + mail + "\",\r\n");
		buff.append("\"tel\": \"" + tel + "\",\r\n");
		buff.append("\"savename\": \"" + savename + "\",\r\n");
		buff.append("\"ano\": \"" + ano + "\",\r\n");
		buff.append("\"gen\": \"" + (gen.equals("M")?"남자":"여자") + "\",\r\n");
		buff.append("\"sdate\": \"" + sdate + "\"\r\n");
		buff.append("}");
		return buff.toString();
	}
}
