package com.test.SYJ_Mall.login;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

/**
 * Data objects for membership registration
 * @author shin
 *
 */
//@Entity
//@Table(name = "QOO10_USER_REAL")
@Data
public class SignUpDTO {
	
	public SignUpDTO() {}
	
	
	public SignUpDTO(String qoouser_id, String qoouser_pw, String qoouser_birthday , String qoouser_email,
					 String qoouser_gender, String qoouser_nation, String qoouser_ipaddress, int qoouser_hascoin,
					 String qoouser_phone_num, int qoouser_grade, String qoouser_receive_email, String qoouser_receive_sms,
					 String qoouser_denide, String qoouser_register_datetime, String qoouser_name, String qoouser_address, String qoouser_address_detail)
	{
		
		this.qoouser_id = qoouser_id;
		this.qoouser_pw = qoouser_pw;
		this.qoouser_birthday = qoouser_birthday;
		this.qoouser_email = qoouser_email;
		this.qoouser_gender = qoouser_gender;
		this.qoouser_nation = qoouser_nation;
		this.qoouser_ipaddress = qoouser_ipaddress;
		this.qoouser_hascoin = qoouser_hascoin;
		this.qoouser_phone_num = qoouser_phone_num;
		this.qoouser_grade = qoouser_grade;
		this.qoouser_receive_email = qoouser_receive_email;
		this.qoouser_receive_sms = qoouser_receive_sms;
		this.qoouser_denide = qoouser_denide;
		this.qoouser_register_datetime = qoouser_register_datetime;
		this.qoouser_name = qoouser_name;
		this.qoouser_address = qoouser_address;
		this.qoouser_address_detail = qoouser_address_detail;
		
	}
	
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "qoouser_seq")
	private Long user_seq;
	
	@Column(name = "qoouser_id")
	private String qoouser_id;
	
	@Column(name = "qoouser_pw")
	private String qoouser_pw;
	
	@Column(name = "qoouser_birthday")
	private String qoouser_birthday;
	
	@Column(name = "qoouser_email")
	private String qoouser_email;
	
	@Column(name = "qoouser_gender")
	private String qoouser_gender;
	
	@Column(name = "qoouser_nation")
	private String qoouser_nation;
	
	@Column(name = "qoouser_ipaddress")
	private String qoouser_ipaddress;
	
	@Column(name = "qoouser_hascoin")
	private int qoouser_hascoin;
	
	@Column(name = "qoouser_phone_num")
	private String qoouser_phone_num;
	
	@Column(name = "qoouser_grade")
	private int qoouser_grade;
	
	@Column(name = "qoouser_receive_email")
	private String qoouser_receive_email;
	
	@Column(name = "qoouser_receive_sms")
	private String qoouser_receive_sms;
	
	@Column(name = "qoouser_denide")
	private String qoouser_denide;
	
	@Column(name = "qoouser_register_datetime")
	private String qoouser_register_datetime;
	
	@Column(name = "qoouser_name")
	private String qoouser_name;
	
	@Column(name = "qoouser_address")
	private String qoouser_address;
	
	@Column(name = "qoouser_address_detail")
	private String qoouser_address_detail;
	
}
