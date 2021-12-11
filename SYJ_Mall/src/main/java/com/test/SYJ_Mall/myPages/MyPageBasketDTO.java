package com.test.SYJ_Mall.myPages;

import lombok.Data;
/**
 * 마이페이지 - 장바구니에 담긴 상품
 * @author shin
 *
 */
@Data
public class MyPageBasketDTO {
	private int prodId;
	private String prodNm;
	private String prodPrice;
	private String dcPrice;
	private String dcYn;
	private String picUrl;
	private int buyCount;
}
