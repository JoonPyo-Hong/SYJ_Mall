package com.common.utill;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class KakaoCookies {

	/**
	 * Create Web Cookies
	 * 
	 * @param response
	 * @param cookieName
	 * @param cookieValue
	 * @param setTimeSecond
	 */
	public void generateCookie(HttpServletResponse response, String cookieName, String cookieValue, int setTimeSecond) {

		Cookie cookie = new Cookie(cookieName, cookieValue);
		cookie.setMaxAge(setTimeSecond); 	// Specifies the duration of the cookie.
		cookie.setPath("/"); 				// Set the cookie to be accessible from all paths.
		response.addCookie(cookie);

	}
	
	
	/**
	 * Create Web Cookies - Map
	 * 
	 * @param response
	 * @param cookieName
	 * @param cookieMap
	 * @param setTimeSecond
	 */
	public void generateCookie(HttpServletResponse response, String cookieName, Map<String, String> cookieMap, int setTimeSecond) {

		Cookie cookie = new Cookie(cookieName, mapToCookieValue(cookieMap));
		cookie.setMaxAge(setTimeSecond); // Specifies the duration of the cookie.
		cookie.setPath("/"); // Set the cookie to be accessible from all paths.
		response.addCookie(cookie);

	}
	
	
	/**
	 * Create Web Cookies - Map
	 * 
	 * @param response
	 * @param cookieName
	 * @param cookieList
	 * @param setTimeSecond
	 */
	public void generateCookie(HttpServletResponse response, String cookieName, List<String> cookieList, int setTimeSecond) {

		Cookie cookie = new Cookie(cookieName, listToCookieValue(cookieList));
		cookie.setMaxAge(setTimeSecond); // Specifies the duration of the cookie.
		cookie.setPath("/"); // Set the cookie to be accessible from all paths.
		response.addCookie(cookie);

	}

	/**
	 * Convert Map Objects to Cookie Values
	 * 
	 * @param map
	 * @return
	 */
	public String mapToCookieValue(Map<String, String> map) {

		StringBuilder sb = new StringBuilder();

		for (Map.Entry<String, String> entry : map.entrySet()) {
			sb.append(entry.getKey());
			sb.append("=");
			sb.append(entry.getValue());
			sb.append("&");
		}

		sb.deleteCharAt(sb.length() - 1);

		return sb.toString();
	}

	/**
	 * Convert a String object to a Map object
	 * 
	 * @param cookieValue
	 * @return
	 * @throws IOException 
	 */
	private Map<String, String> cookieValueToMap(String cookieValue) throws IOException {

		Map<String, String> cookieMap = new HashMap<String, String>();

		BufferedReader reader = new BufferedReader(new StringReader(cookieValue));

		String line;

		while ((line = reader.readLine()) != null) {
			
		    StringTokenizer tokenizer = new StringTokenizer(line, "&");
		    
		    while (tokenizer.hasMoreTokens()) {
		        
		    	String pair = tokenizer.nextToken();
		        
		    	String[] keyValue = pair.split("=");
		        
		    	cookieMap.put(keyValue[0], keyValue[1]);
		        
		    }
		}
		
		return cookieMap;
	}

	/**
	 * Convert List Objects to Cookie Values
	 * 
	 * @param list
	 * @return
	 */
	public String listToCookieValue(List<String> list) {

		StringBuilder sb = new StringBuilder();

		for (String entry : list) {
			
			sb.append(entry);
			sb.append("&");
			
		}

		sb.deleteCharAt(sb.length() - 1);

		return sb.toString();
	}

	/**
	 * Convert a String object to a List object
	 * 
	 * @param cookieValue
	 * @return
	 * @throws IOException 
	 */
	private List<String> cookieValueToList(String cookieValue) throws IOException {
		
		List<String> cookieList = new ArrayList<String>();
		
		BufferedReader reader = new BufferedReader(new StringReader(cookieValue));
		
		String line;
		
		while ((line = reader.readLine()) != null) {
		    
			StringTokenizer tokenizer = new StringTokenizer(line, "&");
		    
		    while (tokenizer.hasMoreTokens()) {
		    	
		    	String element = tokenizer.nextToken();
		    	
		    	cookieList.add(element);
		    }
		}
		
		return cookieList;
	}

	/**
	 * Returns a cookie object that satisfies a specific name.
	 * 
	 * @param request
	 * @param cookieName
	 * @return
	 */
	public Cookie getCookies(HttpServletRequest request, String cookieName) {

		Cookie[] cookies = request.getCookies();
		Cookie targetCookie = null;

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(cookieName)) {
					targetCookie = cookie;
					break;
				}
			}
		}

		return targetCookie;
	}

	/**
	 * Returns a cookie String object that satisfies a specific name.
	 * 
	 * @param request
	 * @param cookieName
	 * @return
	 */
	public String getCookiesString(HttpServletRequest request, String cookieName) {

		String targetCookie = getCookies(request, cookieName).getValue();

		return targetCookie;

	}

	/**
	 * Returns a cookie Map object that satisfies a specific name.
	 * 
	 * @param request
	 * @param cookieName
	 * @return
	 */
	public Map<String, String> getCookiesMaps(HttpServletRequest request, String cookieName) throws IOException {

		String targetCookie = getCookies(request, cookieName).getValue();

		return cookieValueToMap(targetCookie);

	}

	/**
	 * Returns a cookie List object that satisfies a specific name.
	 * 
	 * @param request
	 * @param cookieName
	 * @return
	 */
	public List<String> getCookiesList(HttpServletRequest request, String cookieName) throws IOException {

		String targetCookie = getCookies(request, cookieName).getValue();

		return cookieValueToList(targetCookie);

	}
	
	
	
	/**
	 * Modify the value to the String of specific cookie
	 * 
	 * @param request
	 * @param response
	 * @param cookieName
	 * @param value
	 */
	public void modifyStringCookies(HttpServletRequest request, HttpServletResponse response, String cookieName, String value) {

		Cookie cookieToModify = getCookies(request, cookieName);

		if (cookieToModify != null) cookieToModify.setValue(value);

	}
	
	

	/**
	 *  Modify the value to the map of specific cookie
	 * 
	 * @param request
	 * @param response
	 * @param cookieName
	 * @param keyName
	 * @param keyValue
	 */
	public void modifyMapCookies(HttpServletRequest request, HttpServletResponse response, String cookieName, String keyName, String keyValue) throws IOException {

		Cookie cookieToModify = getCookies(request, cookieName);

		if (cookieToModify != null) {
			
			Map<String,String> cookieMap = cookieValueToMap(cookieToModify.getValue());
			
			cookieMap.replace(keyName, keyValue);
			
			cookieToModify.setValue(mapToCookieValue(cookieMap));
			
			response.addCookie(cookieToModify);
		}
	}
	
	

	/**
	 * Clear the cookie value corresponding to the key.
	 * 
	 * @param request
	 * @param response
	 * @param cookieName
	 * @param keyName
	 */
	public void deleteMapKeyCookies(HttpServletRequest request, HttpServletResponse response, String cookieName, String keyName) throws IOException {
		
		Cookie cookieToModify = getCookies(request, cookieName);
		
		if (cookieToModify != null) {
			Map<String,String> cookieMap = cookieValueToMap(cookieToModify.getValue());
			
			cookieMap.remove(keyName);
			
			cookieToModify.setValue(mapToCookieValue(cookieMap));
			
			response.addCookie(cookieToModify);
		}
	}
	
	
	

	/**
	 * Add the value to the list of specific cookie
	 * 
	 * @param request
	 * @param response
	 * @param cookieName
	 * @param value
	 */
	public void addListCookies(HttpServletRequest request, HttpServletResponse response, String cookieName, String value) throws IOException {

		Cookie cookieToModify = getCookies(request, cookieName);

		if (cookieToModify != null) {

			List<String> cookieList = cookieValueToList(cookieToModify.getValue());

			cookieList.add(value);

			cookieToModify.setValue(listToCookieValue(cookieList));
			
			response.addCookie(cookieToModify);
			
		}
	}
	
	

	
	/**
	 * Remove the value to the list of specific cookie
	 * 
	 * @param request
	 * @param response
	 * @param cookieName
	 * @param oldValue
	 */
	public void removeListCookies(HttpServletRequest request, HttpServletResponse response, String cookieName, String oldValue) throws IOException {

		Cookie cookieToModify = getCookies(request, cookieName);

		if (cookieToModify != null) {

			List<String> cookieList = cookieValueToList(cookieToModify.getValue());

			for (int i = 0; i < cookieList.size(); i++) {
				if (cookieList.get(i).equals(oldValue)) {
					cookieList.remove(i);
					break;
				}
			}

			cookieToModify.setValue(listToCookieValue(cookieList));
			
			response.addCookie(cookieToModify);
		}
	}
	
	
	/**
	 * Remove the Certain Cookie
	 * 
	 * @param request
	 * @param response
	 * @param cookieName
	 */
	public void deleteCookies(HttpServletRequest request, HttpServletResponse response, String cookieName) {
		
		//Cookie cookieToDelete = getCookies(request, cookieName);
		Cookie cookieToDelete = new Cookie(cookieName,null);
		
		
		cookieToDelete.setMaxAge(0);
		cookieToDelete.setPath("/");
		
		response.addCookie(cookieToDelete);
		
	}
	
	

}
