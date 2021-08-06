package com.test.SYJ_Mall;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.SYJ_Mall.dummy.IDummyService;

/**
 * 더미 생성 컨트롤러 역할
 * @author shin
 *
 */
@Controller
public class DummyController {
	
	@Autowired
	private IDummyService service;
	
	
	//처음에 입력 페이지로 보내주기
	@RequestMapping(value = "/dummyStart.action", method = { RequestMethod.GET })
	public String dummyStart(HttpServletRequest request, HttpServletResponse response) {
		
		return "/dummy/dummyInfo";
	}
	
	//여기서 디비랑 직접 연동해서 작업을 진행한다.
	@RequestMapping(value = "/dummyInfoGo.action", method = { RequestMethod.POST })
	public String dummyInfoGo(
			@RequestParam(value="product_category",required=true) List<Integer> categories,
			@RequestParam(value="product_nm",required=true) List<String> names,
			@RequestParam(value="product_count",required=true) List<Integer> counts,
			@RequestParam(value="product_price",required=true) List<Integer> prices,
			@RequestParam(value="product_discount",required=true) List<Integer> discounts,
			@RequestParam(value="rep_yn",required=true) List<String> rep_yns,
			@RequestParam(value="prodt_char_1",required=true) List<Integer> char_firsts,
			@RequestParam(value="prodt_char_2",required=true) List<Integer> char_seconds,
			@RequestParam(value="rep_img",required=true) List<String> rep_imgs,
			@RequestParam(value="head_img1",required=true) List<String> heads1,
			@RequestParam(value="head_img2",required=true) List<String> heads2,
			@RequestParam(value="head_img3",required=true) List<String> heads3,
			@RequestParam(value="head_img4",required=true) List<String> heads4,
			HttpServletRequest request, HttpServletResponse response) 
	{
		
		int result = service.putInfo(categories,names,counts,prices,discounts,
									rep_yns,char_firsts,char_seconds,rep_imgs,
									heads1,heads2,heads3,heads4);
		
		
		System.out.println(result);
		
		return "/dummy/dummyInfo";
	}
	
	
}
