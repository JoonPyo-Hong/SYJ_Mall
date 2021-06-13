package com.common.utill;

import java.util.Date;

import lombok.Data;
/**
 * 광고객체
 * @author shin
 *
 */
@Data
public class AdverDTO {
	
	private int adSeq;//광고 번호
	private String adName;//광고이름
	private String adpPcUrl;//광고사진경로
	private String adUrl;//광고 url
	private int adPriceMonthly;//광고가 한달에 지불하는 비용
	
}