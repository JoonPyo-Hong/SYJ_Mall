package com.test.SYJ_Mall.jpatest;

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

//@Entity
@Data
//@Table(name="TEAM")
public class Team {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "team_id")
	private Long id;
	private String name;
	
	
	//양방향 mapping 을 위해서 아래와 같이 List<User> 를 추가해준다.
	@OneToMany(mappedBy = "team") // user 의 team 컬럼을 적어주면 된다.
	private List<User> users = new ArrayList<User>();


	
	
	
	
}
