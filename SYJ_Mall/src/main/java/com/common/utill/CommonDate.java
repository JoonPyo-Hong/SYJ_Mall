package com.common.utill;

import java.util.Calendar;
import java.util.Random;

/**
 * 날짜타입 라이브러리
 * 
 * @author shin
 *
 */
public class CommonDate {

	/**
	 * 월,일이 한자리수일 경우 앞에 0을 붙여줘서 리턴해주는 메소드
	 * 
	 * @param input 월이나,일(한자리수)
	 * @return 두자리수로 변환된 일,월
	 */
	public String dateTypeConvert(String input) {

		if (input.length() == 1) {
			input = "0" + input;
		}

		return input;

	}

	/**
	 * 더미날짜 생성
	 * 
	 * @return 원하는 날짜 : yyyy-mm-dd 타입
	 */
	public String dateCreateDummy() {

		Random rnd = new Random();

		StringBuffer sb = new StringBuffer();

		Calendar c = Calendar.getInstance();

		int year = rnd.nextInt(9) + 2012;
		int month = rnd.nextInt(12);

		c.set(year, month, 1);
		int date = rnd.nextInt(c.getActualMaximum(Calendar.DAY_OF_MONTH)) + 1;

		sb.append(year);
		sb.append("-");
		sb.append(dateTypeConvert(Integer.toString(month + 1)));
		sb.append("-");
		sb.append(dateTypeConvert(Integer.toString(date)));

		return sb.toString();
	}
	
	/**
	 * 현재시간 정보 저장--> 굳이 필요없을거 같은데?
	 * @return
	 */
	public String getPresentTime() {

		Calendar c1 = Calendar.getInstance();

		int years = c1.get(Calendar.YEAR);
		int months = c1.get(Calendar.MONTH) + 1;
		int date = c1.get(Calendar.DATE);

		int hour = c1.get(Calendar.HOUR_OF_DAY);
		int min = c1.get(Calendar.MINUTE);
		int sec = c1.get(Calendar.SECOND);

		StringBuffer sb = new StringBuffer();

		sb.append(years);
		sb.append("-");
		sb.append(months);
		sb.append("-");
		sb.append(date);
		sb.append("-");
		sb.append(hour);
		sb.append("-");
		sb.append(min);
		sb.append("-");
		sb.append(sec);

		return sb.toString();
	}

}
