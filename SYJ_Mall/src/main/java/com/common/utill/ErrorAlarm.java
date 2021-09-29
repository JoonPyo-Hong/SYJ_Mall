package com.common.utill;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 에러알람
 * @author shin
 *
 */
public class ErrorAlarm {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private Exception e;
	private String ip;
	
	public ErrorAlarm(Exception e, String ip) {
		this.e = e;
		this.ip = ip;
	}
	
	/**
	 * 에러요인 메시지로 보내주기
	 * @param userEmail
	 * @return
	 */
	public int sendErrorMassege(String[] userEmail) {
		
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
            InternetAddress[] toAddr = new InternetAddress[userEmail.length];
            
            for (int i = 0; i < toAddr.length; i++) {
            	toAddr[i] = new InternetAddress(userEmail[i]);
            }
            message.setRecipients(Message.RecipientType.TO, toAddr); //수신자 셋팅

            // Subject
            message.setSubject("Error into SYJ_Mall!"); //메일 제목을 입력
            
            StringWriter errors = new StringWriter();
            errors.append("ip : ");
            errors.append(this.ip);
            errors.append("Error contents : \n");
            e.printStackTrace(new PrintWriter(errors));
            
            // Text
            message.setText(errors.toString());//메일 내용을 입력
	        
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
	
	/**
	 * 에러요인 db에 넣어주기
	 * @return 1: 성공, -1: 실패
	 */
	public int inputErrorToDb() {
		
		try {
			
			StringWriter errors = new StringWriter();
			e.printStackTrace(new PrintWriter(errors));
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("errormsg", errors.toString());
			map.put("ip", this.ip);
			
			template.insert("COMMONSP.errorMsgInput",map);
			
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}

	}
	
}
