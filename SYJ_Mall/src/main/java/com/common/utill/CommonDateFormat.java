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
	 * If month and date are single digits, a function that returns by adding a zero to the front.
	 * @param 
	 * @return 
	 */
	public String dateTypeConvert(String input) {

		if (input.length() == 1) input = "0" + input;
		
		return input;

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
	 * Create a prefix rule to specify the index name of the elasticsearch(related log)
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

}
