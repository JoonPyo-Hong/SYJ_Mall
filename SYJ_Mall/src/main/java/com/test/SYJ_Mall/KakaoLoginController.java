package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
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
		 ObjectMapper mapper = new ObjectMapper();

	    // Create the outer JSON object
	    ObjectNode outerObject = mapper.createObjectNode();

	    // Create the inner JSON object
	    ObjectNode innerObject1 = mapper.createObjectNode();
	    innerObject1.put("productName", "춘식이 인형");
	    innerObject1.put("productPrice", "300000");

	    // Put the inner object inside the outer object
	    outerObject.set("product1", innerObject1);

	    ObjectNode innerObject2 = mapper.createObjectNode();
	    innerObject2.put("productName", "라이언 인형");
	    innerObject2.put("productPrice", "100000");


	    // Put the inner object inside the outer object
	    outerObject.set("product2", innerObject2);
	    
	    
	    // Print the outer object
	    // System.out.println(mapper.writeValueAsString(outerObject));
		
	    // Parse the JSON string into a JsonNode
	    JsonNode root = mapper.readTree(outerObject.toString());

	    // Get the product2 node
	    JsonNode products = root.get("product2");

	    // Get the productName value
	    String productName = products.get("productName").asText();

	    // Print the productName value
	    System.out.println("Product name: " + productName);
		
		
		
		
		
		return null;
	}
	
}
