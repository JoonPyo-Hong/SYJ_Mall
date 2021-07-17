package com.test.SYJ_Mall.newGoods;

import javax.servlet.http.HttpServletRequest;

/**
 * NewGoodService 인터페이스
 * @author shin
 *
 */
public interface INewGoodService {
	
	/**
	 * 신규 목록 가장 위에있는 배너 어떤 상품과 그에관련된 어떤 사진을 가져올것인지 정해준다.
	 * @param request
	 */
	void setTopProductSetting(HttpServletRequest request);

}
