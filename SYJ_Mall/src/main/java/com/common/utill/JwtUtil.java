package com.common.utill;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.Data;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

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
//@PropertySource("classpath:syjValue.properties")
//@PropertySource("classpath*:com/test/spring/mapper/syjValue.properties")
//@Service
@Component
@Data
public class JwtUtil {
	
	
	@Value("${test}")
	private String test;

	
	// Generate token - basic
	public String createToken(String jwtSecretKey) {
		
		Map<String,Object> headers = new HashMap<>();
		
		headers.put("typ", "JWT");
		
		headers.put("alg", "HS256");
		
		
		Map<String,Object> payloads = new HashMap<>();
		
		payloads.put("test","kakakak");
		
		//Long expiredTime = 1000 * 60L * 60L * 1L; // 1 hour
		
		Long expiredTime = 1000 * 10L;
		
		Date ext = new Date();
		ext.setTime(ext.getTime() + expiredTime);
		
		
		String jwt = Jwts.builder()
				.setHeader(headers)
				.setClaims(payloads)
				.setSubject("user-auth")
				.setExpiration(ext)
				.signWith(SignatureAlgorithm.HS256, jwtSecretKey.getBytes())
				.compact();
		
		return jwt;
		
	}
	
	
	/**
	 * Generate token - input payloads
	 * 
	 * @param jwtSecretKey
	 * @param payloads
	 * @return
	 */
	public String createTokenInputPayloads(String jwtSecretKey, Map<String,Object> payloads) {
		
		Map<String,Object> headers = new HashMap<>();
		headers.put("typ", "JWT");
		headers.put("alg", "HS256");
		
		Long expiredTime = 1000 * 60L * 60L * 1L; // 1 hour
		
		Date ext = new Date();
		ext.setTime(ext.getTime() + expiredTime);
		
		
		String jwt = Jwts.builder()
				.setHeader(headers)
				.setClaims(payloads)
				.setSubject("SYJ_Mall-user-auth")
				.setExpiration(ext)
				.signWith(SignatureAlgorithm.HS256, jwtSecretKey.getBytes())
				.compact();
		
		return jwt;
		
	}
	
	
	
	/**
	 * aChecks if the jwt token is a valid token.
	 * 
	 * 
	 * @param jwtSecretKey
	 * @param authorization
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public Map<String,Object> verifyJWT(String jwtSecretKey, String authorization) {
		
		Map<String,Object> claimMap = null;
		
		try {
			
			
			Claims claims = Jwts.parser()
					.setSigningKey(jwtSecretKey.getBytes("UTF-8"))
					.parseClaimsJws(authorization)
					.getBody();
			
			claimMap = claims;
			
			
		} catch (ExpiredJwtException e) {
			// Token information is valid, but it has expired.
			System.out.println("expire");
			System.out.println(e);
			
			
			
			
		} catch (Exception e) {
			// Token information itself is invalid
			System.out.println("error");
			System.out.println(e);
			
		}
		
		return claimMap;
		
		
	}
 
}
