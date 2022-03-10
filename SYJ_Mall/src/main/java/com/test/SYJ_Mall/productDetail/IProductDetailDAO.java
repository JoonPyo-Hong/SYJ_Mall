package com.test.SYJ_Mall.productDetail;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.utill.KakaoCookie;

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
	
	/**
	 * 잠깐만 이 상품은 어때요 상품정보
	 * @param basketInfo
	 * @param parseInt
	 * @param filterSeq
	 * @return
	 */
	List<ProductHowDTO> getProductHowInfo(String basketInfo,int prodtSeq, int filterSeq);
	
	

}
