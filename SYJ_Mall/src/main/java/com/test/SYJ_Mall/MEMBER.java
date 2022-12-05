package com.test.SYJ_Mall;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class MEMBER {
	@Id
	private long id;
	
	private String name;
	
}
