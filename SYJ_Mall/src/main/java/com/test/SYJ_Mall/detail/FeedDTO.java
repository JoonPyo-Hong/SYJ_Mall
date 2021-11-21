package com.test.SYJ_Mall.detail;

import java.util.Date;

import lombok.Data;

@Data
public class FeedDTO {
	private int d_seq;
	private int f_seq;
	private String name;
	private int star;
	private Date reg_dt;
	private String text;
}
