package com.test.SYJ_Mall.jpatest;

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
//@Table(name = "PRODUCT")
@Data
public class Product {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_id")
	private Long id;
	
	@Column(name = "product_name")
	private String name;
	
	@OneToMany(mappedBy = "product")
	private List<MemberProduct> memberProduct = new ArrayList<>();
	
}
