package com.common.utill;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 메일보내주는 클래스
 * @author shin
 *
 */
public class SendEmail {
	
	/** 메일 HOST **/
	private static final String HOST = "smtp.naver.com";
	
	/** 메일 PORT **/
	private static final String PORT = "587";
	/**
	 * 이메일 보내주는 메서드
	 * @param subject	이메일 제목
	 * @param body		이메일 내용
	 * @param sendId	송신 이메일 from 아이디
	 * @param sendEncPw	송신 이메일 from 비밀번호
	 * @param toId		수신 id
	 * @return
	 */
	public int sendMail(String subject,String body,String sendId,String sendEncPw,String toId) {
		
		Encryption enc = new Encryption();
		
		try {
			
			final String id = sendId;
			final String dcyPw = enc.returnDcyVoca(sendEncPw);//비밀번호 노출을 방지하기 위해 enctype으로 넣어줄것.
			
			InternetAddress[] receiverList = new InternetAddress[1];//수신인 몇명인지 정해줄것
			receiverList[0] = new InternetAddress(toId);
			
			// SMTP 발송 Properties 설정
			Properties props = new Properties();
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", SendEmail.HOST);
			props.put("mail.smtp.port", SendEmail.PORT);
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.ssl.trust", SendEmail.HOST);
			props.put("mail.smtp.auth", "true");
			
			// SMTP Session 생성
			Session mailSession = Session.getDefaultInstance(props, new javax.mail.Authenticator(){
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(id, dcyPw);
				}
			});
			
			// Mail 조립
			Message mimeMessage = new MimeMessage(mailSession);
			mimeMessage.setFrom(new InternetAddress(sendId));
			mimeMessage.setRecipients(Message.RecipientType.TO, receiverList);
            		// 메일 제목
			mimeMessage.setSubject(subject);
            		// 메일 본문 (.setText를 사용하면 단순 텍스트 전달 가능)
			mimeMessage.setContent(body, "text/html; charset=UTF-8");
			
			// Mail 발송
			Transport.send(mimeMessage);
			
			return 1;//성공시
			
		} catch(Exception e) {
			//Logger.getLogger(MailUtil.class).error("메일 발송 오류!!");
			e.printStackTrace();
			return -1;//실패시
		}
	}
	
	
}
