package com.test.SYJ_Mall.myPages;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.utill.ErrorAlarm;
import com.common.utill.KakaoCookie;
import com.common.utill.StringFormatClass;

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
	 * @param kc
	 * @return
	 */
	int getMyPageSeen(HttpServletRequest request, HttpServletResponse response,KakaoCookie kc);
	
	/**
	 * 쿠키에 존재하는 나의 상품 클릭내역 가져오기
	 * @param request
	 * @param response
	 * @param kc
	 * @return
	 */
	String getCookieSeen(HttpServletRequest request, HttpServletResponse response,KakaoCookie kc);
	
	/**
	 * 최근본 상품 목록에서 해당 상품 지워주기 -> 쿠키에서 제거
	 * @param request
	 * @param response
	 * @return
	 */
	int deleteMyPageProdSeen(HttpServletRequest request, HttpServletResponse response, KakaoCookie kc);
	
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
	
	/**
	 * 마이페이지 주문내역
	 * @param request
	 * @param response
	 * @param ea
	 * @return
	 */
	int getMyPageOrderList(HttpServletRequest request,HttpServletResponse response, ErrorAlarm ea);
	
	/**
	 * 주문정보 상세 내역
	 * @param request
	 * @param response
	 * @param ea
	 * @return
	 */
	int getProdtOrderHist(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea);
	
	/**
	 * 유저 정보 변경
	 * @param request
	 * @param response
	 * @param ea
	 * @return
	 */
	int getUserInfoEdited(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea);
	
	/**
	 * 유저정보를 변경해준다.
	 * @param request
	 * @param response
	 * @param ea
	 * @param sf
	 * @return
	 */
	int getUserInfoEditedUserName(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea , StringFormatClass sf);


	
}
