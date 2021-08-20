package com.test.SYJ_Mall.popularItem;

import lombok.Data;

//인기페이지 상품정보 나열할 객체
@Data
public class PopularPagingDTO {
	
	private String startDt;
	private String endDt;
	private int paging;
	
	public PopularPagingDTO(String startDt, String endDt, int paging) {
		super();
		this.startDt = startDt;
		this.endDt = endDt;
		this.paging = paging;
	}
	
	
	
	
}
