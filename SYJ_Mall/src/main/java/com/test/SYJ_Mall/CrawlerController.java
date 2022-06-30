package com.test.SYJ_Mall;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.common.utill.CommonDAO;
import com.common.utill.Encryption;
import com.common.utill.ErrorAlarm;
import com.common.utill.StringFormatClass;
import com.test.SYJ_Mall.crawling.ICrawlerService;

/**
 * 크롤링 컨트롤러
 * 
 * @author shin
 *
 */
@Controller
public class CrawlerController {
	@Autowired
	private ICrawlerService service;

	// 크롤링
	@RequestMapping(value = "/crawlingMain.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String crawlingMain(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea,
			StringFormatClass sf, Encryption enc, CommonDAO cdao) {

		// System.out.println(System.getProperty("user.dir"));

		int result = service.goCrawling(request, response, ea, sf, enc, cdao);

		// int test = service.goTesting(request,response,ea,sf);
		
		System.out.println("!! : " + result);
		
		return null;
	}

	// 엑셀
	@RequestMapping(value = "/excelMain.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String excelMain(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea,StringFormatClass sf, Encryption enc, CommonDAO cdao) {

		 //File path = new File(".");
		 //System.out.println(path.getAbsolutePath()); //--> 프로젝트 폴더의 주소가 출력됨
		 
		int result = service.getExcelLogic(request,response);

		return null;
	}

}
