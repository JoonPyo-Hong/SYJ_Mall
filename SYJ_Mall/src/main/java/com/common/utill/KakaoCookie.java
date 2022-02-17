package com.common.utill;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 쿠키객체 쉽게다루기 위한 클래스
 * @author shin
 *
 */
public class KakaoCookie {

	/**
	 * 쿠키생성
	 * @param response
	 * @param cookieName	쿠키이름
	 * @param cookieValue	쿠키값
	 */
	public void generateCookie(HttpServletResponse response,String cookieName,String cookieValue) {
		
		Cookie cookie = new Cookie(cookieName,cookieValue);
		cookie.setMaxAge(-1);//브라우저가 종료되면 쿠키를 만료시킨다.
		cookie.setPath("/");//모든 경로에서 해당 쿠키를 접근가능하도록 설정해준다.
		response.addCookie(cookie);
		
	}
	
	/**
	 * 쿠키생성 + 유지시간 설정
	 * @param response
	 * @param cookieName		쿠키이름
	 * @param cookieValue		쿠키값
	 * @param setTimeSecond		쿠키유지시간(초단위)
	 */
	public void generateCookie(HttpServletResponse response,String cookieName,String cookieValue,int setTimeSecond) {
		
		Cookie cookie = new Cookie(cookieName,cookieValue);
		cookie.setMaxAge(setTimeSecond);//지속시간을 정해준다.
		cookie.setPath("/");//모든 경로에서 해당 쿠키를 접근가능하도록 설정해준다.
		response.addCookie(cookie);
		
	}
	
	/**
	 * 쿠키정보 가져오기
	 * @param request		쿠키이름에 해당하는 값 가져오기
	 * @param cookieName	쿠키이름
	 * @return				쿠키이름에 대응하는 쿠키값
	 */
	public Object getCookieInfo(HttpServletRequest request,String cookieName) {
		
		Object object = null;
		
		try {
			Cookie[] cookies = request.getCookies();
			
			for (int i = 0; i < cookies.length; i++) {
				if (cookies != null) {
					if (cookies[i].getName().equals(cookieName)) {
						object = cookies[i].getValue();
						break;
					}
				} 
			}
		} catch(Exception e) {
			//e.printStackTrace();
			return object;
		}

		return object;
	}
	
