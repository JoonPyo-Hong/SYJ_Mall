package com.test.SYJ_Mall.jpatest;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

import lombok.Data;

//@Entity
@Data
//@Table(name = "USER_TEST")
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
	
//	@Embedded
//	private Address homeAddress;
	
	
	@ElementCollection
	@CollectionTable(name = "FAVORITE_FOOD", joinColumns = @JoinColumn(name = "user_id"))
	@Column(name = "food_name")
	private Set<String> favoriteFoods = new HashSet<>();
	
	@ElementCollection
	@CollectionTable(name = "ADDRESS", joinColumns = @JoinColumn(name = "user_id"))
	private List<Address> addressHistory = new ArrayList<>();
	
}
