package com.common.utill;

/**
 * 날짜타입 라이브러리
 * @author shin
 *
 */
public class CommonDate {
	

	/**
	 * 월,일이 한자리수일 경우 앞에 0을 붙여줘서 리턴해주는 메소드
	 * @param input	월이나,일(한자리수)
	 * @return		두자리수로 변환된 일,월	
	 */
	public String dateTypeConvert(String input) {
		
		if (input.length() == 1) {
			input = "0" + input;
		}
		
		return input;	
		
	}
	
}
