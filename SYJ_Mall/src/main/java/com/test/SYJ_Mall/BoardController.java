package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 게시판 컨트롤러 역할 
 * @author joonpyo-hong 
 *
 */
@Controller
public class BoardController {
	/*---------------------------------------------------공지사항 페이지------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	
	// 공지사항 리스트 형식 출력
	@RequestMapping(value = "/notice_list.action", method = { RequestMethod.GET })
	public String login(HttpServletRequest request, HttpServletResponse response) {

	

		return "/Board/NoticeList";
	}
}
