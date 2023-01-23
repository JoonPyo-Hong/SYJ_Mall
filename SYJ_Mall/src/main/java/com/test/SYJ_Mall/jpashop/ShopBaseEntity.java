package com.test.SYJ_Mall.jpashop;

import java.time.LocalDateTime;

import javax.persistence.MappedSuperclass;

import lombok.Data;


@Data
@MappedSuperclass
public abstract class ShopBaseEntity {
	private String createBy;
	
	private LocalDateTime createdDate;
	
	private String lastModifiedBy;
	
	private LocalDateTime lastModifiedDate;
}
