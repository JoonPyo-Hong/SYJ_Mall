package com.common.utill;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 * 리캅차 유틸 - 자동 로그인 방지
 * @author shin
 *
 */
public class ReCaptchar {
	
	final String url = "https://www.google.com/recaptcha/api/siteverify";
    final String USER_AGENT = "Mozilla/5.0";
	private String publicKey;
	private String secretKey;
	
	public String getPublicKey() {
		return publicKey;
	}
	
	public void setPublicKey(String publicKey) {
		this.publicKey = publicKey;
	}

	public String getSecretKey() {
		return secretKey;
	}

	public void setSecretKey(String secretKey) {
		this.secretKey = secretKey;
	}
	
	public ReCaptchar(String publicKey, String secretKey) {
		this.publicKey = publicKey;
		this.secretKey = secretKey;
	}
	
	/**
	 * 리캅차 사용 로직
	 * @param request
	 * @return
	 */
	public int verifyCaprcha(HttpServletRequest request) {

		try {
			
			if (publicKey == null || "".equals(publicKey)) {
	            return -1;
	        }
			
			//System.out.println(publicKey);
			//System.out.println(secretKey);
			
			
			URL obj = new URL(url);
	        HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

	        // add reuqest header
	        con.setRequestMethod("POST");
	        con.setRequestProperty("User-Agent", USER_AGENT);
	        con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
	  
	        String postParams = "secret=" + secretKey + "&response="+ publicKey;
	        
	        // Send post request
	        con.setDoOutput(true);
	        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
	        wr.writeBytes(postParams);
	        wr.flush();
	        wr.close();
	        
	        int responseCode = con.getResponseCode();
	        //System.out.println("\nSending 'POST' request to URL : " + url);
	        //System.out.println("Post parameters : " + postParams);
	        //System.out.println("Response Code : " + responseCode);
	  
	        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
	        String inputLine;
	        StringBuffer responses = new StringBuffer();
	  
	        while ((inputLine = in.readLine()) != null) {
	       	 responses.append(inputLine);
	        }
	        in.close();
	        
	       // System.out.println(responses.toString());
	        
	        String result = responses.toString();
	        JSONParser parser = new JSONParser();
	        JSONObject jsonObj = (JSONObject) parser.parse(result);
	        
	        if ((Boolean)jsonObj.get("success")) {
	        	return 1;
	        } else {
	        	return -2;
	        }


	        
		} catch(Exception e) {
			
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);
				
			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			
			return -3;
		}
		
	}
    
    
}
