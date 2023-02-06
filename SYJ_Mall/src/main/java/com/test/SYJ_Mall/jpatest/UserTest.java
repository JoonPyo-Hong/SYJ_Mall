package com.test.SYJ_Mall.jpatest;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name = "USER_TEST")
public class UserTest {
	
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private Long id;
	
	@Column(name = "user_name")
	private String userName;
	
	
	
	// 기간 -> 아래 두개의 값을 묶어주고 싶다. => Period 객체로 변환
//	@Column(name = "user_start_date")
//	private LocalDateTime startDate;
//	@Column(name = "user_end_date")
//	private LocalDateTime endDate;
	@Embedded
	private Period workPeriod;
	
	
	
	// 주소 -> 아래의 세개의 값을 묶어주고 싶다. => Address 객체로 변환
//	@Column(name = "user_city")
//	private String city;
//	@Column(name = "user_street")
//	private String street;
//	@Column(name = "user_zip_code")
//	private String zipCode;
	@Embedded
	private Address workAddress;
	
}
