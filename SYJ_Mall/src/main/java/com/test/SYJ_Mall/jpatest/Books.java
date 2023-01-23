package com.test.SYJ_Mall.jpatest;

import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;

//@Entity
//@Table(name = "BOOK")
@Data
public class Books extends Item{
	
	private String author;
	private String isbn;
}
