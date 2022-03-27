package com.test.SYJ_Mall.productDetail;

import lombok.Data;

/**
 * 해당 상품에 관한 리뷰정보
 * @author shin
 *
 */

@Data
public class ProductDetailReviewDTO {
	private String userId;
	private int starCount;
	private int starCountRemain;
	private String reviewDate;
	private String comment;
	private int likeCount;
	private String likeYn;
}
