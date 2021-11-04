package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.SYJ_Mall.login.UserDTO;

@Controller
public class DetailController {
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
			model.addAttribute("seq", seq);

			return "/detail/detail";
		}
}
