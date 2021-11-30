package com.test.SYJ_Mall;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.SYJ_Mall.detail.DetailDTO;
import com.test.SYJ_Mall.detail.DetailService;
import com.test.SYJ_Mall.detail.FeedDTO;
import com.test.SYJ_Mall.detail.IDetailService;
import com.test.SYJ_Mall.login.UserDTO;
import com.test.SYJ_Mall.pay.PayMentService;
import com.test.SYJ_Mall.pay.ProductDTO;

@Controller
public class DetailController {
	
	@Autowired
	private IDetailService service;
	
	// 상세화면
		@RequestMapping(value = "/detail.action", method = { RequestMethod.GET })
		public String detail(Model model, HttpServletRequest request, @RequestParam Integer d_seq) {
			
			if(d_seq == null && d_seq ==0) {
				d_seq = 1;
			}
			HttpSession session = request.getSession();
			UserDTO dto = (UserDTO) session.getAttribute("userinfo");
			request.setAttribute("selected", "today");

			int seq = 0;
			String user_name = "";
			if (dto == null) {
				seq = 2000018;
				user_name = "홍준표";
			} else {
				seq = dto.getUserSeq();
				user_name = dto.getUserName();
			}
			
			List<DetailDTO> list = service.DetailSelect(d_seq);
			List<String> list2 = service.HeaderSelect(d_seq);
			List<FeedDTO> list3 = service.FeedSelect(d_seq);
			List<FeedDTO> list4 = service.FeedSelect2(d_seq);
			model.addAttribute("list", list);
			model.addAttribute("list2", list2);
			model.addAttribute("list3", list3);
			model.addAttribute("list4", list4);
			model.addAttribute("m_seq", seq);
			model.addAttribute("l_seq", d_seq);
			model.addAttribute("name", user_name);
			return "/detail/detail";
		}
}


