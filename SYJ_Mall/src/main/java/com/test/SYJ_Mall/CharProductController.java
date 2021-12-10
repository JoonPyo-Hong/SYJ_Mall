package com.test.SYJ_Mall;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.utill.Performance;
import com.test.SYJ_Mall.charProdt.CharProdtDTO;
import com.test.SYJ_Mall.charProdt.ICharProdtService;

/**
 * 캐릭터별 페이지 컨트롤러
 * 
 * @author shin
 *
 */
@Controller
public class CharProductController {

	@Autowired
	private ICharProdtService service;

	// 캐릭터별 페이지 안내 -> 라이언,춘식 등등
	@RequestMapping(value = "/charAtProdtStart.action", method = { RequestMethod.GET })
	public String charProdtStart(HttpServletRequest request, HttpServletResponse response) {
		int result = service.setCharProdtStart(request, response);
		
		if (result == 1) {
			return "/charProdt/charProdtMain";
		} else {
			return "/testwaiting/kakaoerror";
		}

	}

	// 캐릭터 상품 무한스크롤
	@RequestMapping(value = "/charAtProdtStart.action", method = { RequestMethod.POST })
	@ResponseBody
	public List<CharProdtDTO> charProdtScroll(HttpServletRequest request, HttpServletResponse response) {

		return service.getCharProdtAjax(request);
	}

	// 캐릭터별 상품 장바구니 관련
	@RequestMapping(value = "/charItemBasketSet.action", method = { RequestMethod.GET })
	@ResponseBody
	public int charItemBasketSet(HttpServletRequest request, HttpServletResponse response) {

		return service.charProdtBasketItem(request, response);

	}

	// 캐릭터별 상품 장바구니 관련
	@RequestMapping(value = "/charItemAlarmSet.action", method = { RequestMethod.GET })
	@ResponseBody
	public int charItemAlarmSet(HttpServletRequest request, HttpServletResponse response) {

		return service.charProdtAlarmItem(request);

	}
	
	//왼쪽 슬라이드로 넘어온 경우
	@RequestMapping(value = "/charAtProdtStartSlide.action", method = { RequestMethod.GET })
	public String charAtProdtStartSlide(HttpServletRequest request, HttpServletResponse response) {

		int result = service.setCharProdtStartSlide(request, response);

		if (result == 1) {
			return "/charProdt/charProdtMain";
		} else {
			return "/testwaiting/kakaoerror";
		}

	}

}
