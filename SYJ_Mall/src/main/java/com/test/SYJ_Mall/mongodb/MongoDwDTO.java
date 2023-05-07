package com.test.SYJ_Mall.mongodb;

import lombok.Data;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Table(name = "MONGO_ELASTIC")
@Data
public class MongoDwDTO {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "class_id")
	private Long classId;
	
	@Column(name = "brand_no")
	private int brandNo;
	
	@Column(name = "benefit_price")
	private Long benefitPrice;
	
	@Column(name = "link_info")
	private Long linkInfo;
	
	@Column(name = "disp_nm")
	private String dispNm;
	
	public MongoDwDTO() {}
	
	public MongoDwDTO(int brandNo, Long benefitPrice, Long linkInfo, String dispNm) {
		this.brandNo = brandNo;
		this.benefitPrice = benefitPrice;
		this.linkInfo = linkInfo;
		this.dispNm = dispNm;
	}
	
}
