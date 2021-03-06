package com.test.SYJ_Mall.common;

import java.util.List;

import com.test.SYJ_Mall.prodtPay.ProdtPayDTO;

/**
 * 공통 기능 dao 인터페이스
 * @author shin
 *
 */
public interface ICommonDAO {
	
	/**
	 * 알람관련 체크 기능
	 * @param userSeq
	 * @param productId
	 * @return
	 */
	int setProdtAlarmChecking(int userSeq, int productId);
	
	/**
	 * 장바구니 관련 체크 기능 (로그인 된 경우)
	 * @param userSeq
	 * @param prodtId
	 * @return
	 */
	int setBasketProdtChecking(int userSeq, int prodtId);
	
	/**
	 * 해당 리뷰에 대해서 유저가 좋아요를 했는지 아닌지 확인해주고 또한 좋아요 처리에 대한 로직
	 * @param userSeq
	 * @param orderSeq
	 * @param prodtId
	 * @return
	 */
	int setReviewLikeControl(int userSeq, int orderSeq, int prodtId);
	
	/**
	 * 체크박스에서 해당 물품의 갯수를 선택할 경우 해당 제품의 정보를 다시 가져와주는 로직
	 * @param prodtSeq
	 * @return
	 */
	List<ProdtPayDTO> getProdtDtos(int prodtSeq);

}
