package com.common.utill;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import lombok.Data;

/**
 * Recapcha Util - Prevent Automatic Login
 * @author shin
 *
 */
@Data
public class ReCaptcha {
	
	final String url = "https://www.google.com/recaptcha/api/siteverify";
    final String USER_AGENT = "Mozilla/5.0";
	private String publicKey;
	private String secretKey;
	
	public ReCaptcha() {}
	
	public ReCaptcha(String publicKey, String secretKey) {
		this.publicKey = publicKey;
		this.secretKey = secretKey;
	}
	
	/**
	 * Logic of Recapcha
	 * @param request
	 * @return
	 */
	public int verifyCaprcha(HttpServletRequest request) {

		try {
			
			if (publicKey == null || "".equals(publicKey)) {
	            return -1;
	        }
			
			URL obj = new URL(url);
	        HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

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
	  
	        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
	        String inputLine;
	        StringBuffer responses = new StringBuffer();
	  
	        while ((inputLine = in.readLine()) != null) {
	       	 responses.append(inputLine);
	        }
	        in.close();
	        
	        
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
