package com.test.SYJ_Mall.newProduct;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface INewProductService {
	
	/**
	 * 신규품목
	 * @param request
	 * @param response
	 * @return	1:성공, -1:실패
	 */
	int getNewProductInfo(HttpServletRequest request, HttpServletResponse response);
	
	
	/**
	 * 로그인 하지 않은 경우 쿠키에 있는 장바구니 내용 가져오기
	 * @param request	
	 * @param response
	 * @return	쿠키에 존재하는 장바구니 내역
	 */
	String getCookieBasket(HttpServletRequest request, HttpServletResponse response);

	/**
	 * 장바구니 클릭 기능
	 * @param request
	 * @param response
	 * @return		
	 */
	int setnewProductBasket(HttpServletRequest request, HttpServletResponse response);
}
