package com.test.SYJ_Mall.jpqltest;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
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

	
//  테스트 용도	
//	@Column(name = "team_id")
//	private int teamId;
	
	@Enumerated(EnumType.STRING)
	private JpqlMemberType type;
	
	@ManyToOne(fetch = FetchType.LAZY)//이걸 조심해야 한다.
	@JoinColumn(name = "team_id")
	private JpqlTeam team;
	
	public void changeTeam(JpqlTeam team) {
		this.team = team;
		team.getMembers().add(this);
	}
	
}
