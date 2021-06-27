package com.test.SYJ_Mall.main;

import java.util.Date;

public class MainDTO {
	private int seq;
	private String reg_id;
	private String reg_dt;
	private String gubn;
	private String title;
	private String contents;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = Time.calculateTime(reg_dt);
	}
	public String getGubn() {
		return gubn;
	}
	public void setGubn(String gubn) {
		this.gubn = gubn;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	

}
