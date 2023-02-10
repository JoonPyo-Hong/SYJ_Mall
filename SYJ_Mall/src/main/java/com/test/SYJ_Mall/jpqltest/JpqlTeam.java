package com.test.SYJ_Mall.jpqltest;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name = "JPQL_TEAM")
public class JpqlTeam {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "team_id")
	private Long id;
	
	@Column(name = "team_name")
	private String name;
	
	@OneToMany(mappedBy = "team")
	private List<JpqlMember> members = new ArrayList<>();
	
}
