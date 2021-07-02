package com.common.utill;

import java.util.regex.Pattern;

/**
 * 여러가지의 스트링 포멧 적용해줌
 * @author shin
 *
 */
public class StringFormatClass {
	
	
	public StringFormatClass() {
		super();
	}
	
	
	/**
	 * 휴대폰 번호가 그대로 넘어오면 하이푼해줘서 넘겨주는 역할
	 * @param phoneNum	유저의 폰 번호
	 * @return			하이푼이 들어간 유저의 폰 번호
	 */
	public String getPhoneNumHypoon(String phoneNum) {
		
		StringBuffer sb = new StringBuffer();
		sb.append(phoneNum.substring(0, 3));
		sb.append("-");
		sb.append(phoneNum.substring(3, 7));
		sb.append("-");
		sb.append(phoneNum.substring(7, 11));
		
		return sb.toString();
	}
	
	/**
	 * 유저의 아이디를 전부 보여주는것이 특정 정보는 마스킹 시켜준다.
	 * @param userid	유저의 풀 아이디.
	 * @return			부분적으로 마스킹된 유저의 아이디.
	 */
	public String maskigId(String userid) {
		
		final String NUMEX = "^.*[0-9].*$";
		final String NUMEXONE = "^[0-9]$";
		final int VOCALEN = userid.length(); 
		StringBuffer sb = new StringBuffer();
		
		//유저의 아이디에 숫자가 존재하는 경우 -> 숫자만 마스킹 해준다.
		if (Pattern.matches(NUMEX, userid)) {
			
			for (int i = 0; i < VOCALEN; i++) {
				
				String voca = userid.substring(i,i+1);
				if (Pattern.matches(NUMEXONE, voca)) {
					sb.append("*");
				} else {
					sb.append(voca);
				}
			}
			
		} else {//유저의 아이디에 숫자가 존재하지 않은경우 -> 중간 이후의 문자들은 모두 마스킹 처리 해준다.
			
			for (int i = 0; i < VOCALEN; i++) {
				String voca = userid.substring(i,i+1);
				
				if (i > (VOCALEN / 2)) sb.append("*");
				else sb.append(voca);	
			}
		}
		
		return sb.toString();
	}
	

}
