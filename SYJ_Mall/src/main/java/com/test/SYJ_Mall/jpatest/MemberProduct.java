package com.test.SYJ_Mall.jpatest;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

//@Entity
//@Table(name = "ORDER")
@Data
public class MemberProduct {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_id")
	private Long id;
	
	@ManyToOne
	@JoinColumn(name = "member_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product product;
	
	@Column(name = "order_amount")
	private int amount;
	
	@Column(name = "order_price")
	private int price;
	
	@Column(name = "order_date")
	private LocalDateTime orderDateTime;
	
}
