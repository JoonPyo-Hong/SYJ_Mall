package com.test.SYJ_Mall;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.SYJ_Mall.main.MainDTO;
import com.test.SYJ_Mall.main.MainService;

/**
 * 댓글 페이지 컨트롤러 역할
 * 
 * @author joonpyo-hong
 *
 */
@Controller
public class FeedController {

	@Autowired
	private MainService service;

	// 댓글 화면
	@RequestMapping(value = "/feed.action", method = { RequestMethod.GET })
	public String main(Model model, HttpServletRequest request, Integer seq) {
		
		if (seq == null) {
			seq = 0;
		}
		
		Integer num1 = seq;
		Integer num2 = seq;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("num1", num1);
		map.put("num2", num2);
		List<MainDTO> list1 = service.list(map);
		model.addAttribute("list1", list1);
		
		List<String> list2 = service.img(seq);
		model.addAttribute("list2", list2);
		return "/main/Feed";
	}
}
