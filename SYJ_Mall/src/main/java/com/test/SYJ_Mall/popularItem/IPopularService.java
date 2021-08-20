package com.test.SYJ_Mall.popularItem;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface IPopularService {

	/**
	 * 인기페이지 상품 나열해줄것
	 * @param request
	 * @param paging	페이징 변수
	 * @return			1: 성공, -1: 실패
	 */
	int getPopularProductList(HttpServletRequest request,int paging);
	
	/**
	 * 인기페이지 상품 나열하는데 ajax 처리 해줄부분 -> 무한스크롤
	 * @param paging	페이징 변수
	 * @return			PopularItemDTO 객체
	 */
	List<PopularItemDTO> getPopularProductAjax(int paging);

}
