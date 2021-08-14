package com.test.SYJ_Mall.dummy;

import lombok.Data;

@Data
public class DummyProductDTO {
	
	private int productId;
	private int qoouserSeq;
	private int starScore;
	private int productBuyCount;
	private String productBuyDt;
	
	
	
	public DummyProductDTO(int productId, int qoouserSeq, int starScore, int productBuyCount, String productBuyDt) {
		super();
		this.productId = productId;
		this.qoouserSeq = qoouserSeq;
		this.starScore = starScore;
		this.productBuyCount = productBuyCount;
		this.productBuyDt = productBuyDt;
	}
	
	
}
