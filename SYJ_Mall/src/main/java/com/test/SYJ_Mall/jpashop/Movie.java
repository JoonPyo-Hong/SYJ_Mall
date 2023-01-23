package com.test.SYJ_Mall.jpashop;

import javax.persistence.Entity;

import lombok.Data;

//@Entity
@Data
public class Movie extends Item {
	
	private String director;
	private String actor;
	
}
