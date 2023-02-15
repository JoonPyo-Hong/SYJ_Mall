package com.common.utill;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	 */
	private Map<String, String> cookieValueToMap(String cookieValue) {

		Map<String, String> map = new HashMap<>();

		String[] parts = cookieValue.split("&");

		for (String part : parts) {

			String[] keyValue = part.split("=");

			if (keyValue.length == 2) {
				map.put(keyValue[0], keyValue[1]);
			}
		}

		return map;
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
	 */
	private List<String> cookieValueToList(String cookieValue) {

		List<String> list = new ArrayList<>();

		String[] parts = cookieValue.split("&");

		for (String part : parts) {
			list.add(part);
		}

		return list;
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
	public Map<String, String> getCookiesMaps(HttpServletRequest request, String cookieName) {

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
	public List<String> getCookiesList(HttpServletRequest request, String cookieName) {

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
	public void modifyMapCookies(HttpServletRequest request, HttpServletResponse response, String cookieName, String keyName, String keyValue) {

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
	public void deleteMapKeyCookies(HttpServletRequest request, HttpServletResponse response, String cookieName, String keyName) {
		
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
	public void addListCookies(HttpServletRequest request, HttpServletResponse response, String cookieName, String value) {

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
	public void removeListCookies(HttpServletRequest request, HttpServletResponse response, String cookieName, String oldValue) {

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
