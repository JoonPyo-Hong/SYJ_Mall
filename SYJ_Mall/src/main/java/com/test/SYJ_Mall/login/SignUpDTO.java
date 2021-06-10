package com.test.SYJ_Mall.login;

import lombok.Data;

/**
 * 회원가입을 위한 데이터 객체
 * @author shin
 *
 */
@Data
public class SignUpDTO {
	
	private String qoouser_id;//
	private String qoouser_pw;//
	private String qoouser_name;//
	private String qoouser_gender;//
	private String qoouser_nation;//
	private String qoouser_birthday;//
	private String qoouser_phone_num;//
	private String qoouser_email;//
	private String qoouser_receive_email;//
	private String qoouser_receive_sms;//
	private String qoouser_ipaddress;//
}
