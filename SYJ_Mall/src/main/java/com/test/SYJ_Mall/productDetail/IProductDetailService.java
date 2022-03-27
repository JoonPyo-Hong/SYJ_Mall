package com.test.SYJ_Mall.productDetail;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.utill.CommonDate;
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
	 * @param cd
	 * @return
	 */
	int getProductDetilMain(HttpServletRequest request, HttpServletResponse response,ErrorAlarm ea, KakaoCookie kc, StringFormatClass sf, Random rnd, CommonDate cd);
	
	/**
	 * 쿠키에 존재하는 장바구니 내역 - 비로그인 경우
	 * @param request
	 * @param response
	 * @param kc
	 * @return
	 */
	String getCookieBasket(HttpServletRequest request, HttpServletResponse response, KakaoCookie kc);
	
	/**
	 * 제품 리뷰 관련 더 보기 기능 구현
	 * @param request
	 * @param ea
	 * @return
	 */
	List<ProductDetailReviewDTO> getProdtReviewPage(HttpServletRequest request, ErrorAlarm ea);
	

}
