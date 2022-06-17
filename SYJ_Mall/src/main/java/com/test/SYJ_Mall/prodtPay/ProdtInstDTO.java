package com.test.SYJ_Mall.prodtPay;

import lombok.Data;

/**
 * 결제직전 임시 제품저장 객체
 * @author shin
 *
 */
@Data
public class ProdtInstDTO {
	private String prodtId;
	private int prodtCnt;
	
	public ProdtInstDTO(String prodtId, int prodtCnt) {
		this.prodtId = prodtId;
		this.prodtCnt = prodtCnt;
	}
}
