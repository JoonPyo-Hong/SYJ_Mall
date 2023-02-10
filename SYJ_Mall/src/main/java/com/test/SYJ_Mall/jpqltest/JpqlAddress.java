package com.test.SYJ_Mall.jpqltest;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.Data;

@Embeddable
@Data
public class JpqlAddress {
	
	@Column(name = "user_city")
	private String city;
	
	@Column(name = "user_street")
	private String street;
	
	@Column(name = "user_zip_code")
	private String zipCode;
}
