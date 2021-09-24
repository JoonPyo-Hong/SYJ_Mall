package com.test.SYJ_Mall;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.SYJ_Mall.login.UserDTO;
import com.test.SYJ_Mall.main.MainDTO;
import com.test.SYJ_Mall.pay.PayMentService;
import com.test.SYJ_Mall.pay.ProductDTO;

@Controller
public class PayMentController {

	@Autowired
	private PayMentService service;

	// 결제 페이지
	@RequestMapping(value = "/payment.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String payment(Model model, HttpServletRequest request, @RequestParam Map<String, Object> map) {
//		System.out.println(map.get("p_seq"));
//		System.out.println(map.get("sum"));
		if (map.get("p_seq") != null) {
			String str1 = (String) map.get("p_seq");
			String str2 = (String) map.get("sum");
//			String [] temp1 = str1.split(",");
			String[] temp2 = str2.split(",");
			List<ProductDTO> list1 = service.PaySelect(str1);
			List<String> list2 = new ArrayList<String>();
			String txt = "";
			for (int i = 0; i < temp2.length; i++) {
				list2.add(temp2[i]);
			}
			model.addAttribute("list1", list1);
			model.addAttribute("list2", list2);
		}
		HttpSession session = request.getSession();
		UserDTO dto = (UserDTO) session.getAttribute("userinfo");
		request.setAttribute("selected", "today");

		int m_seq = 0;

		if (dto == null) {
			m_seq = 1;
		} else {
			m_seq = dto.getUserSeq();
		}

		model.addAttribute("m_seq", m_seq);

		return "/pay/payment";

	}
	
	//결제하기 버튼_1 (order)
	@RequestMapping(value = "/order.action", method = { RequestMethod.POST })
	@ResponseBody
	public void order(@RequestParam Map<String, Object> map) {
		System.out.println(map.get("shipping_name"));
		// service.order(map);
	}
	
	//결제하기 버튼_2 (shpping)
	@RequestMapping(value = "/shpping.action", method = { RequestMethod.POST })
	@ResponseBody
	public void shpping(@RequestParam Map<String, Object> map) {
		System.out.println(map.get("p_seq"));
		// service.shpping(map);
	}

	// 주소 api 팝업창
    @RequestMapping(value="/jusoPopup.action", method=RequestMethod.GET)
    public String popupGet(Model model) throws Exception {
        
        return "/pay/jusoPopup";
    }
}
