package com.test.SYJ_Mall.jpatest;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;

//@Entity
//@Table(name = "MOVIE")
@Data
//@DiscriminatorValue("M") // 부모 객체의 DiscriminatorColumn 컬럼 값에 해당 문자로 값이 들어간다.
public class Movie extends Item {
	
	private String director;
	private String actor;
}
