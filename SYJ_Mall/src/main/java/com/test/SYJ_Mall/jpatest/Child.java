package com.test.SYJ_Mall.jpatest;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "CHILD")
@Data
public class Child {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "child_id")
	private Long id;
	
	private String name;
	
	
	@ManyToOne
	@JoinColumn(name = "parent_id")
	private Parent parent;
	
}
