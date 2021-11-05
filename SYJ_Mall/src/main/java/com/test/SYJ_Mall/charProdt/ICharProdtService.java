package com.test.SYJ_Mall.charProdt;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 
 * @author shin
 *
 */
public interface ICharProdtService {
	
	/**
	 * 캐릭터별 상품 
	 * @param request
	 * @param response
	 * @return 1: 성공, -1: 실패
	 */
	int setCharProdtStart(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 캐릭터별 상품 무한스크롤
	 * @param request
	 * @return
	 */
	List<CharProdtDTO> getCharProdtAjax(HttpServletRequest request);
	
	/**
	 * 캐릭터별 상품 장바구니 관련
	 * @param request
	 * @param response
	 * @return
	 */
	int charProdtBasketItem(HttpServletRequest request, HttpServletResponse response);
	
}
