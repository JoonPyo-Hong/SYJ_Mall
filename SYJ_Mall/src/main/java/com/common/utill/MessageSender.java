package com.common.utill;

/**
 * 메세지 보내주는 객체
 * @author shin
 *
 */
public class MessageSender extends Encryption {
	
	private String inputSubject;//제목
	private String inputContents;//내용
	private String[] addressee;//수신인
	
	public MessageSender(String inputSubject,String inputContents,String[] addressee) {
		
		this.inputSubject = inputSubject;
		this.inputContents = inputContents;
		this.addressee = addressee;
		
	}
	
	public int sendMassage() {
		
		try {
			
			
			
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
	
}
