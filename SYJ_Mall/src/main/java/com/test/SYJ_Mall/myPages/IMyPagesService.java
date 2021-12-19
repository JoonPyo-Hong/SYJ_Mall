package com.test.SYJ_Mall.myPages;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IMyPagesService {
	
	/**
	 * 마이페이지 진입 페이지
	 * @param request
	 * @param response
	 * @return
	 */
	int getMyPageSelect(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 마이페이지 - 최근 본 페이지
	 * @param request
	 * @param response
	 * @return
	 */
	int getMyPageSeen(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 쿠키에 존재하는 나의 상품 클릭내역 가져오기
	 * @param request
	 * @param response
	 * @return
	 */
	String getCookieSeen(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 최근본 상품 목록에서 해당 상품 지워주기 -> 쿠키에서 제거
	 * @param request
	 * @param response
	 * @return
	 */
	int deleteMyPageProdSeen(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 최근본 상품 목록에서 모든 상품 지워주기 -> 쿠키에서 제거
	 * @param request
	 * @param response
	 * @return
	 */
	int deleteMyPageAllProdSeen(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 내 활동 페이지
	 * @param request
	 * @param response
	 * @return 
	 */
	int getMyPageTrace(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 내 장바구니 페이지
	 * @param request
	 * @param response
	 * @return
	 */
	int getMyPageBasket(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 장바구니 페이지 특정물품 삭제하기
	 * @param request
	 * @param response
	 * @return
	 */
	int deleteMyPageBasket(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 장바구니 페이지 특정물품 삭제하기 - 여러개
	 * @param request
	 * @param response
	 * @return
	 */
	List<Integer> deleteMyPageBaskets(HttpServletRequest request, HttpServletResponse response);
	
}
