package com.test.SYJ_Mall.search;

import java.util.List;

public interface ISearchDAO {
	
	/**
	 * 검색창에 타이핑된 단어를 가지고 있는 품목정보 가져오기
	 * @param 	inputWord 검색한 단어
	 * @return	품목정보
	 */
	List<SearchNameDTO> getProdInfo(String inputWord);
	

}
