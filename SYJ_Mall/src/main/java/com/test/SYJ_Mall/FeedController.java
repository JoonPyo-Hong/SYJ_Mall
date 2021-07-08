package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 댓글 페이지 컨트롤러 역할
 * 
 * @author joonpyo-hong
 *
 */
@Controller
public class FeedController {
	// 댓글 화면
	@RequestMapping(value = "/feed.action", method = { RequestMethod.GET })
	public String main(Model model, HttpServletRequest request, String seq) {
		if(seq == null) {
			seq = "0";
		}
		System.out.println(seq);
		return "/main/Feed";
	}
}
