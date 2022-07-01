package com.test.SYJ_Mall.prodtPay;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.utill.ErrorAlarm;
import com.common.utill.KakaoCookie;
import com.common.utill.StringFormatClass;

/**
 * 상품결제 Service 인터페이스
 * @author shin
 *
 */
public interface IProdtPayService {
	
	/**
	 * 결제화면 메인
	 * @param request
	 * @param response
	 * @param kc
	 * @param ea
	 * @param sf
	 * @return
	 */
	int getProdtPayStart(HttpServletRequest request, HttpServletResponse response, KakaoCookie kc, ErrorAlarm ea,StringFormatClass sf);
	
	/**
	 * 고객의 기본 배송정보 가져오기
	 * @param request
	 * @param response
	 * @param ErrorAlarm
	 * @return
	 */
	ProdtPayUserDTO getProdtPayUserInfos(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea);
	
	/**
	 * 체크박스에서 해당 물품의 갯수를 선택할 경우 해당 제품의 정보를 다시 가져와주는 로직
	 * @param request
	 * @param response
	 * @param ea
	 * @param sf
	 * @return
	 */
	List<ProdtPayDTO> getProdtCheckedInfos(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, StringFormatClass sf);

	/**
	 * 회원의 기프트카드 조회
	 * @param request
	 * @param response
	 * @param ea
	 * @param sf
	 * @return
	 */
	String getProdtUserGiftCard(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea,StringFormatClass sf);

	


}
