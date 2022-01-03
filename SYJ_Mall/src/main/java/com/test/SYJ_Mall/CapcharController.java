package com.test.SYJ_Mall;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.SYJ_Mall.newGoods.INewGoodService;

@Controller
public class CapcharController {

	@Autowired
	private INewGoodService service;

	// 캅챠 테스트
	@RequestMapping(value = "/capcharTest.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String capcharMain(HttpServletRequest request, HttpServletResponse response) {

		//int result = service.capcharTest(request, response);

		return "/test/capchartest";
	}
	
	// 캅챠 테스트
	@RequestMapping(value = "/capcharMainAjax.action", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public boolean capcharMainAjax(HttpServletRequest request, HttpServletResponse response) {
		
		final String url = "https://www.google.com/recaptcha/api/siteverify";
	    final  String USER_AGENT = "Mozilla/5.0";
	    final String secret = "6Lcw6-UdAAAAALpyLzhRIdj2NxGs1hKaKMac-678"; //local

	    try {
	    	
	    	String gRecaptchaResponse = request.getParameter("recaptcha");
	    	
	    	 if (gRecaptchaResponse == null || "".equals(gRecaptchaResponse)) {
	             return false;
	         }

	    	 URL obj = new URL(url);
	         HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

	         // add reuqest header
	         con.setRequestMethod("POST");
	         con.setRequestProperty("User-Agent", USER_AGENT);
	         con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
	  
	         String postParams = "secret=" + secret + "&response="+ gRecaptchaResponse;
	         
	         // Send post request
	         con.setDoOutput(true);
	         DataOutputStream wr = new DataOutputStream(con.getOutputStream());
	         wr.writeBytes(postParams);
	         wr.flush();
	         wr.close();
	  
	         int responseCode = con.getResponseCode();
	         System.out.println("\nSending 'POST' request to URL : " + url);
	         System.out.println("Post parameters : " + postParams);
	         System.out.println("Response Code : " + responseCode);
	  
	         BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
	         String inputLine;
	         StringBuffer responses = new StringBuffer();
	  
	         while ((inputLine = in.readLine()) != null) {
	        	 responses.append(inputLine);
	         }
	         in.close();
	  
	         // print result
	         //System.out.println("result : "+ responses.toString());
	         String result = responses.toString();
	         //JSONObject jObject = new JSONObject(result);
	         JSONParser parser = new JSONParser();
	         
	         JSONObject jsonObj = (JSONObject) parser.parse(result);

	         System.out.println(jsonObj.get("success"));
	         
	         //parse JSON response and return 'success' value
	         //JsonReader jsonReader = Json.createReader(new StringReader(response.toString()));
	         //JsonObject jsonObject = jsonReader.readObject();
	         //jsonReader.close();
	         
	         
	         //System.out.println(jsonObject);
	         //System.out.println(jsonObject.getBoolean("success"));
	         //return jsonObject.getBoolean("success");

	    	return false;
	    	//System.out.println(recaptcha);
	    	
	    	
	    } catch(Exception e) {
	    	e.printStackTrace();
	    	return false;
	    }
		
		
		//int result = service.capcharTest(request, response);
		
		//VerifyRecaptcha.setSecretKey("시크릿 코드");
	    //String gRecaptchaResponse = request.getParameter("recaptcha");
		
		
	}
	
	
	
}
