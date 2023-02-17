package com.common.utill;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.time.LocalDateTime;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.elasticsearch.action.index.IndexResponse;

/**
 * Server Error Related Classes
 * 
 * @author sinseunghwan
 *
 */
public class KakaoError {
	
	private Exception e;
	private String ip;
	private HttpServletRequest request;
	
	
	public KakaoError() {}
	
	public KakaoError(HttpServletRequest request, Exception e) {
		this.request = request;
		this.e = e;
		
		IpCheck ic = new IpCheck();
		String ip = ic.getClientIP(request);
		
		this.ip = ip;
	}
	
	/**
	 * Send error message to Kafka Broker 
	 * 
	 */
	public void sendErrorMassegeAdmin() {
		
		CommonDateFormat cd = new CommonDateFormat();
		KafkaConn kc = new KafkaConn("byeanma.kro.kr",9092,"errortopics");
		String requestedUrl = this.request.getRequestURL().toString();
		
		StringWriter errors = new StringWriter();
		
		errors.append("<table border='1' style='width:1200px;'>");
		errors.append("<th colspan = '2' style='color:red; font-size: 2em; font-weight: bolder;'>Error Occurred In SYJ_Mall</th>");
		errors.append("<tr><td>machine ip</td><td>Date of occurrence</td></tr>");
		errors.append("<tr><td>");
		errors.append(this.ip);
		errors.append("</td><td>");
		errors.append(cd.formatStringTimeKOR());
		errors.append("</td></tr>");
		
		errors.append("<tr><td colspan='2' style='color: red; font-size: 1.3em; font-weight: bolder; text-align: center;'>Error URL</td></tr>");
		errors.append("<tr><td colspan='2' style='text-align: center;'>");
		errors.append(requestedUrl);
		errors.append("</td><tr>");
		

		errors.append("<tr><td colspan='2' style='color: red; font-size: 1.3em; font-weight: bolder; text-align: center;'>Error Log</td></tr>");
		errors.append("<tr><td colspan='2'>");
		
		this.e.printStackTrace(new PrintWriter(errors));
		
		errors.append("</td></tr></table>");
		
		
		String errorsMsg = errors.toString();
		errorsMsg = errorsMsg.replaceAll("\\)", ")<br>");
		errorsMsg = errorsMsg.replaceAll("\\###", "<br>###");
		
		
		try {
			kc.kafkaSendMessage(errorsMsg);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * Send error log to Elasticsearch
	 * 
	 */
	public void inputErrorToDbElastic() {
		
		CommonDateFormat cd = new CommonDateFormat();
		ElasticSearchConn ec = new ElasticSearchConn("byeanma.kro.kr", 9200, "http");
		
		StringWriter errors = new StringWriter();
		this.e.printStackTrace(new PrintWriter(errors));
		
		HashMap<String,Object> jsonMap = new HashMap<String, Object>();
		
		LocalDateTime curTimeKor = cd.getPresentTime();
		LocalDateTime curTimeUTC = cd.getPresentTimeUTC();
		String curTimeUtcStr = cd.formatStringTimeElastic(curTimeUTC);
		
		jsonMap.put("@timestamp",curTimeUtcStr);
		jsonMap.put("ip",this.ip);
		jsonMap.put("errMsg",errors.toString());
		
		
		String dateNameIndex = cd.getDateElasticIndex("error_log_index",curTimeKor);

		try {
			
			IndexResponse indexresp = ec.elasticPostData(dateNameIndex,jsonMap);
			ec.connClose();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	
	
	/**
	 * Default setting for ERROR factor combination 1
	 * 
	 * @return
	 */
	public String basicErrorException() {
		
		sendErrorMassegeAdmin();
		inputErrorToDbElastic();
		
		return "/testwaiting/kakaoerror";
	}
	
	
	
}
