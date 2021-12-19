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
	 * 인기상품 갯수
	 * @return 인기상품 갯수
	 */
	int getPopularItemCount();

}
