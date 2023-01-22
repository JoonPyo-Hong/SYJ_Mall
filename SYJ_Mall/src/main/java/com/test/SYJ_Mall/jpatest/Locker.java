package com.test.SYJ_Mall.jpatest;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;

//@Entity
//@Table(name = "LOCKER")
@Data
public class Locker {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "locker_id")
	private Long id;
	
	
	@Column(name = "locker_name")
	private String name;
	
	
	@OneToOne(mappedBy = "locker")
	private User user;
	
}
