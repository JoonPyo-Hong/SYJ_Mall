package com.test.SYJ_Mall.jpashop;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

//@Entity
@Data
//@Table(name = "ORDERS")
public class Order {
	
	
	@Id @GeneratedValue()
	@Column(name = "order_id")
	private Long id;
	
	@Column(name = "member_id")
	private Long memberId;
	private LocalDateTime orderDate;
	
	@Enumerated(EnumType.STRING)
	private OrderStatus status;
}
