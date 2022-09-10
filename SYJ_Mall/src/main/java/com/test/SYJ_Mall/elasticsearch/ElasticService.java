package com.test.SYJ_Mall.elasticsearch;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpHost;
import org.elasticsearch.action.get.GetRequest;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestClientBuilder;
import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int getConnectElastic(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		
		try {
			
			String hostname = "192.168.43.128";
			int port = 9200;
			String scheme = "http";
			HttpHost host = new HttpHost(hostname, port, scheme);
			RestClientBuilder restClientBuilder = RestClient.builder(host);
			RestHighLevelClient client = new RestHighLevelClient(restClientBuilder);
			
			String index = "message";
			String id = "1";
			GetRequest getRequest = new GetRequest(index,id);
			RequestOptions options = RequestOptions.DEFAULT;
	        
			System.out.println(client.get(getRequest,options));
			
	        client.close();
			
			//client.
			
			return 0;
		} catch (Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
		
	}
}
