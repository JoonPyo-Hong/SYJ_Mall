package com.test.SYJ_Mall.popularItem;

import lombok.Data;

//인기페이지 상품정보 나열할 객체
@Data
public class PopularPagingDTO {
	

	private int paging;
	private int userSeq;
	private String  basketList;
	
	
	public PopularPagingDTO(int paging, int userSeq, String basketList) {
		super();
		this.paging = paging;
		this.userSeq = userSeq;
		this.basketList = basketList;
	}

}
