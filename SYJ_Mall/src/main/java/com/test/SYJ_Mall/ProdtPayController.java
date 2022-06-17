package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.utill.ErrorAlarm;
import com.common.utill.KakaoCookie;
import com.common.utill.StringFormatClass;
import com.test.SYJ_Mall.prodtPay.IProdtPayService;
import com.test.SYJ_Mall.prodtPay.ProdtPayUserDTO;
/**
 * 상품결제 Controller
 * @author shin
 *
 */
@Controller
public class ProdtPayController {
	@Autowired
	private IProdtPayService service;
	
	//결제페이지 화면
	@RequestMapping(value = "/prodtPayMain.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodtPayMain(HttpServletRequest request, HttpServletResponse response, KakaoCookie kc, ErrorAlarm ea, StringFormatClass sf) {
		
		int result = service.getProdtPayStart(request,response,kc,ea,sf);
		
		request.setAttribute("topInputWord", "주문하기");
		
		if (result == 1) return "/semitiles/productOrderPay.layout";
		else return "/testwaiting/kakaoerror";
		
	}
	
	//결제페이지 화면
	@RequestMapping(value = "/prodtPayUserInfos.action", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ProdtPayUserDTO prodtPayUserInfos(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		return service.getProdtPayUserInfos(request,response,ea);
	}
	
}
