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

		int m_seq = 0;
		
		if (dto == null) {
			m_seq = 1;
		} else {
			m_seq = dto.getUserSeq();
		}
		String[] p_seq;
		String[] sum;
		if(request.getParameterValues("p_seq") !=null && request.getParameterValues("sum")!=null) {
			p_seq = request.getParameterValues("p_seq");
			sum = request.getParameterValues("sum");
			
			for (int i = 0; i < p_seq.length; i++) {
				System.out.println(sum[i]);
			}
			for (int i = 0; i < sum.length; i++) {
				System.out.println(sum[i]);
			}
			model.addAttribute("p_seq", p_seq);		
			model.addAttribute("sum", sum);
		}
			
		model.addAttribute("m_seq", m_seq);


		return "/pay/payment";
	}
//	
//	// 결제 페이지 테스트
//	@RequestMapping(value = "/payment_test.action", method = { RequestMethod.POST })
//	public void payment_test(Model model, HttpServletRequest request) {
//		System.out.println("test");
//		System.out.println(request);
//		System.out.println(request.toString());
//
//		String[] p_seq;
//		String[] sum;
//		if(request.getParameterValues("p_seq") !=null && request.getParameterValues("sum")!=null) {
//			p_seq = request.getParameterValues("p_seq");
//			sum = request.getParameterValues("sum");
//			
//			for (int i = 0; i < p_seq.length; i++) {
//				System.out.println(p_seq[i]);
//			}
//			for (int i = 0; i < sum.length; i++) {
//				System.out.println(sum[i]);
//			}
//		
//		}
//			
//	
//
//
//	}
}
