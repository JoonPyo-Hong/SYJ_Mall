package com.test.SYJ_Mall.jpqltest;

import lombok.Data;

@Data
public class JpqlMemberDTO {
	
	private String userName;
	
	private int age;
	
	
	public JpqlMemberDTO(String userName, int age) {
		this.userName = userName;
		this.age = age;
	}
	
}
