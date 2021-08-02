package com.test.SYJ_Mall;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.SYJ_Mall.login.UserDTO;
import com.test.SYJ_Mall.main.FeedDTO;
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
	public String main(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		UserDTO dto = (UserDTO) session.getAttribute("userinfo");
		request.setAttribute("selected", "today");
		
		int seq = 0;

		if (dto == null) {
			seq = 0;
		} else {
			seq = dto.getUserSeq();
		}
		model.addAttribute("seq", seq);

		return "/tiles/mainStart.topping";
	}

	// 무한 스크롤
	@RequestMapping(value = "/list.action", method = { RequestMethod.POST })
	@ResponseBody
	public Object list(@RequestParam("num") int num) {

		Integer num1 = num - 1;
		Integer num2 = num;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("num1", num1);
		map.put("num2", num2);
		List<MainDTO> list = service.list(map);

		return list;
	}

	// 메인 이미지
	@RequestMapping(value = "/img.action", method = { RequestMethod.POST })
	@ResponseBody
	public Object img(@RequestParam("seq") int seq) {

		List<String> list = service.img(seq);

		return list;
	}

	// 좋아요 갯수
	@RequestMapping(value = "/heart.action", method = { RequestMethod.POST })
	@ResponseBody
	public Object heart(@RequestParam("num") int num) {

		Integer count = service.heart(num);

		return count;
	}

	// 하트 조회
	@RequestMapping(value = "/heart_select.action", method = { RequestMethod.POST })
	@ResponseBody
	public Object heart_select(@RequestParam("list_seq") int list_seq, @RequestParam("session_seq") int session_seq) {

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("list_seq", list_seq);
		map.put("session_seq", session_seq);
		Integer count = service.heart_select(map);

		return count;
	}

	// 좋아요 처리 (Insert, Delete로 처리)
	@RequestMapping(value = "/heart_update.action", method = { RequestMethod.POST })
	@ResponseBody
	public void heart_update(@RequestParam("list_seq") String list_seq, @RequestParam("member_seq") String member_seq,
			@RequestParam("gubn") String gubn) {

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("list_seq", list_seq);
		map.put("member_seq", member_seq);
		map.put("gubn", gubn);

		service.heart_update(map);

	}

	// 댓글 화면
	@RequestMapping(value = "/feed.action", method = { RequestMethod.GET })
	public String main(Model model, HttpServletRequest request, Integer seq) {

		HttpSession session = request.getSession();
		UserDTO dto = (UserDTO) session.getAttribute("userinfo");

		int user_seq = 0;
		String user_name = "";
		if (dto == null) {
			user_seq = 0;
			user_name = "";
		} else {
			user_seq = dto.getUserSeq();
			user_name = dto.getUserName();
		}

		model.addAttribute("seq", user_seq);
		model.addAttribute("name", user_name);

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

		Integer count = service.heart(seq);
		model.addAttribute("count", count);

		return "/main/Feed";
	}

	// 댓글 (Insert)
	@RequestMapping(value = "/feed_insert.action", method = { RequestMethod.POST })
	@ResponseBody
	public void feed_insert(@RequestParam Map<String, Object> map) {

		service.feed_insert(map);
	}

	// 댓글 (select)
	@RequestMapping(value = "/feed_select.action", method = { RequestMethod.POST })
	@ResponseBody
	public List<FeedDTO> feed_select(@RequestParam Map<String, Object> map) {
		List<FeedDTO> list = service.feed_select(map);
		return list;
	}

	// 댓글 좋아요 갯수
	@RequestMapping(value = "/feed_heart.action", method = { RequestMethod.POST })
	@ResponseBody
	public Object feed_heart(@RequestParam("feed_seq") int feed_seq) {

		Integer count = service.feed_heart(feed_seq);

		return count;
	}

	// 댓글 좋아요 업데이트 (Insert, Delete로 처리)
	@RequestMapping(value = "/feed_heart_update.action", method = { RequestMethod.POST })
	@ResponseBody
	public void feed_heart_update(@RequestParam("feed_seq") String feed_seq, @RequestParam("member_seq") String member_seq,@RequestParam("gubn") String gubn) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("feed_seq", feed_seq);
		map.put("member_seq", member_seq);
		map.put("gubn", gubn);
		service.feed_heart_update(map);
		
	}
	
	// 대댓글 (Insert)
	@RequestMapping(value = "/re_feed_insert.action", method = { RequestMethod.POST })
	@ResponseBody
	public void re_feed_insert(@RequestParam Map<String, Object> map) {

		service.re_feed_insert(map);
	}
	// 대댓글 (Select)
	@RequestMapping(value = "/re_feed_select.action", method = { RequestMethod.POST })
	@ResponseBody
	public Object re_feed_select(@RequestParam("feed_seq") String feed_seq) {

		return service.re_feed_select(feed_seq);
	}
}
