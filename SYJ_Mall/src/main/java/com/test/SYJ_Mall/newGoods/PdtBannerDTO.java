package com.test.SYJ_Mall.newGoods;

import lombok.Data;

//신규 기획 배너 객체
@Data
public class PdtBannerDTO {
	
	private String banner_img_title;//배너사진 설명
	private String banner_img_detail;//배너사진 설명 세부
	private String promotion_img;//기획 신규 배너 이미지
	private String promotion_code;//프로모션 코드
	
	
}

