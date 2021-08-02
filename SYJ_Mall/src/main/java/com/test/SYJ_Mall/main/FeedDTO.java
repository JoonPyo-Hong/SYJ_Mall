package com.test.SYJ_Mall.main;

import java.util.Date;

public class FeedDTO {
	private int seq;
	private int member_seq;
	private int list_seq;
	private String feed;
	private String reg_id;
	private String reg_dt;
	private int feed_seq;
	private String re_feed;

	public int getFeed_seq() {
		return feed_seq;
	}

	public void setFeed_seq(int feed_seq) {
		this.feed_seq = feed_seq;
	}

	public String getRe_feed() {
		return re_feed;
	}

	public void setRe_feed(String re_feed) {
		this.re_feed = re_feed;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getMember_seq() {
		return member_seq;
	}

	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}

	public int getList_seq() {
		return list_seq;
	}

	public void setList_seq(int list_seq) {
		this.list_seq = list_seq;
	}

	public String getFeed() {
		return feed;
	}

	public void setFeed(String feed) {
		this.feed = feed;
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

}
