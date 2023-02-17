package com.test.SYJ_Mall.kakaoLogin;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

/**
 * 
 * 
 * @author sinseunghwan
 *
 */
@Entity
@Data
@Table(name = "QOO10_USER_REAL")
public class KakaoUserDTO {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "qoouser_seq")
	private long userSeq;
	
	@Column(name = "qoouser_id")
	private String userId;
	
	@Column(name = "qoouser_birthday")
	private String userBd;
	
	@Column(name = "qoouser_email")
	private String userEmail;
	
	@Column(name = "qoouser_gender")
	private String userGender;
	
	@Column(name = "qoouser_nation")
	private String userNation;
	
	@Column(name = "qoouser_ipaddress")
	private String userIpAddress;
	
	@Column(name = "qoouser_hascoin")
	private String userHasCoin;

	@Column(name = "qoouser_phone_num")
	private String userPhoneNum;
	
	@Column(name = "qoouser_grade")
	private String userGrade;
	
	@Column(name = "qoouser_receive_email")
	private char userReceiceEmail;
	
	@Column(name = "qoouser_receive_sms")
	private char userReceiceSms;
	
	@Column(name = "qoouser_denide")
	private char userDeny;
	
	@Column(name = "qoouser_register_datetime")
	private LocalDateTime userRegisterDate;
	
	@Column(name = "qoouser_lastlogin_datetime")
	private LocalDateTime userLastLoginDate;
	
	@Column(name = "qoouser_lastlogin_ipaddress")
	private String userLastLoginIp;
	
	@Column(name = "qoouser_name")
	private String userName;
	
	@Column(name = "qoouser_instance_pw_grant")
	private char userPwGrant;
	
	@Column(name = "qoouser_instance_pw_time")
	private char userPwTime;

	@Column(name = "qoouser_id_pw_secure_key")
	private char userPrivateSecureKey;
	
	@Column(name = "qoouser_address")
	private String userAddr;
	
	@Column(name = "qoouser_address_detail")
	private String userAddrDetail;
	
	
	
}
