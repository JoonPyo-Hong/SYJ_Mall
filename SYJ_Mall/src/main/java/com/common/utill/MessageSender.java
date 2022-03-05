package com.common.utill;

import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 메세지 보내주는 객체
 * 
 * @author shin
 *
 */
public class MessageSender {

	private String inputSubject;// 제목
	private String inputContents;// 내용
	//private String[] addressee;// 수신인들
	private List<String> addressee;// 수신인들
	private String addresse;// 수신인
	
	
	public MessageSender() {}
	
	public MessageSender(String inputSubject, String inputContents, List<String> addressee) {

		this.inputSubject = inputSubject;
		this.inputContents = inputContents;
		this.addressee = addressee;

	}

	public MessageSender(String inputSubject, String inputContents, String addresse) {

		this.inputSubject = inputSubject;
		this.inputContents = inputContents;
		this.addresse = addresse;

	}

	//메일보내기-다수에게 보내기
	public int sendDefaultMassages() {

		try {

			Encryption enc = new Encryption();
			
			//이것도 따로  db 처리를 해줘야 한다.
			CommonDAO dao = new CommonDAO();
			MasterDTO dto = dao.getMasterData();
			
			final String USER = dto.getMasterEmail(); // gmail 계정
			final String PASSWORD = enc.returnDcyVoca(dto.getMasterPw(),dto.getMasterKey());

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

			// 수신자메일주소
			InternetAddress[] toAddr = new InternetAddress[addressee.size()];
			
			for (int i = 0; i < toAddr.length; i++) {
				toAddr[i] = new InternetAddress(addressee.get(i));
				//System.out.println(addressee.get(i));
			}

			message.setRecipients(Message.RecipientType.TO, toAddr); // 수신자 셋팅

			// Subject
			message.setSubject(inputSubject); // 메일 제목을 입력

			// Text
			message.setText(inputContents);// 메일 내용을 입력

			// 메일 발송
			Transport.send(message);

			return 1;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

	}

	//메일보내기 - 특정 한사람에게 보내주기
	public int sendDefaultMassage() {

		try {

			Encryption enc = new Encryption();
			
			CommonDAO dao = new CommonDAO();
			MasterDTO dto = dao.getMasterData();
			
			final String USER = dto.getMasterEmail(); // gmail 계정
			final String PASSWORD = enc.returnDcyVoca(dto.getMasterPw(),dto.getMasterKey());

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
			
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(addresse)); // 수신자 셋팅

			// Subject
			message.setSubject(inputSubject); // 메일 제목을 입력

			// Text
			message.setText(inputContents);// 메일 내용을 입력

			// 메일 발송
			Transport.send(message);

			return 1;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

	}

}
