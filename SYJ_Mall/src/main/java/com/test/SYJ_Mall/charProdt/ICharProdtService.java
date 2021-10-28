package com.test.SYJ_Mall.charProdt;

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
	
	
}
