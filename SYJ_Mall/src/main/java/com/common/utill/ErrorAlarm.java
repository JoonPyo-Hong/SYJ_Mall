package com.common.utill;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

//ErrorAlarm ea

/**
 * 에러알람
 * 
 * @author shin
 *
 */
public class ErrorAlarm {
	
	private Exception e;
	private String ip;
	
	
	public ErrorAlarm() {
		
	}
	
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
		CommonDAO dao = new CommonDAO();
		
		//관리자 주소-> db에서 받아와야함.
		List<String> userEmail = dao.getAdminEmailAddress();
 		
		StringWriter errors = new StringWriter();
		errors.append("ip : ");
		errors.append(this.ip + "\n");
		errors.append("Error contents : \n");
		e.printStackTrace(new PrintWriter(errors));

		MessageSender ms = new MessageSender("Error into SYJ_Mall!", errors.toString(), userEmail);

		int result = ms.sendDefaultMassages();
		
		//System.out.println("result : " + result);
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
	
	/**
	 * 에러요인 메시지로 보내주기 + 에러요인 db에 넣어주기
	 */
	public void errorDbAndMail() {
		sendErrorMassegeAdmin();
		inputErrorToDb();
	}
	
	/**
	 * 에러요인 조합 기본 셋팅 1
	 * @param request
	 * @param e
	 * @return
	 */
	public int basicErrorException(HttpServletRequest request,Exception e) {
		
		IpCheck ic = new IpCheck();
		String ip = ic.getClientIP(request);
		
		this.e = e;
		this.ip = ip;
		errorDbAndMail();
		
		return -1;
	}

}
