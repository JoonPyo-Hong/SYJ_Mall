package com.test.SYJ_Mall.board;
import lombok.Data;

/**
 * 게시판 리스트 형식 출력
 * @author joonpyo-hong
 *
 */
@Data
public class BoardDTO {
	private int seq;
	private String title;
	private String content;
	private String reg_id;
	private String reg_dt;
	
	
}
