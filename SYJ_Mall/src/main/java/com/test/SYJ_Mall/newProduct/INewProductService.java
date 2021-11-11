package com.test.SYJ_Mall.newProduct;

import java.util.List;

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
	 * @return	1: 물품추가, 2: 물품제거, -1: 오류	
	 */
	int setnewProductBasket(HttpServletRequest request, HttpServletResponse response);

	/**
	 * 알림관련 기능
	 * @param request
	 * @return	1: 물품추가, 2: 물품제거, -1: 오류	
	 */
	int setnewProductAlarm(HttpServletRequest request);

	/**
	 * 새로나온 친구들 물품 무한스크롤
	 * @param request
	 * @param response
	 * @return
	 */
	List<NewFriendsProdDTO> getNewFriendsProdts(HttpServletRequest request,HttpServletResponse response);

	/**
	 * 새로나온 친구들 더보기
	 * @param request
	 * @param response
	 * @return
	 */
	int getNewProdcutAddInfo(HttpServletRequest request, HttpServletResponse response);
}
