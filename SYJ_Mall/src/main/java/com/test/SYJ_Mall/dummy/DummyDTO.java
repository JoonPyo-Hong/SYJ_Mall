package com.test.SYJ_Mall.dummy;

import lombok.Data;

@Data
public class DummyDTO {

	public DummyDTO(int categories, String names, int counts, int prices, int discounts, String rep_yns,
			int char_firsts, int char_seconds, String rep_imgs, String heads1, String heads2, String heads3,
			String heads4) {
		super();
		this.categories = categories;
		this.names = names;
		this.counts = counts;
		this.prices = prices;
		this.discounts = discounts;
		this.rep_yns = rep_yns;
		this.char_firsts = char_firsts;
		this.char_seconds = char_seconds;
		this.rep_imgs = rep_imgs;
		this.heads1 = heads1;
		this.heads2 = heads2;
		this.heads3 = heads3;
		this.heads4 = heads4;
	}
	
	private int categories;
	private String names;
	private int counts;
	private int prices;
	private int discounts;
	private String rep_yns;
	private int char_firsts;
	private int char_seconds;
	private String rep_imgs;
	private String heads1;
	private String heads2;
	private String heads3;
	private String heads4;
	
	
	
}
