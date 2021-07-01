package com.common.utill;

/**
 * 여러가지의 스트링 포멧 적용해줌
 * @author shin
 *
 */
public class StringFormatClass {
	
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
		return "";
	}
	

}
