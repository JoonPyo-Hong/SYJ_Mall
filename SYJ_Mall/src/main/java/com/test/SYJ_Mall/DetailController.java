package com.test.SYJ_Mall;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.SYJ_Mall.detail.DetailDTO;
import com.test.SYJ_Mall.detail.DetailService;
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
		public String detail(Model model, HttpServletRequest request) {

			HttpSession session = request.getSession();
			UserDTO dto = (UserDTO) session.getAttribute("userinfo");
			request.setAttribute("selected", "today");

			int seq = 0;

			if (dto == null) {
				seq = 0;
			} else {
				seq = dto.getUserSeq();
			}
			
			List<DetailDTO> list = service.DetailSelect();
			model.addAttribute("list", list);
			model.addAttribute("seq", seq);

			return "/detail/detail";
		}
}
