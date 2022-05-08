package com.test.SYJ_Mall.productDetail;

import lombok.Data;

@Data
public class ProductRecentDTO {
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
