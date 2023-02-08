package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	@RequestMapping(value = "/kakaoLogin.action", method = { RequestMethod.GET , RequestMethod.POST})
	public String kakaoLogin(HttpServletRequest request, HttpServletResponse response) {
		
		/*
		
		 Preprocessing for sending to login page
		 
		 1. Pre-processing when user account information exists in the current web cookie information -> Check if the user wants to remain logged in
		 2. After the user successfully logs in, Access the login screen again -> Send to main menu
		 3. For encryption of user password, RSA information must be set.
		 4. 
		  
		  
		*/
		
		
		
		return null;
	}
	
}
