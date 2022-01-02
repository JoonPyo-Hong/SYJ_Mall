package com.test.SYJ_Mall.newGoods;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * NewGoodService 인터페이스
 * @author shin
 *
 */
public interface INewGoodService {
	
	/**
	 * 신규 목록 가장 위에있는 배너 어떤 상품과 그에관련된 어떤 사진을 가져올것인지 정해준다.
	 * @param request
	 * @return	1 : 성공, -1: 오류
	 */
	int setTopProductSetting(HttpServletRequest request);
	
	/**
	 * 캅차 테스트
	 * @param request
	 * @param response
	 * @return
	 */
	int capcharTest(HttpServletRequest request, HttpServletResponse response);

}
