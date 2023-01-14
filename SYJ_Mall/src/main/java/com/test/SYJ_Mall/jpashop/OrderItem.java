package com.test.SYJ_Mall.jpashop;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.Data;

//@Entity
//@Data
public class OrderItem {
	
	
	@Id @GeneratedValue
	@Column(name = "order_item_id")
	private Long id;
	
	@Column(name = "order_id")
	private Long orderId;
	
	@Column(name = "item_id")
	private Long itemId;
}
