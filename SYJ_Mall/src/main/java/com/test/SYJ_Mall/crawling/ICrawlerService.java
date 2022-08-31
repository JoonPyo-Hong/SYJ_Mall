package com.test.SYJ_Mall.crawling;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.utill.CommonDAO;
import com.common.utill.Encryption;
import com.common.utill.ErrorAlarm;
import com.common.utill.StringFormatClass;

public interface ICrawlerService {
	
	/**
	 * 크롤링 서비스
	 * @param request
	 * @param response
	 * @param ea
	 * @param sf
	 * @param enc
	 * @param cdao
	 * @return
	 */
	int goCrawling(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, StringFormatClass sf,Encryption enc, CommonDAO cdao);
	
	/**
	 * 테스트
	 * @param request
	 * @param response
	 * @param ea
	 * @param sf
	 * @return
	 */
	int goTesting(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, StringFormatClass sf);
	
	/**
	 * 엑셀테스트
	 * @param request
	 * @param response
	 * @return
	 */
	int getExcelLogic(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 그라파나 관련 엑셀 비교
	 * @param request
	 * @param response
	 * @param ea
	 * @param sf
	 * @return
	 */
	List<String> getGrafanaExcelLogic(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea,StringFormatClass sf, String url);

}
