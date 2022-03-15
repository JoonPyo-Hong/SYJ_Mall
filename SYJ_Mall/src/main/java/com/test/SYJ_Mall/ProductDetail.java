package com.test.SYJ_Mall;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.utill.CommonDAO;
import com.common.utill.ErrorAlarm;
import com.common.utill.KakaoCookie;
import com.common.utill.StringFormatClass;
import com.test.SYJ_Mall.productDetail.IProductDetailService;

/**
 * 제품상세
 * @author shin
 *
 */
@Controller
public class ProductDetail {
	
	@Autowired
	private IProductDetailService service;

	
	//제품 상세 페이지
	@RequestMapping(value = "/productDetailMain.action", method = { RequestMethod.GET , RequestMethod.POST})
	public String productDetailMain(HttpServletRequest request, HttpServletResponse response,ErrorAlarm ea, KakaoCookie kc, StringFormatClass sf, Random rnd) {
		
		int result = service.getProductDetilMain(request,response,ea,kc,sf, rnd);
		
		if (result == 1) return "/semitiles/productDetail.layout";
		else return "/testwaiting/kakaoerror";
		
	}
	
	
	//제품 상세 페이지 - 장바구니 관련 
	@RequestMapping(value = "/productDetailBasket.action", method = { RequestMethod.GET})
	@ResponseBody
	public int productDetailBasket(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, KakaoCookie kc, StringFormatClass sf, StringBuffer sb) {
				
		return service.getProductDetailModifyBasket(request,response,ea,kc,sf,sb);

	}
	
	
	//고객이 로그인 해줬는지 안해줬는지 확인해주는 메소드
	@RequestMapping(value = "/productDetailLoginCheck.action", method = { RequestMethod.GET})
	@ResponseBody
	public int productDetailLoginCheck(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		
		return service.getProductLoginYn(request,response,ea);

	}
	
	//제품 상세 페이지 - 알람 관련
	@RequestMapping(value = "/productDetailAlarm.action", method = { RequestMethod.GET})
	@ResponseBody
	public int productDetailModifyAlarm(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, CommonDAO cdao) {
				
		return service.getProductDetailModifyAlarm(request,response,ea,cdao);

	}

}
