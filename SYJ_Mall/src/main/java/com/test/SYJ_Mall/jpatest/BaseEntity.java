package com.test.SYJ_Mall.jpatest;

import java.time.LocalDateTime;

import javax.persistence.MappedSuperclass;

import lombok.Data;


@Data
@MappedSuperclass // 매핑정보만 받는수퍼클래스 -> 해당 객체를 extends 하는 객체와 대응되는테이블에 아래의 컬럼이 자동적으로 들어가게 된다.
public abstract class BaseEntity {
	
	private String createBy;
	
	private LocalDateTime createdDate;
	
	private String lastModifiedBy;
	
	private LocalDateTime lastModifiedDate;
}
