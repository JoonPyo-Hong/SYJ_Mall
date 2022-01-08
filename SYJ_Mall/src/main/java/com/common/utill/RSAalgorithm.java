package com.common.utill;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;
import java.util.HashMap;

import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * RSA 대칭키 알고리즘
 * @author shin	
 *
 */
public class RSAalgorithm {
	
	/**
	 * RSA 대칭키 알고리즘 - 공개키와 개인키 부여
	 * @param request
	 * @throws NoSuchAlgorithmException
	 * @throws InvalidKeySpecException
	 */
	public void setRSA(HttpServletRequest request) throws NoSuchAlgorithmException, InvalidKeySpecException {
		
		HttpSession session = request.getSession();
		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");

		generator.initialize(2048);

		KeyPair keyPair = generator.genKeyPair();
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");

		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();

		// 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
		session.setAttribute("__rsaPrivateKey__", privateKey);


		// 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
		RSAPublicKeySpec publicSpec = keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);



		String publicKeyModulus = publicSpec.getModulus().toString(16);

		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

		request.setAttribute("publicKeyModulus", publicKeyModulus);

		request.setAttribute("publicKeyExponent", publicKeyExponent);
		
		
	}
	
	/**
	 * 암호화된 문자열을 복호화한다.
	 * @param request	request 객체
	 * @return			map 객체 -> 복호화한 아이디,비밀번호 값이 들어있는
	 */
	public HashMap<String,String> getRSA(HttpServletRequest request) {
		
		HashMap<String,String> map = new HashMap<String, String>();
		
		String securedUsername = request.getParameter("securedUsername");//암호화된 아이디
        String securedPassword = request.getParameter("securedPassword");//암호화된 비밀번호
		
        HttpSession session = request.getSession();
        PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
        session.removeAttribute("__rsaPrivateKey__"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제. and 메모리누수 방지
        
        if (privateKey == null) {
            throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
        }
        try {
            String username = decryptRsa(privateKey, securedUsername);
            String password = decryptRsa(privateKey, securedPassword);
            
            map.put("id", username);
            map.put("pw", password);

        } catch (Exception e) {
            e.printStackTrace();
        }
		
        return map;
	}
	
	/**
	 * 암호화된 문자열을 복호화한다. --> 세션을 없애지 않는다.
	 * @param request	request 객체
	 * @return			map 객체 -> 복호화한 아이디,비밀번호 값이 들어있는
	 */
	public HashMap<String,String> getRSASessionMaintain(HttpServletRequest request) {
		
		HashMap<String,String> map = new HashMap<String, String>();
		
		String securedUsername = request.getParameter("securedUsername");//암호화된 아이디
        String securedPassword = request.getParameter("securedPassword");//암호화된 비밀번호
		
        
        HttpSession session = request.getSession();
        PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
        
        if (privateKey == null) {
            throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
        }
        try {
            String username = decryptRsa(privateKey, securedUsername);
            String password = decryptRsa(privateKey, securedPassword);
            
            map.put("id", username);
            map.put("pw", password);

        } catch (Exception e) {
            e.printStackTrace();
        }
		
        return map;
	}
	
	
	/**
	 * 암호화된 문자열을 복호화한다. - 오직 비밀번호만
	 * @param request	request 객체
	 * @return			복호화된 비밀번호
	 */
	public String getRSAonlyPw(HttpServletRequest request) {
		

        String securedPassword = request.getParameter("securedPassword");//암호화된 비밀번호
		
        HttpSession session = request.getSession();
        PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
        session.removeAttribute("__rsaPrivateKey__"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제. and 메모리누수 방지
        
        if (privateKey == null) {
            throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
        }
        try {
            
            String password = decryptRsa(privateKey, securedPassword);
            
            return password;
        } catch (Exception e) {
            e.printStackTrace();
            
            return null;
        }
	}
	
	
	/**
	 * RSA 복호화 알고리즘
	 * @param privateKey	privateKey
	 * @param securedValue	암호화된 문자열
	 * @return				복호화된 문자열
	 * @throws Exception
	 */
	private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
        
        Cipher cipher = Cipher.getInstance("RSA");
        byte[] encryptedBytes = hexToByteArray(securedValue);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
        return decryptedValue;
    }
	
	
	
	/**
	 * 16진 문자열을 byte 배열로 변환한다.
	 * @param hex	16진 문자열
	 * @return		byte 배열
	 */
    public static byte[] hexToByteArray(String hex) {
        
    	if (hex == null || hex.length() % 2 != 0) {
            return new byte[]{};
        }

        byte[] bytes = new byte[hex.length() / 2];
        
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int) Math.floor(i / 2)] = value;
        }
        
        return bytes;
    }
	
}
