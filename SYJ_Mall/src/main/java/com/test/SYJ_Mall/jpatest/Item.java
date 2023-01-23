package com.test.SYJ_Mall.jpatest;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

import lombok.Data;

//@Entity
@Data
//@Table(name = "ITEMS")
//@Inheritance(strategy = InheritanceType.JOINED) // 조인 전략 -> 조인형태로 만들기 위해 디비 자체를 정규화시켜서 만들어준다.
//@Inheritance(strategy = InheritanceType.SINGLE_TABLE) // 싱글 테이블 전략 하나의 테이블에 상속된 객체정보까지 모두 들어가게 된다.
//@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS) // 구현 클래스마다 테이블 전략
//@DiscriminatorColumn(name="dis_type") // dis_type 이라는 컬럼이 생기게 된다. -> 있는게 좋긴하다. (상속성 관계를컬럼 하나로 더욱더 가시화 하기 위해서 만들어주는 컬럼) // 단일테이블 전략에서는 해당 어노테이션이 없어도 생긴다.
public abstract class Item {
	
	@Id @GeneratedValue//(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String name;
	private int price;
	
}
