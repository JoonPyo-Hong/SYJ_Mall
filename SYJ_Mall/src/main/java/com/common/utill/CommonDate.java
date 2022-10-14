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
	 * millitime 이 한자리수거나 두자리 수인 경우에 세자리로 맞춰주는 메소
	 * @param input
	 * @return
	 */
	public String dateMilliConvert(String input) {
		if (input.length() == 1) {
			input = "00" + input;
		} else if (input.length() == 2) {
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
	 * 현재시간 정보 저장
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
		sb.append(dateTypeConvert(Integer.toString(months)));
		sb.append("-");
		sb.append(dateTypeConvert(Integer.toString(date)));
		sb.append(" ");
		
		sb.append(dateTypeConvert(Integer.toString(hour)));
		sb.append(":");
		sb.append(dateTypeConvert(Integer.toString(min)));
		sb.append(":");
		sb.append(sec);

		return sb.toString();
	}
	
	/**
	 * 현재시간 정보 저장 (밀리초)
	 * @return
	 */
	public String getPresentTimeMille() {

		Calendar c1 = Calendar.getInstance();

		int years = c1.get(Calendar.YEAR);
		int months = c1.get(Calendar.MONTH) + 1;
		int date = c1.get(Calendar.DATE);

		int hour = c1.get(Calendar.HOUR_OF_DAY);
		int min = c1.get(Calendar.MINUTE);
		int sec = c1.get(Calendar.SECOND);
		int milSec = c1.get(Calendar.MILLISECOND);

		StringBuffer sb = new StringBuffer();

		sb.append(years);
		sb.append("-");
		sb.append(dateTypeConvert(Integer.toString(months)));
		sb.append("-");
		sb.append(dateTypeConvert(Integer.toString(date)));
		sb.append(" ");
		
		sb.append(dateTypeConvert(Integer.toString(hour)));
		sb.append(":");
		sb.append(dateTypeConvert(Integer.toString(min)));
		sb.append(":");
		sb.append(dateTypeConvert(Integer.toString(sec)));
		sb.append(".");
		sb.append(milSec);

		return sb.toString();
	}
	
	/**
	 * 현재시간 정보 저장 (밀리초) - UTC 기준
	 * @return
	 */
	public String getPresentTimeMilleUTC() {

		Calendar c1 = Calendar.getInstance();
		
		c1.add(Calendar.HOUR_OF_DAY, -9);
		
		int years = c1.get(Calendar.YEAR);
		int months = c1.get(Calendar.MONTH) + 1;
		int date = c1.get(Calendar.DATE);

		int hour = c1.get(Calendar.HOUR_OF_DAY);
		int min = c1.get(Calendar.MINUTE);
		int sec = c1.get(Calendar.SECOND);
		int milSec = c1.get(Calendar.MILLISECOND);

		StringBuffer sb = new StringBuffer();

		sb.append(years);
		sb.append("-");
		sb.append(dateTypeConvert(Integer.toString(months)));
		sb.append("-");
		sb.append(dateTypeConvert(Integer.toString(date)));
		sb.append(" ");
		
		sb.append(dateTypeConvert(Integer.toString(hour)));
		sb.append(":");
		sb.append(dateTypeConvert(Integer.toString(min)));
		sb.append(":");
		sb.append(dateTypeConvert(Integer.toString(sec)));
		sb.append(".");
		sb.append(dateMilliConvert(Integer.toString(milSec)));

		return sb.toString();
	}
	
	
	/**
	 * 현재시간 정보 저장 (밀리초) - UTC 기준
	 * @return
	 */
	public Calendar getPresentTimeMilleUTCCal() {

		Calendar c1 = Calendar.getInstance();
		
		c1.add(Calendar.HOUR_OF_DAY, -9);
	
		return c1;
	}
	
	/**
	 * 날짜를 String 타입으로 변환
	 * @param cal
	 * @return
	 */
	public String formatStringTime(Calendar cal) {
		
		int years = cal.get(Calendar.YEAR);
		int months = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);

		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int min = cal.get(Calendar.MINUTE);
		int sec = cal.get(Calendar.SECOND);
		int milSec = cal.get(Calendar.MILLISECOND);
		
		StringBuffer sb = new StringBuffer();

		sb.append(years);
		sb.append("-");
		sb.append(dateTypeConvert(Integer.toString(months)));
		sb.append("-");
		sb.append(dateTypeConvert(Integer.toString(date)));
		sb.append(" ");
		
		sb.append(dateTypeConvert(Integer.toString(hour)));
		sb.append(":");
		sb.append(dateTypeConvert(Integer.toString(min)));
		sb.append(":");
		sb.append(dateTypeConvert(Integer.toString(sec)));
		sb.append(".");
		sb.append(dateMilliConvert(Integer.toString(milSec)));
		
		return sb.toString();

	}
	
	/**
	 * 현재시간 특정시간 전,후 시간 가져오기
	 * @param inSec
	 * @param cal
	 * @return
	 */
	public Calendar getMinusSecMille(Calendar cal, int inSec) {
		
		cal.add(Calendar.SECOND, inSec);
		
		return cal;

	}
	
	/**
	 * elasticsearch index 형태로 현재 시간 데이터 뽑기
	 * @param cal
	 * @return
	 */
	public String getCurrentDateIndex(String prefix, Calendar cal) {
		int years = cal.get(Calendar.YEAR);
		String months = dateTypeConvert(Integer.toString(cal.get(Calendar.MONTH) + 1));
		String date = dateTypeConvert(Integer.toString(cal.get(Calendar.DATE)));
		
		StringBuffer sb = new StringBuffer();
		
		sb.append(prefix);
		sb.append("_");
		sb.append(years);
		sb.append("_");
		sb.append(months);
		sb.append("_");
		sb.append(date);
		
		return sb.toString();
	}
	
	

}
