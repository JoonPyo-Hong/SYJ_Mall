package com.test.SYJ_Mall.dummy;

/**
 * IDummyDAO 인터페이스
 * @author shin
 *
 */
public interface IDummyDAO {
	
	/**
	 * 더미 넣기
	 * @param dto	dto 객체
	 * @return		1: 성공, -1 :실패
	 */
	int generateDummy(DummyDTO dto);
	
	/**
	 * 유저 명수 알아오기
	 * @return	유저명수
	 */
	int getuserCount();
	
	/**
	 * 상품 갯수 알아오기
	 * @return	상품개수
	 */
	int getProductCount();
	
	
	/**
	 * 상품구매 더미데이터 넣기
	 * @param dpdto	DummyProductDTO 객체
	 * @return		1: 성공, -1: 실패
	 */
	int putBuyDummy(DummyProductDTO dpdto);
	
	

	
}
