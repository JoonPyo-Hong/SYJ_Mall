package com.test.SYJ_Mall;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.SYJ_Mall.info.InfoDTO;
import com.test.SYJ_Mall.info.InfoService;
import com.test.SYJ_Mall.pay.ProductDTO;


/**
 * 안내 페이지 컨트롤러 역할
 * 
 * @author joonpyo-hong
 *
 */
@Controller
public class InfoController {

	 @Autowired
	 private InfoService service;
	
	@RequestMapping(value = "/info.action", method = { RequestMethod.GET })
	public String info(Model model, HttpServletRequest request, @RequestParam Map<String, Object> map) {
		
		List<InfoDTO> list = service.InfoSelect();
		model.addAttribute("list", list);
		return "/tiles/infoStart.topping";
	}

}
