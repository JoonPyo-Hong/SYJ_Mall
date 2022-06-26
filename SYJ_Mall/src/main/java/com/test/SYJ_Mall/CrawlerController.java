package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.common.utill.ErrorAlarm;
import com.common.utill.KakaoCookie;
import com.common.utill.StringFormatClass;
import com.test.SYJ_Mall.crawling.ICrawlerService;

/**
 * 크롤링 컨트롤러
 * @author shin
 *
 */
@Controller
public class CrawlerController {
	@Autowired
	private ICrawlerService service;
	
	//결제페이지 화면
	@RequestMapping(value = "/crawlingMain.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String crawlingMain(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, StringFormatClass sf) {
		
		int result = service.goCrawling(request,response,ea,sf);
		
		//int test = service.goTesting(request,response,ea,sf);
		
		return null;
	}
}
