package com.test.SYJ_Mall.productDetail;

import lombok.Data;

/**
 * 이 상품은 어때요 dto객체
 * @author shin
 *
 */
@Data
public class ProductHowDTO {
	private int prodId;
	private String prodNm;
	private int prodCnt;
	private String prodPrice;
	private int discRate;
	private String picUrl;
	private String dcPrice;
	private String cookieBasket;
	private String alarmYn; 
}
