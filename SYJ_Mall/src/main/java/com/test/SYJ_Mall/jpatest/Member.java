package com.test.SYJ_Mall.jpatest;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name = "USER")
public class Member {
	
	@Id
	private int id;
	
	@Column(name = "username")
	private String name;
	
	public Member() {}
	
	public Member(int id, String name) {
		this.id = id;
		this.name = name;
	}
	
}
