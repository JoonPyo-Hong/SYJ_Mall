package com.test.SYJ_Mall.elasticsearchDw;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Table(name = "ELASTIC_USER")
@Entity
public class SqlUser {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_seq")
	private Long userSeq;
	
	@Column(name = "user_id")
	private String userId;
	
	@Column(name = "user_birthday")
	private LocalDateTime userBirthDay;
	
	@Column(name = "user_gender")
	private String userGender;
	
	
	
}	
