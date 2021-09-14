package com.test.SYJ_Mall.search;

import lombok.Data;

/**
 * 검색으로 찾은 상품 객체 세부정보
 * @author shin
 *
 */
@Data
public class SearchProductDTO {

	private int prodId;
	private String prodNm;
	private int prodCnt;
	//private int prodPrice;
	private String prodPrice;
	private int discRate;
	private String picUrl;
	private String dcPrice;
	
}
