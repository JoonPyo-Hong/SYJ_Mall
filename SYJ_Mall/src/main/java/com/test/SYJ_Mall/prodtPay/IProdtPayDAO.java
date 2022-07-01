package com.test.SYJ_Mall.prodtPay;

import java.util.List;

/**
 * 상품결제 DAO 인터페이스
 * @author shin
 *
 */
public interface IProdtPayDAO {
	
	int getTest();
	
	/**
	 * 구매할 상품의 정보 가져오기
	 * @param prodtId
	 * @return
	 */
	List<ProdtPayDTO> getProdtPayList(String prodtId);
	
	/**
	 * 유저정보 가져와주기
	 * @param userSeq
	 * @return
	 */
	List<ProdtPayUserDTO> getProdtPayUserInfo(int userSeq);
	
	/**
	 * 유저의 기프트카드 잔액 가져오기
	 * @param userSeq
	 * @return
	 */
	String getProdtUserGiftMoney(int userSeq);

}
