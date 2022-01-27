package com.common.utill;

import java.util.Calendar;

/**
 * 날짜관련 함수
 * @author shin
 *
 */
public class BasicCalendar {
	
	
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
