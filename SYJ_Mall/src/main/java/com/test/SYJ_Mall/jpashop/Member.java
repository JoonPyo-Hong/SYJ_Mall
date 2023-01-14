package com.test.SYJ_Mall.jpashop;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

//@Entity
//@Data
public class Member {
	
	
	@Id @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "member_id")
	private Long id;
	
	private String name;
	private String city;
	private String street;
	private String zipcode;
}
