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
	 * 검색조건에 맞는 상품정보를 가져와준다
	 * @param inputName		상품이름
	 * @param productSeq	상품번호
	 * @return
	 */
	List<SearchProductDTO> getSearchResultProds(String inputName, String productSeq);
	

}
