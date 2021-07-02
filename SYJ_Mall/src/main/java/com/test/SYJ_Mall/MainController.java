package com.test.SYJ_Mall;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.SYJ_Mall.main.MainDTO;
import com.test.SYJ_Mall.main.MainService;


/**
 * 메인 페이지 컨트롤러 역할
 * 
 * @author joonpyo-hong
 *
 */
@Controller
public class MainController {

	@Autowired
	private MainService service;

	// 메인 화면
	@RequestMapping(value = "/main.action", method = { RequestMethod.GET })
	public String main(Model model) {
//		List<MainDTO> list = service.list();

		return "/main/Main";
	}

	// 무한 스크롤
	@RequestMapping(value = "/list.action", method = { RequestMethod.POST })
	@ResponseBody
	public Object list(@RequestParam("num") int num) {
//		System.out.println(num);
		List<MainDTO> list = service.list(num);

		return list;
	}

	// 메인 이미지
	@RequestMapping(value = "/img.action", method = { RequestMethod.POST })
	@ResponseBody
	public Object img(@RequestParam("seq") int seq) {
//		System.out.println(seq);
		List<String> list = service.img(seq);
//		System.out.println(list.toString());
		return list;
	}
	
	// 좋아요 갯수
	@RequestMapping(value = "/heart.action", method = { RequestMethod.POST })
	@ResponseBody
	public Object heart(@RequestParam("num") int num) {
		System.out.println(num);
		Integer count = service.heart(num);

		return count;
	}

}
