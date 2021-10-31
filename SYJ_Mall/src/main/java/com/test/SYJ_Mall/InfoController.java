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
		List<InfoDTO> list2 = service.InfoSelect_en();
		List<InfoDTO> list3 = service.InfoSelect_jp();
		List<InfoDTO> list4 = service.InfoSelect_cn();
		List<InfoDTO> list5 = service.InfoSelect_cn2();
		System.out.println(list2.size());
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);
		model.addAttribute("list5", list5);
		return "/tiles/infoStart.layout";
	}

}
