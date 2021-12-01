package com.test.SYJ_Mall.myPages;

import lombok.Data;

/**
 * 마이페이지 - 최근본 상품 dto 객체
 * @author shin
 *
 */
@Data
public class MyPageSeenDTO {
	private int prodId;
	private String prodNm;
	private String prodPrice;
	private int discRate;
	private String dcPrice;
	private String picUrl;
}
