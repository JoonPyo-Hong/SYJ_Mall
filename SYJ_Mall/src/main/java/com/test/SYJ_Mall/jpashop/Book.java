package com.test.SYJ_Mall.jpashop;

import javax.persistence.Entity;

import lombok.Data;

//@Entity
@Data
public class Book extends Item {
	
	private String author;
	private String isbn;
	
}
