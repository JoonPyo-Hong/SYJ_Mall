package com.test.SYJ_Mall.jpatest;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;


//@Entity
//@Table(name = "ALBUM")
@Data
//@DiscriminatorValue("M")
public class Album extends Item {
	private String artist;
}
