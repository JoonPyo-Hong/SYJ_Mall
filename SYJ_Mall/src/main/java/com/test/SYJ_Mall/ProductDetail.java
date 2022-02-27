package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	// 물품페이지 상세 
	@RequestMapping(value = "/productDetailMain.action", method = { RequestMethod.GET})
	public String productDetailMain(HttpServletRequest request, HttpServletResponse response) {
		
		//String prodtSeq = request.getParameter("prodtSeq");//제품번호
		
		
		return "/semitiles/productDetail.layout";
	}

}
