package com.test.SYJ_Mall.popularItem;

import javax.servlet.http.HttpServletRequest;

public interface IPopularService {
	
	/**
	 * 인기 상품 보여주기
	 * @param request
	 * @return	1: 성공, -1: 실패
	 */
	int getPopularProductList(HttpServletRequest request);

}
