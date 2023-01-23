package com.test.SYJ_Mall.jpashop;

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
//@Table(name = "ORDERITEM")
@Data
public class OrderItem extends ShopBaseEntity {
	
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_item_id")
	private Long id;
	
	//@Column(name = "order_id")
	//private Long orderId;
	
	//@Column(name = "item_id")
	//private Long itemId;
	

	@ManyToOne
	@JoinColumn(name = "order_id")
	private Order order;
	
	@ManyToOne
	@JoinColumn(name = "item_id")
	private Item item;
	
}

