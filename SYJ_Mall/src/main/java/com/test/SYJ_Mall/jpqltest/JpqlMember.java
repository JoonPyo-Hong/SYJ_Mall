package com.test.SYJ_Mall.jpqltest;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name = "JPQL_MEMBER")
public class JpqlMember {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "member_id")
	private Long id;
	
	@Column(name = "member_name")
	private String userName;
	
	@Column(name = "member_age")
	private int age;
	
	@ManyToOne
	@JoinColumn(name = "team_id")
	private JpqlTeam team;
	
}
