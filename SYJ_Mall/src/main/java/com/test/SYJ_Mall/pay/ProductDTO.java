package com.test.SYJ_Mall.pay;

import lombok.Data;

//select a.product_id,a.product_nm,a.product_price,b.product_img from KAKAO_PRODUCT_TABLE a left join  KAKAO_PRODUCT_IMG b on a.product_id =b.product_id where a.product_id =1 and rep_img_yn = 'Y';
@Data
public class ProductDTO {
	private String product_id;
	private String product_nm;
	private String product_price;
	private String product_img;
}
