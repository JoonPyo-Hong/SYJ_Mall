package com.test.SYJ_Mall.popularItem;

import java.util.List;

public interface IPoupularDAO {
	

	/**
	 * 인기 상품 진열
	 * @param paging		페이징 변수
	 * @param userSeq		로그인 한 경우 - 회원고유번호
	 * @param basketList	로그인 안한경우 - 상품장바구니 정보
	 * @return				PopularItemDTO 객체의 리스트
	 */
	List<PopularItemDTO> getPopularItem(int paging, int userSeq, String basketList);
	
	
	
	/**
	 * 회원이 선택한 상품 장바구니에 넣어주기
	 * @param userSeq		상품번호
	 * @param productId		상품고유번호
	 * @return				1 : 성공, -1 : 실패 , -2 : 에러발생 
	 */
	int inputItemBasket(int userSeq, int productId);


	/**
	 * 회원이 선택한 상품 장바구니에서 빼주기
	 * @param userSeq		상품번호
	 * @param productId		상품고유번호
	 * @return				1 : 성공, -1 : 실패 , -2 : 에러발생 
	 */
	int outputItemBasket(int userSeq, int productId);


	/**
	 * 쿠키에존재하는 상품 회원의 디비로 모두 넣어주기
	 * @param userSeq		회원고유번호
	 * @param basketList	쿠키에 존재하는 상품리스트
	 * @return				1: 성공, -1 : 실패
	 */
	int setCookieToDbBasketList(int userSeq, String basketList);


	/**
	 * 회원의 장바구니와 쿠키 장바구니를 비교
	 * @param userSeq		회원번호
	 * @param basketList	장바구니 리스트(쿠키)
	 * @return				새로 추가해야할 상품번호
	 */
	String getCookieProductId(int userSeq, String basketList);

	

	


}
