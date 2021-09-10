package com.test.SYJ_Mall;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.velocity.runtime.directive.Parse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.SYJ_Mall.login.UserDTO;

@Controller
public class PayMentController {

	// 결제 페이지
	@RequestMapping(value = "/payment.action", method = { RequestMethod.POST })
	public String payment(Model model, HttpServletRequest request, @RequestParam Map<String, Object> map) {
		System.out.println(map.get("p_seq"));
		System.out.println(map.get("sum"));
		HttpSession session = request.getSession();
		UserDTO dto = (UserDTO) session.getAttribute("userinfo");
		request.setAttribute("selected", "today");

		int m_seq = 0;

		if (dto == null) {
			m_seq = 1;
		} else {
			m_seq = dto.getUserSeq();
		}
	
	

	model.addAttribute("m_seq",m_seq);

	return"/pay/payment";

	}



}
