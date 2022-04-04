package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.utill.ErrorAlarm;
import com.common.utill.KakaoCookie;
import com.common.utill.StringFormatClass;
import com.test.SYJ_Mall.common.ICommonService;


/**
 * 공통기능 컨트롤러
 * @author shin
 *
 */
@Controller
public class CommonController {
	@Autowired
	private ICommonService service;
	
	//고객이 로그인 해줬는지 확인해주는 메소드
	@RequestMapping(value = "/kakaoUserLoginCheck.action", method = { RequestMethod.GET })
	@ResponseBody
	public int kakaoUserLoginCheck(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		
		return service.getUserLoginChecking(request,response,ea);
	
	}
	
	
	//장바구니 클릭할 경우 -> 장바구니 input or output
	@RequestMapping(value = "/kakaoProductBasketChecking.action", method = { RequestMethod.GET })
	@ResponseBody
	public int kakaoProductBasketChecking(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, KakaoCookie kc, StringFormatClass sf, StringBuffer sb) {
		
		return service.getProdtBasketChecking(request,response,ea,kc,sf,sb);
	
	}
	
	//알람 클릭한 경우 -> 알람 설정 또는 알람 제거
	@RequestMapping(value = "/kakaoProductAlarmChecking.action", method = { RequestMethod.GET })
	@ResponseBody
	public int kakaoProductAlarmChecking(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		
		return service.getProductAlarmChecking(request,response,ea);
	}
	
	
	
	//소켓 테스트용1
	@RequestMapping(value = "/sylovesh.action", method = { RequestMethod.GET })
	public String socketId(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {

		return "/socketTest/idgen";

	}
	
	
	
	//소켓 테스트용
	@RequestMapping(value = "/syloveshtext.action", method = { RequestMethod.GET })
	public String socketTest(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		
		String id = request.getParameter("setId");
		
		request.setAttribute("id", id);
		
		return "/socketTest/websock";
	
	}
		
	
	
}
