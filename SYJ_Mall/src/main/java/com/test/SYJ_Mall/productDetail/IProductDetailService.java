package com.test.SYJ_Mall.productDetail;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.utill.CommonDAO;
import com.common.utill.ErrorAlarm;
import com.common.utill.KakaoCookie;
import com.common.utill.StringFormatClass;

/**
 * 
 * @author shin
 *
 */
public interface IProductDetailService {
	
	
	/**
	 * 제품 상세 정보 관련
	 * @param request
	 * @param response
	 * @param ea
	 * @param kc
	 * @param sf
	 * @param rnd
	 * @return
	 */
	int getProductDetilMain(HttpServletRequest request, HttpServletResponse response,ErrorAlarm ea, KakaoCookie kc, StringFormatClass sf, Random rnd);
	
	/**
	 * 쿠키에 존재하는 장바구니 내역 - 비로그인 경우
	 * @param request
	 * @param response
	 * @param kc
	 * @return
	 */
	String getCookieBasket(HttpServletRequest request, HttpServletResponse response, KakaoCookie kc);
	
	/**
	 * 장바구니 관련 메소드
	 * @param request
	 * @param response
	 * @param ea
	 * @param kc
	 * @param sf
	 * @param sb
	 * @return
	 */
	int getProductDetailModifyBasket(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, KakaoCookie kc, StringFormatClass sf, StringBuffer sb);
	
	/**
	 * 회원이 로그인 했는지 안했는지 확인해주는 메소드
	 * @param request
	 * @param response
	 * @param ea
	 * @return
	 */
	int getProductLoginYn(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea);
	
	/**
	 * 상품알람관련 기능
	 * @param request
	 * @param response
	 * @param ea
	 * @param cdao
	 * @return
	 */
	int getProductDetailModifyAlarm(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, CommonDAO cdao);
	
}