	/**					
	 * 쿠키이름에 대한 쿠키값 수정
	 * @param request
	 * @param response
	 * @param cookieName	쿠키이름
	 * @param setCookieVal	쿠키값
	 */
	public void modifyCookie(HttpServletRequest request,HttpServletResponse response,String cookieName,String setCookieVal,int setTime) {
		
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null) {
		//쿠키 객체가 존재는 하는경우
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals(cookieName)) {
					cookies[i].setValue(setCookieVal);
					cookies[i].setMaxAge(setTime);
					cookies[i].setPath("/");
					response.addCookie(cookies[i]);
					break;
				}
			}
			//쿠키 객체는 존재하지만 해당이름을 가진 쿠키객체가 존재하지 않는 경우
			generateCookie(response, cookieName, setCookieVal, setTime);

		} else {
		//쿠키 객체 자체가 존재하지 않는 경우	
			generateCookie(response, cookieName, setCookieVal, setTime);
		}
	}


	/**
	 * 쿠키이름에 해당하는 쿠키 삭제
	 * @param request
	 * @param response
	 * @param cookieName	쿠키이름
	 */
	public void deleteCookie(HttpServletRequest request,HttpServletResponse response,String cookieName) {
		
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null) {
			
			for (int i = 0; i < cookies.length; i++) {
				
				if (cookies[i].getName().equals(cookieName)) {
					cookies[i].setValue(null);
					cookies[i].setMaxAge(0);
					cookies[i].setPath("/");
					response.addCookie(cookies[i]);
					break;
				}
			}
		}
	}
	
	/**
	 * 장바구니에 담긴 쿠키객체 수정 관리
	 * @param request
	 * @param response
	 * @param productId	물품 번호
	 * @return
	 */
	public int modifyBasketCookie(HttpServletRequest request, HttpServletResponse response, int productId) {

		KakaoCookie kc = new KakaoCookie();
		String basketList = (String) kc.getCookieInfo(request, "basketList");

		// 이미 장바구니에 담긴 번호인지 체크해준다.--> null check 해줘야한다.
		String[] basketLists;

		if (basketList == null)
			basketLists = new String[0];
		else
			basketLists = basketList.split("#");

		// 장바구니 쿠키 객체에서 해당물품번호가 있는지 찾아준다. 없으면 -1을 리턴할것
		int index = Arrays.asList(basketLists).indexOf(Integer.toString(productId));

		if (index == -1) {
			// 해당물품이 장바구니에 들어있는 표시가 되어있어서 클릭한건데 없다는건 -> 클라이언트측에서 공격시도로 볼 수 있음 -> 방어를 위해
			// return -1 을 반환
			return -1;
		} else {
			StringBuffer sb = new StringBuffer();

			for (int i = 0; i < basketLists.length; i++) {
				// 빼려고하는 상품 번호는 그냥 안넣으면 된다.
				if (!basketLists[i].equals(Integer.toString(productId))) {
					sb.append(basketLists[i]);
					sb.append("#");
				}
			}

			kc.modifyCookie(request, response, "basketList", sb.toString(), 60 * 60 * 24 * 7);
			return 1;
		}

	}
	
	/**
	 * 장바구니에 담긴 쿠키객체들 수정 관리
	 * @param request
	 * @param response
	 * @param productIds 물품 번호 여러개
	 * @return
	 */
	public List<Integer> modifyBasketCookies(HttpServletRequest request, HttpServletResponse response, String productIds) {

		KakaoCookie kc = new KakaoCookie();
		String[] prodtList = productIds.split("#");
		List<Integer> resultProdtList = new ArrayList<Integer>();
		
		for (int i = 0; i < prodtList.length; i++) {
			int prodtId = Integer.parseInt(prodtList[i]);
			
			int result = kc.modifyBasketCookie(request, response, prodtId);
			
			if (result == 1) {
				resultProdtList.add(prodtId);
			}
		}
		
		return resultProdtList;
	}
	
	
	/**
	 * 장바구니에 담긴 최근 본 객체 관리 (개수가 50개가 넘어가면 앞에 있는 숫자부터 지워줘야한다.)
	 * @param request
	 * @param response
	 * @param productId	물품 번호
	 * @return
	 */
	public int modifySeenCookie(HttpServletRequest request, HttpServletResponse response, int productId) {
		
		KakaoCookie kc = new KakaoCookie();
		String seenList = (String) kc.getCookieInfo(request, "seenList");
		
		//이미 내가 본 최근 상품인지 확인해준다.
		String[] seenLists;//최근본 상품 객체 존재
		
		// 장바구니 쿠키 객체에서 해당물품번호가 있는지 찾아준다. 해당 객체 정보가 없으면 -1을 리턴할것
		int index = -2;
		
		//seenList 쿠키 객체가 존재하는 경우 -> 값도 들어있는 경우
		if (seenList != null && seenList.length() != 0) {
			seenLists = seenList.split("#");
			index = Arrays.asList(seenLists).indexOf(Integer.toString(productId));
		} else {
			seenLists = null;
		}
		
		//1. seenList 객체가 존재하지 않거나 불분명한 경우
		if (index == -2) {
			deleteCookie(request, response, "seenList");
			
			StringBuffer sb = new StringBuffer();
			sb.append(productId);
			sb.append("#");
			
			kc.modifyCookie(request, response, "seenList", sb.toString(), 60 * 60 * 24 * 7);
			return 1;
		} 
		//2. seenList 객체가 존재하고 해당 객체를 봐준적이 없는 경우
		else if (index == -1) {
			
			//여기서 객체의 개수가 50개가 넘는지 확인해준다. => 테스트는 5개
			if (seenLists.length >= 50) {
				int firstIndex = seenList.indexOf("#");
				seenList = seenList.substring(firstIndex + 1);
			} 
			
			StringBuffer sb = new StringBuffer();
			sb.append(seenList);
			sb.append(productId);
			sb.append("#");
			kc.modifyCookie(request, response, "seenList", sb.toString(), 60 * 60 * 24 * 7);
			
			return 1;
		} 
		//3. seenList 객체가 존재하지만 이미 해당 객체를 봐준 경우 
		else {
			return -1;
		}
		
		

	}
	
	
	

}
