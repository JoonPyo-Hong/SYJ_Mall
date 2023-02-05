package com.test.SYJ_Mall.jpatest;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;


@Entity
@Table(name = "USER")
@Data
//@TableGenerator(
//		name = "USER_SEQ_GENERATOR",
//		table = "MY_SEQ",
//		pkColumnName = "USER_SEQ", allocationSize = 1)
public class User extends BaseEntity {
	
	
	/*
	 db 에서 자동 증가로 만들어주는 것이다. -> identity
	 AUTO 로 써도 됨. 단지 각 데이터베이스마다 약간 설정이 상이할 수 있다
	 
	 
	 영속성 컨텍스트 정의에 의해서 영속성 컨텍스트가 지정되려면 pk 가 필요한데
	 사실 SQL 구문이 디비로 날아가는 시점은 tx.commit 인데,
	 해당 시점에 날아가게 되면 영속성 컨텍스트에서 pk 값을 알지 못하게 된다 (identity 이므로)
	 그러므로 persist 시점에서 디비에 쿼리를 쏴준다.
	 
	 */
	//@Id
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	//private Long id;
	
	
	//sqeunce 는 mysql 에서 지원 안하는 듯
	//@Id
	//@GeneratedValue(strategy = GenerationType.SEQUENCE)
	//private Long id;
	
	
	// table mapping 전략
	//@Id
	//@GeneratedValue(strategy = GenerationType.TABLE, generator = "USER_SEQ_GENERATOR")
	//private Long id;
	
	
	//private String name;
	
	//private String gubun;
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "member_id")
	private Long id;
	
	@Column(name = "user_name")
	private String userName;
	
	
	//@Column(name = "team_id")
	//private Long teamId;
	
	//객체 참조를 사용하여 연관관계를 만들어보자. -> 연관관계의 주인
	//@ManyToOne(fetch = FetchType.LAZY) // 이렇게 하면 Team 은 프록시로 조회한다는 뜻이된다. => 직접 값을 할당할때만 디비에서 가져온다는 의미가 된다. => 지연로딩
	@ManyToOne(fetch = FetchType.EAGER) // 맨날 User 랑 Team 을 같이 조회해야 한다면 EAGER 옵션을 주면 된다. -> 조인을 통해 값을 가져오게 된다. => 즉시로딩
	@JoinColumn(name="team_id")
	private Team team;
	
	
//	@OneToOne
//	@JoinColumn(name="locker_id")
//	private Locker locker;
	
	
//	@OneToMany(mappedBy = "user")
//	private List<MemberProduct> memberProduct = new ArrayList<>();
	
	
	
	// 이런식으로 만들어두면 직접 양방향 셋팅을 안해도 자동으로 지정이 되서 좋다.
	public void setTeam(Team team) {
		this.team = team;
		//team.getUsers().add(this);
	}
	
}
