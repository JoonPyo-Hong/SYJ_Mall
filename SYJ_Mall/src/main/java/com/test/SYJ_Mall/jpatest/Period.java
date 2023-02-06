package com.test.SYJ_Mall.jpatest;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.Data;


@Embeddable
@Data
public class Period {
	
	// 기본생성자는 꼭 필요한 부분이다.
	public Period() {}
	
	public Period(LocalDateTime startDate, LocalDateTime endDate) {
		this.startDate = startDate;
		this.endDate = endDate;
	}
	
	
	@Column(name = "user_start_date")
	private LocalDateTime startDate;
	
	@Column(name = "user_end_date")
	private LocalDateTime endDate;
	
}
