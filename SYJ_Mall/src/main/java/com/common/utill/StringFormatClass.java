package com.common.utill;

import java.text.DecimalFormat;
import java.util.LinkedList;
import java.util.Queue;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 여러가지의 스트링 포멧 관련 클래스
 * 
 * @author shin
 *
 */
public class StringFormatClass {

	public StringFormatClass() {
		super();
	}
	

	/**
	 * 휴대폰 번호가 그대로 넘어오면 하이푼해줘서 넘겨주는 역할
	 * 
	 * @param phoneNum 유저의 폰 번호
	 * @return 하이푼이 들어간 유저의 폰 번호
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
	 * 
	 * @param userid 유저의 풀 아이디.
	 * @return 부분적으로 마스킹된 유저의 아이디.
	 */
	public String maskigId(String userid) {

		final String NUMEX = "^.*[0-9].*$";
		final String NUMEXONE = "^[0-9]$";
		final int VOCALEN = userid.length();
		StringBuffer sb = new StringBuffer();

		// 유저의 아이디에 숫자가 존재하는 경우 -> 숫자만 마스킹 해준다.
		if (Pattern.matches(NUMEX, userid)) {

			for (int i = 0; i < VOCALEN; i++) {

				String voca = userid.substring(i, i + 1);
				if (Pattern.matches(NUMEXONE, voca)) {
					sb.append("*");
				} else {
					sb.append(voca);
				}
			}

		} else {// 유저의 아이디에 숫자가 존재하지 않은경우 -> 중간 이후의 문자들은 모두 마스킹 처리 해준다.

			for (int i = 0; i < VOCALEN; i++) {
				String voca = userid.substring(i, i + 1);

				if (i > (VOCALEN / 2))
					sb.append("*");
				else
					sb.append(voca);
			}
		}

		return sb.toString();
	}

	/**
	 * 이메일 마스킹 처리
	 * 
	 * @param userMail 이메일 주소
	 * @return 마스킹된 이메일
	 */
	public String maskingMail(String userMail) {

		StringTokenizer stk = new StringTokenizer(userMail, "@");

		String userId = maskigId(stk.nextToken());// 마스킹 해준다.
		String userAddress = stk.nextToken();

		StringBuffer sb = new StringBuffer();
		sb.append(userId);
		sb.append("@");
		sb.append(userAddress);

		return sb.toString();

	}
	
	/**
	 * 해당문자가 숫자로 이루어져있는지 확인해주는 메서드
	 * @param string	문자열
	 * @return			t : 숫자로만 이루어짐, f : 숫자로만 이루어지지 않음
	 */
	public boolean isStringDigit(String string) {

		boolean result = true;

		for (int i = 0; i < string.length(); i++) {
			if (!Character.isDigit(string.charAt(i))) {
				result = false;
				break;
			}
		}

		return result;
	}
	
	/**
	 * 해당문자에서 숫자만 뽑아오는 메서드
	 * @param string	문자열
	 * @return			
	 */
	public String findDigitString(String string) {
		
		StringBuffer sb = new StringBuffer();
		
		for (int i = 0; i < string.length(); i++) {
			if (Character.isDigit(string.charAt(i))) {
				sb.append(string.charAt(i));
			}
		}
		
		return sb.toString();

	}
	
	
	/**
	 * 스트링이 숫자형인 경우 해당 숫자가 특정숫자범위 내에 있는지 판단해주는 메서드
	 * @param string	숫자스트링
	 * @param val1		첫번째 숫자
	 * @param val2		두번쨰 숫자
	 * @return			t : 구간내에 있음, f : 구간내에 없음
	 */
	public boolean stringToDigitTerm(String string,int val1,int val2) {
		int min = Math.min(val1, val2);
		int max = Math.max(val1, val2);
		
		int num = Integer.parseInt(string);
		
		if (num >= min && num <= max) return true;
		else return false;
		
	}
		
	/**
	 * 전체 문자열에서 특정 문자가 들어갔는지 확인해주는 메소드
	 * @param totalString
	 * @param seperator
	 * @param search
	 * @return
	 */
	public boolean findObjectInString(String totalString, String seperator, String search) {
		
		StringTokenizer stk = new StringTokenizer(totalString,seperator);
		
		while(stk.hasMoreTokens()) {
    		if (stk.nextToken().equals(search)) return true;
    	}
		
		return false;
	}
	
	
	/**
	 * StringBuffer class 를 따라한 것으로 각 문자열을 합쳐준다.
	 * @param str1
	 * @param str2
	 * @return
	 */
	public String addString(String str1, String str2) {
		StringBuffer sb = new StringBuffer();
		sb.append(str1);
		sb.append(str2);
		
		return sb.toString();
	}
	
	
	/**
	 * 특정 문자열에서 특정 문자를 이용하여 스플릿 한 결과를 큐에 집어넣어 반환해준다.
	 * @param str
	 * @param split
	 * @return
	 */
	public Queue<String> tokenizerQueue(String str, String split) {
		
		Queue<String> queue = new LinkedList<String>();
		
		StringTokenizer stk = new StringTokenizer(str,split);
		
		while(stk.hasMoreTokens()) {
			queue.offer(stk.nextToken());
		}
		
		return queue;	
	}
	
	
	/**
	 * Queue 에 저장 된 데이터를 특정 문자열로 구분하여 String 으로 반환하는 형식
	 * @param inQueue
	 * @return
	 */
	public String queueToString(Queue<String> inQueue, String split) {
		StringBuffer sb = new StringBuffer();
		
		while(inQueue.size() != 0) {
			sb.append(inQueue.poll());
			sb.append(split);
		}
		
		return sb.toString();
	}
	
	/**
	 * 구분자로 나뉘어진 문자를 큐에 들어간 역순으로 뽑기 
	 * @param inQueue
	 * @param split
	 * @param topN
	 * @return
	 */
	public String topNrecentQueue(Queue<String> inQueue, String split, int topN) {
		StringBuffer sb = new StringBuffer();

		while(!inQueue.isEmpty()) {
			if (inQueue.size() <= topN) {
				sb.append(inQueue.poll());
				sb.append("#");
			} else inQueue.poll();
		}
		
		return sb.toString();
	}
	
	
	/**
	 * 문자를 구분자를 기준으로 나누어 배열로 리턴
	 * @param input
	 * @param split
	 * @return
	 */
	public String[] stringSplitList(String input, String split) {
		
		StringTokenizer stk = new StringTokenizer(input,split);
		
		int arrLength = stk.countTokens();
		String[] objArr = new String[arrLength];
		
		int arrIndex = 0;
		
		while(stk.hasMoreTokens()) {
			objArr[arrIndex] = stk.nextToken();
			arrIndex++;
		}
		
		return objArr;
	}
	
	/**
	 * 화폐단위 컴마 찍어주는 로직
	 * @param money
	 * @return
	 */
	public String moneyDotString(int money) {
		DecimalFormat df = new DecimalFormat("###,###");
		
		return df.format(money);
		
	}
	
	/**
	 * 글자가 한글과 영어로만 이루어졌는지 체크해준다.
	 * @param text
	 * @return
	 */
	public boolean isStringMessage(String text) {
		Pattern pattern = Pattern.compile("^[a-zA-Z가-힣]*$");
		Matcher mc = pattern.matcher(text);
		return mc.find();
	}
	
	/**
	 * 문자열의 길이가 기준보다 긴지 적은지 체크해준다.
	 * @param text
	 * @return
	 */
	public boolean inputStringLength(String text ,int standard) {
		
		int textLen = text.length();
		
		return textLen > standard ? false : true;
	
	}
	
	
}
