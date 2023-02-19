package com.test.SYJ_Mall.kakaoLogin;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

/**
 * Admin Related Objects
 * 
 * 
 * @author sinseunghwan
 *
 */
@Entity
@Data
@Table(name = "ADMIN_INFO_TABLE")
public class KakaoAdminDTO {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "admin_seq")
	private long adminSeq;
	
	@Column(name = "admin_name")
	private String adminName;
	
	@Column(name = "admin_level")
	private int adminLevel;
	
	@Column(name = "admin_email")
	private String adminEmail;
	
	@Column(name = "captcha_secure_key")
	private String capchaSecureKey;
	
	@Column(name = "captcha_site_key")
	private String capchaSiteKey;
	
}
