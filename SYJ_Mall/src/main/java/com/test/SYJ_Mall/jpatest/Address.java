package com.test.SYJ_Mall.jpatest;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.Data;

@Embeddable
@Data
public class Address {
	

	// 기본생성자는 꼭 필요한 부분이다.
	public Address() {}
	
	public Address(String city,String street,String zipCode) {
		this.city = city;
		this.street = street;
		this.zipCode = zipCode;
	}
	
	
	
	@Column(name = "user_city")
	private String city;
	@Column(name = "user_street")
	private String street;
	@Column(name = "user_zip_code")
	private String zipCode;
	
	
	
	// 아래와 같이 지정을 해줘야 equals 를 하였을 경우에 값을 다 비교해줘서 비교해준다.
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Address other = (Address) obj;
		return Objects.equals(city, other.city) && Objects.equals(street, other.street)
				&& Objects.equals(zipCode, other.zipCode);
	}

	@Override
	public int hashCode() {
		return Objects.hash(city, street, zipCode);
	}
	
	
}
