package com.test.SYJ_Mall;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.utill.KakaoCookie;
import com.test.SYJ_Mall.detail.IDetailService;

@Controller
public class DetailController {
	
	@Autowired
	private IDetailService service;
	
	// 상세화면
		@RequestMapping(value = "/detail.action", method = { RequestMethod.GET })
		public String detail(Model model, HttpServletRequest request, HttpServletResponse response) {
			//,@RequestParam Integer d_seq
			
			KakaoCookie kc = new KakaoCookie();
			//넘어온 상품 번호
			int prodtSeq = Integer.parseInt(request.getParameter("prodtSeq"));//제품번호
			int result = kc.modifySeenCookie(request, response, prodtSeq);
			
			
//			if(d_seq == null && d_seq ==0) {
//				d_seq = 1;
//			}
//			HttpSession session = request.getSession();
//			UserDTO dto = (UserDTO) session.getAttribute("userinfo");
//			request.setAttribute("selected", "today");
//
//			int seq = 0;
//			String user_name = "";
//			if (dto == null) {
//				seq = 2000018;
//				user_name = "홍준표";
//			} else {
//				seq = dto.getUserSeq();
//				user_name = dto.getUserName();
//			}
//			//System.out.println(seq);
//			List<DetailDTO> list = service.DetailSelect(d_seq);
//			List<String> list2 = service.HeaderSelect(d_seq);
//			List<FeedDTO> list3 = service.FeedSelect(d_seq);
//			List<FeedDTO> list4 = service.FeedSelect2(d_seq);
//			model.addAttribute("list", list);
//			model.addAttribute("list2", list2);
//			model.addAttribute("list3", list3);
//			model.addAttribute("list4", list4);
//			model.addAttribute("m_seq", seq);
//			model.addAttribute("l_seq", d_seq);
//			model.addAttribute("name", user_name);
			//return "/detail/detail";
			
			return null;
		}
		
		// 하트 조회
		@RequestMapping(value = "/detail_heart_select.action", method = { RequestMethod.POST })
		@ResponseBody
		public Object heart_select(@RequestParam("f_seq") int f_seq, @RequestParam("m_seq") int m_seq) {

			HashMap<String, Integer> map = new HashMap<String, Integer>();
			//System.out.println(f_seq);
			//System.out.println(m_seq);
			map.put("f_seq", f_seq);
			map.put("m_seq", m_seq);
			Integer count = service.heart_select(map);
			//System.out.println(count);
			return count;
		}

}


