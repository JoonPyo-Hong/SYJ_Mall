package com.test.SYJ_Mall.jpashop;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name = "DELIVERY")
public class Delivery {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "delivery_id")
	private Long id;
	
	@Enumerated(EnumType.STRING)
	private DeliveryStatus status;
	
	
	@OneToOne(mappedBy = "delivery")
	private Order order;
	
}
