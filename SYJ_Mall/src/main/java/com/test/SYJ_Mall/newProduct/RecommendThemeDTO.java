package com.test.SYJ_Mall.newProduct;

import lombok.Data;
/**
 * 추천상품 객체
 * @author shin
 *
 */
@Data
public class RecommendThemeDTO {

	private int prodId;
	private String prodNm;
	private int prodCnt;
	private String prodPrice;
	private int discRate;
	private String picUrl;
	private String dcPrice;
	private String cookieBasket;
	private String categoryNm;
	private String alarmYn;
	
	
}
