package com.test.SYJ_Mall.dummy;

import lombok.Data;

@Data
public class DummyDTO {
	
	private int category;
	private String prodName;
	private int prodCount;
	private int prodPrice;
	private int prodDiscounts;
	private String prodRepYns;
	private int prodCharFirsts;
	private int prodCharSeconds;
	private String prodRepImgs;
	private String prodHeads;
	
	public DummyDTO(int category, String prodName, int prodCount, int prodPrice, int prodDiscounts, String prodRepYns,
			int prodCharFirsts, int prodCharSeconds, String prodRepImgs, String prodHeads) {
		super();
		this.category = category;
		this.prodName = prodName;
		this.prodCount = prodCount;
		this.prodPrice = prodPrice;
		this.prodDiscounts = prodDiscounts;
		this.prodRepYns = prodRepYns;
		this.prodCharFirsts = prodCharFirsts;
		this.prodCharSeconds = prodCharSeconds;
		this.prodRepImgs = prodRepImgs;
		this.prodHeads = prodHeads;
	}
	
	
}
