package com.test.SYJ_Mall.charProdt;

import lombok.Data;

/**
 * 캐릭터 페이지 상단 사진 & 이름 객체
 * @author shin
 *
 */
@Data
public class CharHeadTitleDTO {
	private String charName;//캐릭터 이름
	private String charImg;//캐릭터 이미지
	private int charCount;//캐릭터 품목 총 갯수

}
