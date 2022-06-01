package com.test.SYJ_Mall;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.utill.CommonDate;
import com.common.utill.ErrorAlarm;
import com.common.utill.KakaoCookie;
import com.common.utill.ServerTesting;
import com.common.utill.StringFormatClass;
import com.test.SYJ_Mall.productDetail.IProductDetailService;
import com.test.SYJ_Mall.productDetail.ProductDetailReviewDTO;

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
	public String productDetailMain(HttpServletRequest request, HttpServletResponse response,ErrorAlarm ea, KakaoCookie kc, StringFormatClass sf, Random rnd,CommonDate cd) {
		
		int result = service.getProductDetilMain(request,response,ea,kc,sf, rnd ,cd);
		
		if (result == 1) return "/semitiles/productDetail.layout";
		else return "/testwaiting/kakaoerror";
		
	}
	
	//제품 상세 페이지
	@RequestMapping(value = "/productReviewAdd.action", method = { RequestMethod.GET , RequestMethod.POST})
	@ResponseBody
	public List<ProductDetailReviewDTO> productReviewAdd(HttpServletRequest request, HttpServletResponse response,ErrorAlarm ea) {
		
		return service.getProdtReviewPage(request,ea);
	}
	
	//리뷰쓰기
	@RequestMapping(value = "/productReviewWrite.action", method = { RequestMethod.GET , RequestMethod.POST})
	@ResponseBody
	public int productReviewWrite(HttpServletRequest request, HttpServletResponse response,ErrorAlarm ea) {
		
		return service.getReviewWritingInfo(request,ea);
	}
	
	//리뷰쓰기(test 용도)
	@RequestMapping(value = "/shtestint.action", method = { RequestMethod.GET , RequestMethod.POST})
	public String shtestint(HttpServletRequest request, HttpServletResponse response,ErrorAlarm ea){
		
		//MessageSender ms = new MessageSender("test","<div>test</div>","ssh9308@naver.com");
		//ms.sendDefaultHtmlMassage();
		
		ServerTesting st = new ServerTesting();
		
		try {
			st.erruptError();
		} catch(Exception e) {
			System.out.println("??");
			ea.basicErrorException(request, e);
		}
		
		
		return null;
	}
	
}
