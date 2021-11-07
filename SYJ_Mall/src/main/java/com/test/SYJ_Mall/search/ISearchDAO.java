package com.test.SYJ_Mall.search;

import java.util.List;

public interface ISearchDAO {
	
	/**
	 * 검색창에 타이핑된 단어를 가지고 있는 품목정보 가져오기
	 * @param 	inputWord 검색한 단어
	 * @return	품목정보
	 */
	List<SearchNameDTO> getProdInfo(String inputWord);
	

	/**
	 * 검색조건에 맞는 상품정보를 가져와준다 -> 로그인 안되어있는 경우
	 * @param inputName			상품이름
	 * @param productSeq		상품번호
	 * @param pagingCount		상품 페이징 카운트
	 * @param basketList		쿠키정보에 담긴 장바구니 상품 리스트
	 * @param sortedOption		정렬옵션
	 * @param sortedCharOption	캐릭터 필터링 옵션
	 * @return
	 */
	List<SearchProductDTO> getSearchResultProds(String inputName, String productSeq, int pagingCount, String basketList,String sortedOption, String sortedCharOption);

	/**
	 * 검색조건에 맞는 상품 총 갯수를 가져와준다.
	 * @param inputName			상품이름
	 * @param productSeq		상품번호	
	 * @param sortedCharOption	캐릭터 필터링 옵션
	 * @return					총상품 갯수
	 */
	int getSearchResultProdsCount(String inputName, String productSeq, String sortedCharOption);
	
	/**
	 * 검색조건에 맞는 상품정보를 가져와준다 -> 로그인 되어 있는 경우
	 * @param userSeq		
	 * @param inputName		상품이름
	 * @param productSeq	상품번호	
	 * @param pagingCount	상품 페이징 카운트
	 * @param sortedOption	정렬옵션
	 * @return
	 */
	List<SearchProductDTO> getSearchResultProdsLogon(int userSeq, String inputName, String productSeq, int pagingCount,String sortedOption);
	

}
