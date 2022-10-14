package com.common.utill;

import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpHost;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestClientBuilder;
import org.elasticsearch.client.RestHighLevelClient;

/**
 * elasitcsearch 연결객체
 * @author shin
 *
 */
public class ElasticSearchConn {
	private String hostName;//(deprecated)
	private int port; //(deprecated)
	private String scheme; //(deprecated)
	private RequestOptions options = RequestOptions.DEFAULT;
	private RestHighLevelClient client;
	
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
		
		HttpHost host = new HttpHost(hostName, port, scheme);
		RestClientBuilder restClientBuilder = RestClient.builder(host);
		this.client = new RestHighLevelClient(restClientBuilder);
	}
	
	
	/**
	 * elastic client(deprecated)
	 * @return RestHighLevelClient
	 */
	public RestHighLevelClient elasticClient() {
		HttpHost host = new HttpHost(this.hostName, this.port, this.scheme);
		RestClientBuilder restClientBuilder = RestClient.builder(host);
		RestHighLevelClient client = new RestHighLevelClient(restClientBuilder);
		
		return client;
	}
	
	public IndexResponse elasticPostData(String indexName, HashMap<String, Object> jsonMap) throws Exception {
		
		IndexResponse indexResponse;
		IndexRequest indexRequest = new IndexRequest(indexName,"_doc");
		
		indexRequest.source(jsonMap);
		indexResponse = this.client.index(indexRequest, this.options);
		
		return indexResponse;
	}
	
	
	
	
}
