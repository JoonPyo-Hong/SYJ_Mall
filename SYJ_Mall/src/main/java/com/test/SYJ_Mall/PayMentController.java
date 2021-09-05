package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PayMentController {

	// 결제 페이지
	@RequestMapping(value = "/payment.action", method = { RequestMethod.GET })
	public String main(Model model, HttpServletRequest request) {

		return "/tiles/paymentStart.layout";
	}
}
