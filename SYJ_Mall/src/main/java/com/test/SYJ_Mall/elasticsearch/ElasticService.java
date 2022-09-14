package com.test.SYJ_Mall.elasticsearch;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.client.core.GetSourceRequest;
import org.elasticsearch.client.core.GetSourceResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.ElasticSearchConn;
import com.common.utill.ErrorAlarm;

/**
 * 
 * elasticsearch 서비스 객체
 * 
 * @author shin
 *
 */
@Service
public class ElasticService implements IElasticService {

	@Autowired
	private IElasticDAO dao;
	
	
	@Override
	public int getConnectElastic(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, ElasticSearchConn ec) {
		
		try {
			
//			String hostname = "192.168.43.128";
//			int port = 9200;
//			String scheme = "http";
//			HttpHost host = new HttpHost(hostname, port, scheme);
//			RestClientBuilder restClientBuilder = RestClient.builder(host);
//			RestHighLevelClient client = new RestHighLevelClient(restClientBuilder);
//			
			ec = new ElasticSearchConn("192.168.43.128", 9200, "http");
			RestHighLevelClient client = ec.elasticClient();
			
			GetSourceRequest getSourceRequest = new GetSourceRequest("study_query_dsl", "1");
			RequestOptions options = RequestOptions.DEFAULT;
			
			GetSourceResponse eresp = client.getSource(getSourceRequest, options);
			Map<String,Object> map = eresp.getSource();
			System.out.println(map.get("message"));
			
			
			
			
			
	        client.close();
			return 0;
		} catch (Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
		
	}
}
