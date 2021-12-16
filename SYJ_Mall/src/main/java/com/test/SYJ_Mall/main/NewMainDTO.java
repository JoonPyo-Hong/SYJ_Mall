package com.test.SYJ_Mall.main;

import java.util.Date;

public class NewMainDTO {
	private int seq;
	private String character_name;
	private String reg_dt;	
	private String title;
	private String content;
	private String tag;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = Time.calculateTime(reg_dt);
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCharacter_name() {
		return character_name;
	}
	public void setCharacter_name(String character_name) {
		this.character_name = character_name;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
}
