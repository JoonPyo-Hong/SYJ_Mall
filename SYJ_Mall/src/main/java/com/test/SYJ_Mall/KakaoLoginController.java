package com.test.SYJ_Mall;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.common.utill.IpCheck;
import com.common.utill.KakaoCookies;
import com.common.utill.KakaoError;
import com.test.SYJ_Mall.kakaoLogin.IKakaoLoginService;

/**
 * Login 2.0 Controller - Completely new development to troubleshoot existing login codes
 * @author shin
 *
 */
@Controller
public class KakaoLoginController {
	
	@Autowired 
	private IKakaoLoginService service;
	
	
	/*---------------------------------------------------Login Page---------------------------------------------------------------------*/
	/*----------------------------------------------------------------------------------------------------------------------------------*/
	/*----------------------------------------------------------------------------------------------------------------------------------*/
	/*----------------------------------------------------------------------------------------------------------------------------------*/
	
	/**
	 * Login Pre-processing
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/kakaoLoginStart.action", method = { RequestMethod.GET , RequestMethod.POST})
	public String kakaoLogin(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) throws Exception {
		
		/*
		
		 Preprocessing for sending to login page
		 
		 1. After the user successfully logs in, Access the login screen again (banned) -> Send to main menu
		 2. Pre-processing when user account information exists in the current web cookie information -> Check if the user wants to remain logged in
		 3. For encryption of user password, RSA information must be set.
		 4. 
		 
		  
		*/
		KakaoCookies kc = new KakaoCookies();
		IpCheck ic = new IpCheck();
		
		
		/*===== 1. After the user successfully logs in, Access the login screen again (banned) -> Send to main menu =====*/
			
		String againLoginCheck = service.againLoginCheck(request,ic,kc);
			
		if (againLoginCheck != null) {
			redirectAttributes.addAttribute("main", againLoginCheck);
		    return "redirect:" + againLoginCheck;
		}
			
		
		
		/*===== 2. Pre-processing when user account information exists in the current web cookie information -> Check if the user wants to remain logged in =====*/
		try {
			
			String loginCookieInfo = service.getUserLoginCookieInfo(request,response,kc,ic);
			
			if (loginCookieInfo != null) return loginCookieInfo;
			
		} catch(Exception e) {
			KakaoError ea = new KakaoError(request, e);
			return ea.basicErrorException();
		}
		
		
		
		/*===== 3. For encryption of user password, RSA information must be set. =====*/
		return service.setUserRsaInfo(request);
	}
	

	
	/**
	 * kakaoLoginCapchar
	 * Prevents too many login attempts.
	 * Prevents logging in through bots.
	 * 
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/kakaoLoginCapcha.action", method = { RequestMethod.GET , RequestMethod.POST})
	@ResponseBody
	public int kakaoLoginCapcha(HttpServletRequest request) {
		
		return service.kakaoCapchaCheck(request);
	}
	
	
	/**
	 * Login input verification process
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/kakaoLoginVerification.action", method = { RequestMethod.GET , RequestMethod.POST})
	public String kakaoLoginVerification(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		return null;
		
	}
	
	
	
	
	@RequestMapping(value = "/kakaoLoginUpgradeTest.action", method = { RequestMethod.GET , RequestMethod.POST})
	public String kakaoLoginUpgradeTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		System.out.println("test");
		
//		KakaoCookies kc = new KakaoCookies();
		
//		Map<String,String> returnMap = kc.getCookiesMaps(request, "mapCookie");
//		
//		System.out.println(returnMap.get("test3"));
//		
//		
		
		
//		List<String> stringList = kc.getCookiesList(request, "listCookie");
//		
//		
//		for (String str : stringList) {
//			System.out.println("!!!");
//			System.out.println(str);
//		}
		
		//System.out.println(kc.mapToCookieValue(kc.getCookiesMaps(request, "mapCookie")));
		
		//System.out.println(kc.listToCookieValue(kc.getCookiesList(request, "listCookie")));
		
		//System.out.println(kc.listToCookieValue(kc.getCookiesList(request, "listCookie")));
		//kc.modifyMapCookies(request, response,"mapCookie", "test4", "123123123123");
		
		
		//Performance pf = new Performance();
		
		
		//kc.deleteCookies(request, response, "listCookie");
		//kc.removeListCookies(request,response,"listCookie","10");
		//kc.removeListCookies(request,response,"listCookie","20");
		
		//pf.checkPerformance();
		
		//System.out.println(kc.listToCookieValue(kc.getCookiesList(request, "listCookie")));
		//System.out.println(kc.mapToCookieValue(kc.getCookiesMaps(request, "mapCookie")));
		
		return null;
	}
	
	
	
	
}
