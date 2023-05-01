package com.test.SYJ_Mall;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.common.utill.IpCheck;
import com.common.utill.JwtUtil;
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
	
	
	@Value("${test}")
	private String test;
	
	@Autowired 
	private IKakaoLoginService service;
	private JwtUtil ju;
	
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
	 * 
	 * 1) Prevents too many login attempts.
	 * 2) Prevents logging in through bots.
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
	 * Login input check process
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/kakaoLoginCheck.action", method = { RequestMethod.GET , RequestMethod.POST})
	@ResponseBody
	public int kakaoLoginCheck(HttpServletRequest request, HttpServletResponse response) {
		
		return service.loginPreCheck(request,response);
		
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
		
	
		System.out.println(test);
		
		
		///ju.test();
		
		//String privateKey = "Sh@#$170125";
		
		//String encode = ju.createToken(privateKey);
		
		//System.out.println(encode);
		
		//String encode = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyLWF1dGgiLCJ0ZXN0Ijoia2FrYWthayIsImV4cCI6MTY3NzMxNjQ2N30.Nyb-XlvCR-EQ19VgoUGRIyEMSQaZECCYhOFksHh5a6Q";
		
		//String encode = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyLWF1dGgiLCJhcGlLZXkiOiJwdWJsaWMxMjM0IiwidGVzdCI6Imtha2FrYWsiLCJleHAiOjE2NzcyNTI0Njd9.d1zE88JMbLki5PdLnkyDmXm0MptbUDfIUYR0bYc95_0";
		
		//Map<String,Object> decode = ju.verifyJWT(privateKey, encode);
		
		//System.out.println(decode.get("test"));
		
		
		//System.out.println(ju.createToken("test"));
		
		
		
		
		return null;
	}
	
	
	
	
}
