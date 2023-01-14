package com.test.SYJ_Mall.jpatest;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import lombok.Data;

@Entity
@Data
@Table(name = "USER_TABLE")
public class Members {
	
	@Id
	private int id;
	
	@Column(name = "username", nullable = false)
	private String name;
	
	private Integer age; // 어노테이션을 안지정 해주면 생각하는대로 타입을 자동으로 지정해준다.
	
	@Enumerated(EnumType.STRING)
	private RoleType roleType;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date createDate;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastModifiedDate;
	
	// 하이버네이트 최신 버전에서는 어노테이션 없어도 자동으로 지원 해준다.
	private LocalDate createDate2;
	
	private LocalDateTime createDate3;
	
	@Lob
	private String description; // 큰 컨텐츠를 넣어주고 싶을 때 !
	
	@Transient
	private int temp; //db 와 맵핑을 안하고 싶을 경우에! 
	
	public Members() {}
	
	public Members(int id, String name) {
		this.id = id;
		this.name = name;
	}
	
}
