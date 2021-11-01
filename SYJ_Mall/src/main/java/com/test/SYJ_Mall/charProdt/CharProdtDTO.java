package com.test.SYJ_Mall.charProdt;

import lombok.Data;

/**
 * 캐릭터별 상품 객체
 * @author shin
 *
 */
@Data
public class CharProdtDTO {
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
