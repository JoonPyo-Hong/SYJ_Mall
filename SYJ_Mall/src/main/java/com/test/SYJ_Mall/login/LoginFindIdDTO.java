package com.test.SYJ_Mall.login;

import lombok.Data;

@Data
public class LoginFindIdDTO {
	private String userId;
	private String phone;
	
	public LoginFindIdDTO() {}
	
	public LoginFindIdDTO(String userId,String phone) {
		this.userId = userId;
		this.phone = phone;
	}
	
}
