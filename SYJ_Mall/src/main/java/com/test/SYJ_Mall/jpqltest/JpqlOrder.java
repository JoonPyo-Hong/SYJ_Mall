package com.test.SYJ_Mall.jpqltest;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name = "JPQL_ORDER")
public class JpqlOrder {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_id")
	private Long id;
	
	private int orderAmount;
	
	@Embedded
	private JpqlAddress address; 
	
	@ManyToOne
	@JoinColumn(name = "product_id")
	private JpqlProduct product;
}
