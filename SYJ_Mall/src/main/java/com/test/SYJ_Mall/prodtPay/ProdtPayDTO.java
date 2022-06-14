package com.test.SYJ_Mall.prodtPay;

import lombok.Data;

/**
 * 주문할 상품의 객체정보
 * @author shin
 *
 */
@Data
public class ProdtPayDTO {
	private int prodtSeq;
	private String prodtName;
	private String prodtPrice;
	private int possibleProdtCnt;
	private int prodtBuyCnt;
	private String prodtImgUrl;
	
}
	