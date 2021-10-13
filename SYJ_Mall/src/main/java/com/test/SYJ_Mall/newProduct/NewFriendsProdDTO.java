package com.test.SYJ_Mall.newProduct;

import lombok.Data;
/**
 * 새로나온 친구들 물품객체
 * @author shin
 *
 */
@Data
public class NewFriendsProdDTO {
	
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
