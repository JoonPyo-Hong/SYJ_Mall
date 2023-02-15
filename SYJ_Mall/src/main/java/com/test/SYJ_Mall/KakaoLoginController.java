package com.test.SYJ_Mall;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.common.utill.KakaoCookies;
import com.common.utill.Performance;
import com.test.SYJ_Mall.kafkaoLogin.IKakaoLoginService;

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
	@RequestMapping(value = "/kakaoLoginStart.action", method = { RequestMethod.GET , RequestMethod.POST})
	public String kakaoLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		/*
		
		 Preprocessing for sending to login page
		 
		 1. Pre-processing when user account information exists in the current web cookie information -> Check if the user wants to remain logged in
		 2. After the user successfully logs in, Access the login screen again (banned) -> Send to main menu
		 3. For encryption of user password, RSA information must be set.
		 4. 
		  
		  
		*/
		
		
		//Performance pf = new Performance();
		
		KakaoCookies kc = new KakaoCookies();
		
		
		Map<String,String> map = new HashMap<>();
		
		map.put("test1", "apple1");
		map.put("test2", "apple22");
		map.put("test3", "apple333");
		map.put("test4", "apple4444");
		map.put("test5", "apple55555");
		
		
		kc.generateCookie(response, "mapCookie", map, -1);
		
		
		List<String> cookieList = new ArrayList<>();
		
		for (int i = 0; i < 30; i++) {
			cookieList.add(Integer.toString(i));
		}
		
		
		kc.generateCookie(response, "listCookie", cookieList, -1);
		
		
		
		
		return null;
	}
	
	
	@RequestMapping(value = "/kakaoLoginUpgradeTest.action", method = { RequestMethod.GET , RequestMethod.POST})
	public String kakaoLoginUpgradeTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		
		KakaoCookies kc = new KakaoCookies();
		
		//System.out.println(kc.mapToCookieValue(kc.getCookiesMaps(request, "mapCookie")));
		
		//System.out.println(kc.listToCookieValue(kc.getCookiesList(request, "listCookie")));
		
		System.out.println(kc.listToCookieValue(kc.getCookiesList(request, "listCookie")));
		//kc.modifyMapCookies(request, response,"mapCookie", "test4", "123123123123");
		
		
		//Performance pf = new Performance();
		
		
		kc.deleteCookies(request, response, "listCookie");
		//kc.removeListCookies(request,response,"listCookie","10");
		//kc.removeListCookies(request,response,"listCookie","20");
		
		//pf.checkPerformance();
		
		System.out.println(kc.listToCookieValue(kc.getCookiesList(request, "listCookie")));
		//System.out.println(kc.mapToCookieValue(kc.getCookiesMaps(request, "mapCookie")));
		
		return null;
	}
	
	
	
	
}
