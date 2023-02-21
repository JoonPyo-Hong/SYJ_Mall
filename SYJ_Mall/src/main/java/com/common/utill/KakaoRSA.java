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
import java.util.Map;

import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * RSA Symmetric Key Algorithm - Login Processing
 * 
 * 
 * @author sinseunghwan
 *
 */
public class KakaoRSA {
	
	
	
	/**
	 * RSA decoding algorithm
	 * 
	 * @param privateKey
	 * @param securedValue
	 * @return
	 * @throws Exception
	 */
	private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
        
        Cipher cipher = Cipher.getInstance("RSA");
        byte[] encryptedBytes = hexToByteArray(securedValue);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8");
        return decryptedValue;
    }
	
	
	/**
	 * Converts hexadecimal strings to byte arrays.
	 * 
	 * @param hex
	 * @return
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
	
	
	/**
	 * RSA symmetric key algorithm - gives public and private keys.
	 * 
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

		// A private key corresponding to the public key is stored inside the session.
		session.setAttribute("__rsaPrivateKey__", privateKey);

		// The public key corresponding to the private key is converted into a string and handed over to the JavaScript RSA library.
		RSAPublicKeySpec publicSpec = keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

		String publicKeyModulus = publicSpec.getModulus().toString(16);

		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

		request.setAttribute("publicKeyModulus", publicKeyModulus);

		request.setAttribute("publicKeyExponent", publicKeyExponent);
	}
	

	
	
	/**
	 * Based on the public key, the encrypted member's ID and password are decrypted using the private key.
	 * 
	 * @param request
	 * @return
	 */
	public Map<String,String> getRSAuserInfo(HttpServletRequest request) throws Exception {
		
		Map<String,String> map = new HashMap<String, String>();
		
		String securedUsername = request.getParameter("securedUsername");// Encrypted ID
        String securedPassword = request.getParameter("securedPassword");// Encrypted PW
        
        HttpSession session = request.getSession();
        PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
        session.removeAttribute("__rsaPrivateKey__"); // Prevent re-use of keys. Force you to always receive a new key
        
       
        if (privateKey == null) {
            throw new RuntimeException("Encryption secret key information not found.");
        }
        
        String username = decryptRsa(privateKey, securedUsername);
        String password = decryptRsa(privateKey, securedPassword);
        
        map.put("id", username);
        map.put("pw", password);


        return map;
	}
	
	
	/**
	 * Based on the public key, the encrypted member's ID and password are decrypted using the private key. (maintain session)
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public Map<String,String> getRSAuserInfoSessionMaintain(HttpServletRequest request) throws Exception {
		
		Map<String,String> map = new HashMap<String, String>();
		
		String securedUsername = request.getParameter("securedUsername");// Encrypted ID
        String securedPassword = request.getParameter("securedPassword");// Encrypted PW
        
        if (securedUsername == null || securedPassword == null) return null;
        
        HttpSession session = request.getSession();
        PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
        
       
        if (privateKey == null) {
            throw new RuntimeException("Encryption secret key information not found.");
        }
        
        String username = decryptRsa(privateKey, securedUsername);
        String password = decryptRsa(privateKey, securedPassword);
        
        map.put("id", username);
        map.put("pw", password);


        return map;
	}
	
	
	/**
	 * Decrypts the encrypted string. --> Do not eliminate sessions. 
	 * The decryption proceeds using the transferred RSA secret key.
	 * 
	 * @param secureKey
	 * @param loginSaveUserId
	 * @param loginSaveUserPw
	 * @return
	 * @throws Exception
	 */
	public Map<String,String> getRSAuserSessionMaintainChoice(PrivateKey secureKey,String loginSaveUserId, String loginSaveUserPw) throws Exception {
		

		Map<String,String> map = new HashMap<String, String>();
		
		String username = decryptRsa(secureKey, loginSaveUserId);
        String password = decryptRsa(secureKey, loginSaveUserPw);
        
        map.put("id", username);
        map.put("pw", password);
		
        return map;

	}
	
	
	
}
