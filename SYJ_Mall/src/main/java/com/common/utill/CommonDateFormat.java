package com.common.utill;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;

/**
 * Date Type Library
 * @author shin
 *
 */
public class CommonDateFormat {
	
	/**
	 * Current Time Information (UTC)
	 * @return
	 */
	public LocalDateTime getPresentTimeUTC() {
		
		return LocalDateTime.now().plusHours(-9);
		
	}
	
	
	/**
	 * Current Time Information (KOR)
	 * @return
	 */
	public LocalDateTime getPresentTime() {
		
		return LocalDateTime.now();
		
	}
	
	
	/**
	 * Converting LocalDateTime Objects to String Type(yyyy-mm-ddThh:mm:ss.SSSZ) - elastic version
	 * @param date
	 * @return
	 */
	public String formatStringTimeElastic(LocalDateTime date) { 
		
		StringBuffer sb = new StringBuffer();
		
		String timeFormatpre = date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		String timeFormatpost = date.format(DateTimeFormatter.ofPattern("HH:mm:ss.SSS"));
		
		sb.append(timeFormatpre);
		sb.append("T");
		sb.append(timeFormatpost);
		sb.append("Z");
		
		return sb.toString();
	}
	
	
	/**
	 * Converting LocalDateTime Objects to String Type(yyyy-mm-dd hh:mm:ss.SSS)
	 * @param date
	 * @return
	 */
	public String formatStringTime(LocalDateTime date) { 
		
		return date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	}
	
	
	
	/**
	 * Converting LocalDateTime(KOR) Objects to String Type(yyyy-mm-dd hh:mm:ss.SSS)
	 * @return
	 */
	public String formatStringTimeKOR() {
		return formatStringTime(getPresentTime());
	}
	
	
	
	/**
	 * 
	 * @param prefix
	 * @param date
	 * @return
	 */
	public String getDateElasticIndex(String prefix, LocalDateTime date) {
		
		String dateTimeFormat = date.format(DateTimeFormatter.ofPattern("_yyyy_MM_dd"));
		
		StringBuffer sb = new StringBuffer();
		sb.append(prefix);
		sb.append(dateTimeFormat);

		return sb.toString();
	}
	
	
//	public String formatStringTimeElastic(LocalDateTime date) {
//		
//	}
}
