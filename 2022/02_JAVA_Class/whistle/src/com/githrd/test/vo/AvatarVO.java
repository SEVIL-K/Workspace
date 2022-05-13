package com.githrd.test.vo;

public class AvatarVO {
	private long len;
	private int ano, cnt;
	private String savename, dir, gen;
	public long getLen() {
		return len;
	}
	public void setLen(long len) {
		this.len = len;
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
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public String getGen() {
		return gen;
	}
	public void setGen(String gen) {
		this.gen = gen;
	}
	
	public String getJson() {
		StringBuffer buff = new StringBuffer();
		buff.append("{\r\n");
		buff.append("\"ano\": \"" + ano + "\",\r\n");
		buff.append("\"savename\": \"" + savename + "\",\r\n");
		buff.append("\"dir\": \"" + dir + "\",\r\n");
		buff.append("\"gen\": \"" + gen + "\"\r\n");
		buff.append("}");
		return buff.toString();
	}
}
