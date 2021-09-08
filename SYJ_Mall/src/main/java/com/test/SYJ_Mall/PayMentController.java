package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.velocity.runtime.directive.Parse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.SYJ_Mall.login.UserDTO;

@Controller
public class PayMentController {

	// 결제 페이지
	@RequestMapping(value = "/payment.action", method = { RequestMethod.GET })
	public String payment(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		UserDTO dto = (UserDTO) session.getAttribute("userinfo");
		request.setAttribute("selected", "today");

		int seq = 0;
		int sum = 0;
		if (dto == null) {
			seq = 1;
		} else {
			seq = dto.getUserSeq();
		}
		if(request.getParameter("num") == null){
			sum = 10;
		}else {
			sum = Integer.parseInt(request.getParameter("num"));
		}

		model.addAttribute("seq", seq);
		model.addAttribute("sum", sum);
		System.out.println(seq);
		System.out.println(sum);
		return "/pay/payment";
	}
}
