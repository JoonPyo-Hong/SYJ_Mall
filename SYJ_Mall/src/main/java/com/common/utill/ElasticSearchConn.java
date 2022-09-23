package com.common.utill;

import org.apache.http.HttpHost;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestClientBuilder;
import org.elasticsearch.client.RestHighLevelClient;

/**
 * elasitcsearch 연결객체
 * @author shin
 *
 */
public class ElasticSearchConn {
	private String hostName;
	private int port;
	private String scheme;
	
	
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
	}
	
	/**
	 * elastic client
	 * @return
	 */
	public RestHighLevelClient elasticClient() {
		HttpHost host = new HttpHost(this.hostName, this.port, this.scheme);
		RestClientBuilder restClientBuilder = RestClient.builder(host);
		RestHighLevelClient client = new RestHighLevelClient(restClientBuilder);
		
		return client;
	}
	
	//public int inputData
}
