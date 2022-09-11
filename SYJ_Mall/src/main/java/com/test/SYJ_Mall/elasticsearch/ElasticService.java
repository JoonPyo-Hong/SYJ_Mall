package com.test.SYJ_Mall.elasticsearch;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpHost;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestClientBuilder;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.client.core.GetSourceRequest;
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
			
			final CredentialsProvider credentialsProvider = new BasicCredentialsProvider();
			//credentialsProvider.setCredentials(AuthScope.ANY, new UsernamePasswordCredentials("elasticssearch","1KomkvhCgy9Muz1z2K6f"));
			
//			RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
//					new HttpHost(serverName, port))
//					.setHttpClientConfigCallback(new HttpClientConfigCallback() {
//				    
//				    @Override
//				    public HttpAsyncClientBuilder customizeHttpClient(
//				   	 HttpAsyncClientBuilder httpClientBuilder) {
//				    	return httpClientBuilder
//				    		.setDefaultCredentialsProvider(credentialsProvider);
//				    }
//				}));
			
			
			GetSourceRequest getSourceRequest = new GetSourceRequest("study_query_dsl", "1");
			RequestOptions options = RequestOptions.DEFAULT;
			
			System.out.println(client.existsSource(getSourceRequest, options));
		    //System.out.println(client.get(getSourceRequest, options));
			
			
			//GetResponse resp = client.
			//prepareGet("twitter", "_doc", "1").get();
			//String index = "message";
			//String id = "1";
			//GetRequest getRequest = new GetRequest(index,id);
			//RequestOptions options = RequestOptions.DEFAULT;
	        
			//System.out.println(client.get(getRequest,options));
			
	        client.close();
			return 0;
		} catch (Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
		
	}
}
