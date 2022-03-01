package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.common.utill.ErrorAlarm;
import com.common.utill.KakaoCookie;
import com.common.utill.StringFormatClass;
import com.test.SYJ_Mall.productDetail.IProductDetailService;

/**
 * 
 * @author shin
 *
 */
@Controller
public class ProductDetail {
	
	@Autowired
	private IProductDetailService service;

	
	//제품 상세 페이지
	@RequestMapping(value = "/productDetailMain.action", method = { RequestMethod.GET})
	public String productDetailMain(HttpServletRequest request, HttpServletResponse response,ErrorAlarm ea, KakaoCookie kc, StringFormatClass sf) {
		
		int result = service.getProductDetilMain(request,response,ea,kc,sf);
		
		if (result == 1) return "/semitiles/productDetail.layout";
		else return "/testwaiting/kakaoerror";
		
	}

}
