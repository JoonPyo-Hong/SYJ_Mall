package com.common.utill;

import java.util.Calendar;
import java.util.HashMap;

import org.apache.http.HttpHost;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.nio.client.HttpAsyncClientBuilder;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestClientBuilder;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.client.RestClientBuilder.HttpClientConfigCallback;

import lombok.Data;

/**
 * elasitcsearch 연결객체
 * @author shin
 *
 */
@Data
public class ElasticSearchConn {
	private String hostName;//(deprecated)
	private int port; //(deprecated)
	private String scheme; //(deprecated)
	private RestHighLevelClient client;
	private RequestOptions options = RequestOptions.DEFAULT;
	
	/**
	 * ElasticSearchConn 객체
	 */
	public ElasticSearchConn() {}
	
	/**
	 * ElasticSearchConn 객체
	 * @param hostName
	 * @param port
	 * @param scheme
	 */
	public ElasticSearchConn(String hostName, int port, String scheme) {
		this.hostName = hostName;
		this.port = port;
		this.scheme = scheme;
		
		CredentialsProvider credentialsProvider = new BasicCredentialsProvider();
		
		credentialsProvider.setCredentials(AuthScope.ANY,
				new UsernamePasswordCredentials("elastic", "H0nI5jmRY9ZQhetL7GVt"));
		
		RestClientBuilder builder = RestClient.builder(new HttpHost(this.hostName, this.port, this.scheme))
				.setHttpClientConfigCallback(new HttpClientConfigCallback() {
					@Override
					public HttpAsyncClientBuilder customizeHttpClient(HttpAsyncClientBuilder httpClientBuilder) {
						return httpClientBuilder.setDefaultCredentialsProvider(credentialsProvider);
					}
				});
		
		RestHighLevelClient client = new RestHighLevelClient(builder);
		this.client = client;
	}
	
	
	/**
	 * Post data to Index
	 * @param indexName
	 * @param jsonMap
	 * @return
	 * @throws Exception
	 */
	public IndexResponse elasticPostData(String indexName, HashMap<String, Object> jsonMap) throws Exception {
		
		IndexResponse indexResponse;
		IndexRequest indexRequest = new IndexRequest(indexName,"_doc");
		
		indexRequest.source(jsonMap);
		indexResponse = this.client.index(indexRequest, this.options);
		
		return indexResponse;
	}
	


	/**
	 * Disconnecting elasticsearch
	 * @throws Exception
	 */
	public void connClose() throws Exception {
		this.client.close();
	}
	
	
	
}
