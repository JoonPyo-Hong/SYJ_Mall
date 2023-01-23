package com.test.SYJ_Mall.jpashop;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;

//@Entity
@Data
//@Table(name = "MEMBER")
public class Member extends ShopBaseEntity {
		
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "member_id")
	private Long id;
	
	@Column(name = "member_name")
	private String name;
	
	@Column(name = "member_city")
	private String city;
	
	@Column(name = "member_strret")
	private String street;
	
	@Column(name = "member_zipcode")
	private String zipcode;
	
	@OneToMany(mappedBy = "member")
	private List<Order> orders = new ArrayList<Order>();
	
}
