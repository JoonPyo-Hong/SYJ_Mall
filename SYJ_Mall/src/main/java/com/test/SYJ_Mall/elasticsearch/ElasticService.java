package com.test.SYJ_Mall.elasticsearch;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.xcontent.XContentType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.CommonDate;
import com.common.utill.ElasticSearchConn;
import com.common.utill.ErrorAlarm;

/**
 * 
 * elasticsearch 서비스 테스트 객체
 * 
 * @author shin
 *
 */
@Service
public class ElasticService implements IElasticService {

	@Autowired
	private IElasticDAO dao;
	
	
	@Override
	public int getConnectElastic(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, ElasticSearchConn ec, CommonDate cd) {
		
		try {
			
			
			ec = new ElasticSearchConn("10.107.11.66", 9200, "http");
			RestHighLevelClient client = ec.elasticClient();
			
			IndexRequest indexRequest = new IndexRequest("last_test_2","_doc");
			RequestOptions options = RequestOptions.DEFAULT;
			IndexResponse indexResponse;
			
			
			
			for (int i = 0; i < 2000; i++) {
				
				String presentDate = cd.getPresentTimeMilleUTC();
				
				String jsonString = "{" +
						"\"@timestamp\":\""+presentDate+"\"," +  
						"\"movieCd\":"+i+"," +
						"\"movieNm\":\"bye\","+
						"\"movieNmEn\":\"bye\""+
						"}";
			
				indexRequest.source(jsonString,XContentType.JSON);
				indexResponse = client.index(indexRequest, options);
			
			}
		
			
	       client.close();
			
	        
	        return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
}
