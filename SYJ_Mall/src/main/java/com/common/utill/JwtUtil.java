package com.common.utill;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;


/**
 * Login token
 * 
 * @author sinseunghwan
 *
 */

public class JwtUtil {
	
	
	// Generate token
	public String createToken(String jwtSecretKey) {
		
		Map<String,Object> headers = new HashMap<>();
		
		headers.put("typ", "JWT");
		
		headers.put("alg", "HS256");
		
		
		Map<String,Object> payloads = new HashMap<>();
		
		payloads.put("apiKey","public1234");
		
		Long expiredTime = 1000 * 60L * 60L * 1L; // 1 hour
		
		Date ext = new Date();
		ext.setTime(ext.getTime() + expiredTime);
		
		
		String jwt = Jwts.builder()
				.setHeader(headers)
				.setClaims(payloads)
				.setSubject("user-auth")
				.setExpiration(ext)
				.signWith(SignatureAlgorithm.HS256, jwtSecretKey.getBytes())
				.compact();
		
		
		//jwt.
		
		return jwt;
		
	}
	
	
	public Map<String,Object> verifyJWT(String jwtSecretKey, String authorization) throws UnsupportedEncodingException {
		
		Map<String,Object> claimMap = null;
		
		try {
			
			Claims claims = Jwts.parser()
					.setSigningKey(jwtSecretKey.getBytes("UTF-8"))
					.parseClaimsJws(authorization)
					.getBody();
			
			claimMap = claims;
			
			
		} catch (ExpiredJwtException e) {
			System.out.println("expire");
			System.out.println(e);
		} catch (Exception e) {
			System.out.println("error");
		}
		
		
		return claimMap;
		
	}
 
}
