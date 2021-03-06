package com.test.SYJ_Mall;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.utill.KakaoCookie;
import com.test.SYJ_Mall.login.UserDTO;
import com.test.SYJ_Mall.main.FeedDTO;
import com.test.SYJ_Mall.main.MainDTO;
import com.test.SYJ_Mall.main.MainService;
import com.test.SYJ_Mall.main.NewMainDTO;
import com.test.SYJ_Mall.main.SubDTO;

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
	@RequestMapping(value = "/main.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String main(Model model, HttpServletRequest request, HttpServletResponse response, KakaoCookie kc) {

		HttpSession session = request.getSession();
		UserDTO dto = (UserDTO) session.getAttribute("userinfo");
		request.setAttribute("selected", "today");

		kc.deleteCookie(request, response, "lastPage");// 기존에 있는 마지막 페이지를 지워준다.
		// kc.generateCookie(response, "lastPage", "main");//마지막페이지
		
		int seq = 1;

		if (dto == null) {
			seq = 1;
		} else {
			seq = dto.getUserSeq();
		}
		model.addAttribute("seq", seq);
		model.addAttribute("seleted", "today");
		//System.out.println(seq);
		return "/tiles/mainStart.layout";
	}

	// new 댓글 화면
	@RequestMapping(value = "/feed.action", method = { RequestMethod.GET })
	public String feed(Model model, HttpServletRequest request) {
		
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
		 String l_seq = request.getParameter("seq");

		 
		model.addAttribute("seq", user_seq);
		model.addAttribute("name", user_name);
		model.addAttribute("l_seq", l_seq);
		if (l_seq == null) {
			l_seq = "0";
		}
		System.out.println(l_seq);
		/*
		 * Integer num1 = seq; Integer num2 = seq; HashMap<String, Integer> map = new
		 * HashMap<String, Integer>(); map.put("num1", num1); map.put("num2", num2);
		 * List<MainDTO> list1 = service.list(map); model.addAttribute("list1", list1);
		 * 
		 * List<String> list2 = service.img(seq); model.addAttribute("list2", list2);
		 * 
		 * Integer count = service.heart(seq); model.addAttribute("count", count);
		 */

		return "/tiles/feedStart.layout";
	}

	// 무한 스크롤2
	@RequestMapping(value = "/new_list.action", method = { RequestMethod.POST })
	@ResponseBody
	public Object new_list(@RequestParam("num") int num) {

		Integer num1 = num - 1;
		Integer num2 = num;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("num1", num1);
		map.put("num2", num2);
		List<NewMainDTO> list = service.new_list(map);
		// System.out.println(list.get(0).toString());
		return list;
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

	// new 메인 이미지
	@RequestMapping(value = "/new_main_img.action", method = { RequestMethod.POST })
	@ResponseBody
	public Object new_main_img(@RequestParam("seq") int seq) {

		List<String> list = service.new_main_img(seq);

		return list;
	}

	// char_img
	@RequestMapping(value = "/char_img.action", method = { RequestMethod.POST })
	@ResponseBody
	public Object char_img(@RequestParam("name") String name) {

		List<String> list = service.char_img(name);

		return list;
	}

	// new_main_sub
	@RequestMapping(value = "/new_main_sub.action", method = { RequestMethod.POST })
	@ResponseBody
	public Object new_main_sub(@RequestParam("seq") int seq) {

		List<Integer> list = service.new_main_sub(seq);

		return list;
	}

	// new_main_sub_img
	@RequestMapping(value = "/new_main_sub_img.action", method = { RequestMethod.POST })
	@ResponseBody
	public Object new_main_sub_img(@RequestParam("seq") int seq) {

		List<SubDTO> list = service.new_main_sub_img(seq);

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

	// new 좋아요 갯수
	@RequestMapping(value = "/heart_count.action", method = { RequestMethod.POST })
	@ResponseBody
	public Object heart_count(@RequestParam("num") int num) {

		Integer count = service.heart_count(num);

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

	// new 하트 조회
	@RequestMapping(value = "/new_heart_select.action", method = { RequestMethod.POST })
	@ResponseBody
	public Object new_heart_select(@RequestParam("list_seq") int list_seq,
			@RequestParam("session_seq") int session_seq) {

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("list_seq", list_seq);
		map.put("session_seq", session_seq);
		Integer count = service.new_heart_select(map);

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

	// new 좋아요 처리 (Insert, Delete로 처리)
	@RequestMapping(value = "/new_heart_update.action", method = { RequestMethod.POST })
	@ResponseBody
	public void new_heart_update(@RequestParam("list_seq") String list_seq,
			@RequestParam("member_seq") String member_seq, @RequestParam("gubn") String gubn) {

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("list_seq", list_seq);
		map.put("member_seq", member_seq);
		map.put("gubn", gubn);

		service.new_heart_update(map);

	}
	/*
	 * // 댓글 화면
	 * 
	 * @RequestMapping(value = "/feed.action", method = { RequestMethod.GET })
	 * public String main(Model model, HttpServletRequest request, Integer seq) {
	 * 
	 * HttpSession session = request.getSession(); UserDTO dto = (UserDTO)
	 * session.getAttribute("userinfo");
	 * 
	 * int user_seq = 0; String user_name = ""; if (dto == null) { user_seq = 0;
	 * user_name = ""; } else { user_seq = dto.getUserSeq(); user_name =
	 * dto.getUserName(); }
	 * 
	 * model.addAttribute("seq", user_seq); model.addAttribute("name", user_name);
	 * 
	 * if (seq == null) { seq = 0; }
	 * 
	 * Integer num1 = seq; Integer num2 = seq; HashMap<String, Integer> map = new
	 * HashMap<String, Integer>(); map.put("num1", num1); map.put("num2", num2);
	 * List<MainDTO> list1 = service.list(map); model.addAttribute("list1", list1);
	 * 
	 * List<String> list2 = service.img(seq); model.addAttribute("list2", list2);
	 * 
	 * Integer count = service.heart(seq); model.addAttribute("count", count);
	 * 
	 * return "/main/Feed"; }
	 */

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

	// 댓글 수정 (update)
	@RequestMapping(value = "/feed_edit.action", method = { RequestMethod.POST })
	@ResponseBody
	public void feed_edit(@RequestParam Map<String, Object> map) {
		service.feed_edit(map);
	}

	// 대댓글 수정 (update)
	@RequestMapping(value = "/re_feed_update.action", method = { RequestMethod.POST })
	@ResponseBody
	public void re_feed_update(@RequestParam Map<String, Object> map) {
		service.re_feed_update(map);
	}

	// 댓글 삭제 (delete)
	@RequestMapping(value = "/feed_delete.action", method = { RequestMethod.POST })
	@ResponseBody
	public void feed_delete(@RequestParam("feed_seq") Integer feed_seq) {
		service.feed_delete(feed_seq);
	}

	// 대댓글 삭제 (delete)
	@RequestMapping(value = "/re_feed_delete.action", method = { RequestMethod.POST })
	@ResponseBody
	public void re_feed_delete(@RequestParam("seq") Integer seq) {
		service.re_feed_delete(seq);
	}

	// 댓글 텍스트(select)
	@RequestMapping(value = "/main_feed.action", method = { RequestMethod.POST })
	@ResponseBody
	public Object main_feed(@RequestParam("seq") Integer seq) {
		/* List<FeedDTO> list = service.main_feed(map); */

		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.main_feed(seq);
			return map;
		} catch (Exception e) {
			return null;
		}

	}

	// 댓글 개수(select)
	@RequestMapping(value = "/main_feed_count.action", method = { RequestMethod.POST })
	@ResponseBody
	public Object main_feed_count(@RequestParam("seq") Integer seq) {

		return service.main_feed_count(seq);

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
	public void feed_heart_update(@RequestParam("feed_seq") String feed_seq,
			@RequestParam("member_seq") String member_seq, @RequestParam("gubn") String gubn) {
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

	// 대댓글 좋아요 업데이트 (Insert, Delete로 처리)
	@RequestMapping(value = "/re_feed_heart_update.action", method = { RequestMethod.POST })
	@ResponseBody
	public void re_feed_heart_update(@RequestParam("feed_seq") String feed_seq,
			@RequestParam("member_seq") String member_seq, @RequestParam("gubn") String gubn) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("feed_seq", feed_seq);
		map.put("member_seq", member_seq);
		map.put("gubn", gubn);
		service.re_feed_heart_update(map);

	}

	// 대댓글 좋아요 갯수
	@RequestMapping(value = "/re_feed_heart.action", method = { RequestMethod.POST })
	@ResponseBody
	public Object re_feed_heart(@RequestParam("feed_seq") int feed_seq) {

		Integer count = service.re_feed_heart(feed_seq);

		return count;
	}
}
