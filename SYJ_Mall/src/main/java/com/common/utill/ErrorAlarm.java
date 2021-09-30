package com.common.utill;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;

/**
 * 에러알람
 * 
 * @author shin
 *
 */
public class ErrorAlarm {
	
	private Exception e;
	private String ip;

	public ErrorAlarm(Exception e, String ip) {
		this.e = e;
		this.ip = ip;
	}
	
	public ErrorAlarm(Exception e) {
		this.e = e;
		this.ip = "none";
	}
	
	/**
	 * 에러요인 메시지로 보내주기
	 * 
	 * @param userEmail 유저 이메일(복수여도 상관없음)
	 */
	public void sendErrorMassegeAdmin() {
		
		
		String[] userEmail = {"ssh9308@naver.com","yeemi227@naver.com","wnsvy4231@naver.com"};
		
		StringWriter errors = new StringWriter();
		errors.append("ip : ");
		errors.append(this.ip + "\n");
		errors.append("Error contents : \n");
		e.printStackTrace(new PrintWriter(errors));

		MessageSender ms = new MessageSender("Error into SYJ_Mall!", errors.toString(), userEmail);

		int result = ms.sendDefaultMassages();
		
		System.out.println("result : " + result);
	}

	/**
	 * 에러요인 db에 넣어주기
	 */
	public void inputErrorToDb() {
		CommonDAO dao = new CommonDAO();
		
		StringWriter errors = new StringWriter();
		e.printStackTrace(new PrintWriter(errors));
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("errormsg", errors.toString());
		map.put("ip", this.ip);
		
		dao.inputErrorToDb(map);
		dao.close();

	}

}
