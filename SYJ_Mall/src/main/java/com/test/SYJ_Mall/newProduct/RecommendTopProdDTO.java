package com.test.SYJ_Mall.newProduct;

import lombok.Data;

/**
 * 신규페이지 상단 배너 물품 리스트
 * @author shin
 *
 */
@Data
public class RecommendTopProdDTO {
	
	private String prodId;
	private String prodSubject;
	private String prodDetail;
	private String prodPicUrl;
}
