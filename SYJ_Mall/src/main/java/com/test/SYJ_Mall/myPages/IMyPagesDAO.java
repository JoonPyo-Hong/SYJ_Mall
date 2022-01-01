package com.test.SYJ_Mall.myPages;

import java.util.List;

public interface IMyPagesDAO {
	
	/**
	 * 마이페이지 - 최근본 상품 리스트 가져오기
	 * @param seenList
	 * @return
	 */
	List<MyPageSeenDTO> getMyPageSeenList(String seenList);
	
	/**
	 * 마이페이지 - 장바구니 리스트(로그인 안된경우)
	 * @param basketList
	 * @return
	 */
	List<MyPageBasketDTO> getMyPageBasketNoLogin(String basketList);
	
	/**
	 * 마이페이지 - 장바구니 리스트(로그인 된 경우)
	 * @param userSeq
	 * @return
	 */
	List<MyPageBasketDTO> getMyPageBasketLogin(int userSeq);
	
	/**
	 * 마이페이지 - 장바구니 리스트 물품 제거(로그인이 된 경우)
	 * @param userSeq
	 * @param productIds
	 * @return
	 */
	int modifyBasketCookiesLogin(int userSeq, String productIds);
	
	
	/**
	 * 회원이 주문한 물품 객체들 가져오기
	 * @param userSeq
	 * @return
	 */
	List<MyPageOrderDTO> getMyPageDtoList(int userSeq);
	
	/**
	 * 회원이 주문한 물품 날짜객체만 가져오기
	 * @param userSeq
	 * @return
	 */
	List<String> getMyPageDtoDateList(int userSeq);

}
