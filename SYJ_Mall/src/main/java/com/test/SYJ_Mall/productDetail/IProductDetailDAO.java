package com.test.SYJ_Mall.productDetail;

import java.util.List;

public interface IProductDetailDAO {
	
	/**
	 * 해당 상품 헤드페이지 가져오기
	 * @param prodtSeq
	 * @return
	 */
	List<String> getProductHeadImages(int prodtSeq);
	
	/**
	 * 상품에 대한 상세정보(비로그인 상태)
	 * @param prodtSeq
	 * @return
	 */
	List<ProductDetailDTO> getProductDetailInfo(int prodtSeq);

}
