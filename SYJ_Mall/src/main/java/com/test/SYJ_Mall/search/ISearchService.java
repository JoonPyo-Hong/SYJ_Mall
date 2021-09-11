package com.test.SYJ_Mall.search;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 검색서비스
 * @author shin
 *
 */
public interface ISearchService {
	/**
	 * ajax를 사용해서 검색어를 입력하는 순간마다 해당 단어가 속한 품목을 가져와준다.
	 * @param 	inputWord	입력단어
	 * @return	해당단어를 가지고 있는 품목의 정보
	 */
	List<SearchNameDTO> getProdLittelInfo(String inputWord);
	
	/**
	 * 검색결과에 대한 물품정보들을 가져와준다.
	 * @param request
	 * @return	1: 성공, -1: 실패
	 */
	int getSearchResultProd(HttpServletRequest request);
	
	/**
	 * 마지막 접속 페이지 쿠키 가져오기
	 * @param request		
	 * @param response		
	 * @param cookieName	쿠키이름
	 * @return				해당 쿠키이름에 대응되는 value
	 */
	Object instanceCookie(HttpServletRequest request, HttpServletResponse response, String cookieName);
	
	/**
	 * 메인페이지로 보내주기
	 * @param request
	 */
	void goMain(HttpServletRequest request);
	


}
