package com.test.SYJ_Mall.productDetail;

import lombok.Data;

/**
 * 제품 세부정보 객체
 * @author shin
 *
 */
@Data
public class ProductDetailDTO {
	private String prodNm;
	private int prodCnt;
	private String prodPrice;
	private int discRate;
	private String prodtDetailInfo;
	private String dcPrice;
	private String cookieBasket;
	private String alarmYn;
}
