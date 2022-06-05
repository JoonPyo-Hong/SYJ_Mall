package com.test.SYJ_Mall.login;

import lombok.Data;

/**
 * 회원가입을 위한 데이터 객체
 * @author shin
 *
 */
@Data
public class SignUpDTO {
	
	public SignUpDTO() {
		super();
	}
	
	public SignUpDTO(String qoouser_id, String qoouser_pw, String qoouser_name, String qoouser_gender,
			String qoouser_nation, String qoouser_birthday, String qoouser_phone_num, String qoouser_email,
			String qoouser_receive_email, String qoouser_receive_sms, String qoouser_ipaddress, String qoouser_addr_info) {
		super();
		this.qoouser_id = qoouser_id;
		this.qoouser_pw = qoouser_pw;
		this.qoouser_name = qoouser_name;
		this.qoouser_gender = qoouser_gender;
		this.qoouser_nation = qoouser_nation;
		this.qoouser_birthday = qoouser_birthday;
		this.qoouser_phone_num = qoouser_phone_num;
		this.qoouser_email = qoouser_email;
		this.qoouser_receive_email = qoouser_receive_email;
		this.qoouser_receive_sms = qoouser_receive_sms;
		this.qoouser_ipaddress = qoouser_ipaddress;
		this.qoouser_addr_info = qoouser_addr_info;
	}
	
	private String qoouser_id;
	private String qoouser_pw;
	private String qoouser_name;
	private String qoouser_gender;
	private String qoouser_nation;
	private String qoouser_birthday;
	private String qoouser_phone_num;
	private String qoouser_email;
	private String qoouser_receive_email;
	private String qoouser_receive_sms;
	private String qoouser_ipaddress;
	private String qoouser_addr_info;
}
