package com.common.utill;

import java.util.Calendar;
import java.util.Random;

/**
 * Date Type Library(deprecate)
 * 
 * @author shin
 *
 */
public class CommonDate {

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
	 * A method that sets the millitime to three digits when it is collected in one place or in two digits.
	 * @param input
	 * @return
	 */
	public String dateMilliConvert(String input) {
		if (input.length() == 1) input = "00" + input;
		else if (input.length() == 2) input = "0" + input;
		
		return input;
	}

	/**
	 * Create Dummy Date (deprecate)
	 * @return yyyy-mm-dd type
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
	 * Converting Calendar Objects to String Type(yyyy-mm-dd hh:mm:ss.ms) - elastic version
	 * @param cal
	 * @return
	 */
	public String formatStringTimeElastic(Calendar cal) {
		
		int years = cal.get(Calendar.YEAR);
		int months = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);

		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int min = cal.get(Calendar.MINUTE);
		int sec = cal.get(Calendar.SECOND);
		int milSec = cal.get(Calendar.MILLISECOND);
		
		System.out.println("date : " + date);
		
		StringBuffer sb = new StringBuffer();

		sb.append(years);
		sb.append("-");
		sb.append(dateTypeConvert(Integer.toString(months)));
		sb.append("-");
		sb.append(dateTypeConvert(Integer.toString(date)));
		sb.append("T");
		
		sb.append(dateTypeConvert(Integer.toString(hour)));
		sb.append(":");
		sb.append(dateTypeConvert(Integer.toString(min)));
		sb.append(":");
		sb.append(dateTypeConvert(Integer.toString(sec)));
		sb.append(".");
		sb.append(dateMilliConvert(Integer.toString(milSec)));
		sb.append("Z");
		
		
		return sb.toString();

	}
	
	
	/**
	 * Converting Calendar Objects to String Type(yyyy-mm-dd hh:mm:ss.ms)
	 * @param cal
	 * @return
	 */
	public String formatStringTimeMs(Calendar cal) {
		
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
	 * Converting Calendar Objects to String Type(yyyy-mm-dd hh:mm:ss)
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
		
		StringBuffer sb = new StringBuffer();

		sb.append(years);
		sb.append("-");
		sb.append(dateTypeConvert(Integer.toString(months)));
		sb.append("-");
		sb.append(dateTypeConvert(Integer.toString(date)));
		
		sb.append(dateTypeConvert(Integer.toString(hour)));
		sb.append(":");
		sb.append(dateTypeConvert(Integer.toString(min)));
		sb.append(":");
		sb.append(dateTypeConvert(Integer.toString(sec)));

		return sb.toString();
	}
	
	
	
	/**
	 * Save Current Time Information - String Format (KOR)
	 * @return
	 */
	public String getPresentTime() {
		
		Calendar cal = getPresentTimeKORCal();
		
		return formatStringTime(cal);
	}
	
	/**
	 * Save Current Time Information - String Format (KOR millisecond)
	 * @return
	 */
	public String getPresentTimeMille() {

		Calendar cal = getPresentTimeKORCal();
		
		return formatStringTimeMs(cal);
	}
	
	/**
	 * Save Current Time Information - String Format (UTC millisecond)
	 * @return
	 */
	public String getPresentTimeMilleUTC() {
		
		Calendar cal = getPresentTimeUTCCal();
		
		return formatStringTimeMs(cal);
		
	}
	
	/**
	 * Save Current Time Information - String Format (UTC millisecond)
	 * @return
	 */
	public String getPresentTimeMilleUTCElastic() {
		
		Calendar cal = getPresentTimeUTCCal();
		
		return formatStringTimeElastic(cal);
		
	}
	
	
	/**
	 * Save Current Time Information - Korean Time
	 * @return
	 */
	public Calendar getPresentTimeKORCal() {

		Calendar c1 = Calendar.getInstance();
		
		return c1;
	}
	
	
	/**
	 * Save Current Time Information - UTC Time
	 * @return
	 */
	public Calendar getPresentTimeUTCCal() {

		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.HOUR_OF_DAY, -9);
	
		return cal;
	}
	
	/**
	 * UTC -> KOR
	 * @return
	 */
	public Calendar getTimeUtcToKor(Calendar cal) {
		
		Calendar newC = cal.getInstance();
		
		newC.add(Calendar.HOUR_OF_DAY, 9);
	
		return newC;
	}
	
	
	/**
	 * KOR -> UTC
	 * @return
	 */
	public Calendar getTimeKorToUtc(Calendar c) {
		
		c.add(Calendar.HOUR_OF_DAY, -9);
	
		return c;
	}
	
	
	/**
	 * Get a specific time before and after this time
	 * @param inSec
	 * @param cal
	 * @return
	 */
	public Calendar getMinusSecMille(Calendar cal, int inSec) {
		
		Calendar newCal = Calendar.getInstance();
		
		newCal.add(Calendar.SECOND, inSec);
		
		return newCal;

	}
	
	/**
	 * Extract current time data in the form of - Elastic Search index type
	 * @param cal
	 * @return
	 */
	public String getCurrentDateIndex(String prefix, Calendar cal) {
		
		int years = cal.get(Calendar.YEAR);
		String months = dateTypeConvert(Integer.toString(cal.get(Calendar.MONTH) + 1));
		String date = dateTypeConvert(Integer.toString(cal.get(Calendar.DATE)));
		
		System.out.println(years);
		System.out.println(months);
		System.out.println(date);
		
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
	
	
	
	/**
	 * Extracting current time data in the form of elasticsearch index (based on utc) - deprecate
	 * @param cal
	 * @return
	 */
	public String getCurrentDateIndexUTC(String prefix, Calendar cal) {
		
		cal.add(Calendar.HOUR_OF_DAY, -9);
		
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
