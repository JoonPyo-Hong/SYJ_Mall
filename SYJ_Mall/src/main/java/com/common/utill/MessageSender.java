package com.common.utill;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 메세지 보내주는 객체
 * @author shin
 *
 */
public class MessageSender {
	
	private String inputSubject;//제목
	private String inputContents;//내용
	private String[] addressee;//수신인
	
	public MessageSender(String inputSubject,String inputContents,String[] addressee) {
		
		this.inputSubject = inputSubject;
		this.inputContents = inputContents;
		this.addressee = addressee;
		
	}
	
	//메일보내기 기본
	public int sendDefaultMassage() {
		
		try {
			
			Encryption enc = new Encryption();
			
			final String USER = "ssh9308@gmail.com"; //gmail 계정
			final String PASSWORD = enc.returnDcyVoca("*x&+$@*P!+#*x&&P?+&P!**P");//gmail 패스워드
			
			// SMTP 서버 정보를 설정한다.
	        Properties prop = new Properties();
	        prop.put("mail.smtp.host", "smtp.gmail.com"); 
	        prop.put("mail.smtp.port", 465); 
	        prop.put("mail.smtp.auth", "true"); 
	        prop.put("mail.smtp.ssl.enable", "true"); 
	        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			
	        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(USER, PASSWORD);
	            }
	        });
			
			
	        MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USER));
	        
            //수신자메일주소
            InternetAddress[] toAddr = new InternetAddress[addressee.length];
            
            for (int i = 0; i < toAddr.length; i++) {
            	toAddr[i] = new InternetAddress(addressee[i]);
            	System.out.println(addressee[i]);
            }
            
            message.setRecipients(Message.RecipientType.TO, toAddr); //수신자 셋팅
            
            // Subject
            message.setSubject(inputSubject); //메일 제목을 입력
            
            // Text
            message.setText(inputContents);//메일 내용을 입력
            
            // 메일 발송
            Transport.send(message);
            
	        return 1;
	        
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
	
}
