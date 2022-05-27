package com.githrd.festival.vo;

import java.text.SimpleDateFormat;
import java.util.*;

public class ReviewVO {
	private int rno, fno;
	private float score;
	private String title, body, writer, wdate, fname;
	
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	private Date ww;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public void setWdate() {
		SimpleDateFormat form = new SimpleDateFormat();
		wdate = form.format(ww);
	}
	public Date getWw() {
		return ww;
	}
	public void setWw(Date ww) {
		this.ww = ww;
	}
}
