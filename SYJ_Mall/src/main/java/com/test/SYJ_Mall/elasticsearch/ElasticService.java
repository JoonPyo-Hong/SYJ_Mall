package com.test.SYJ_Mall.elasticsearch;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpHost;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.nio.client.HttpAsyncClientBuilder;
import org.apache.lucene.search.TotalHits;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestClientBuilder;
import org.elasticsearch.client.RestClientBuilder.HttpClientConfigCallback;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.client.indices.CreateIndexRequest;
import org.elasticsearch.client.indices.CreateIndexResponse;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.xcontent.XContentType;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.builder.SearchSourceBuilder;
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
			
		
			
			ec = new ElasticSearchConn("elastic:H0nI5jmRY9ZQhetL7GVt@10.107.11.66", 9200, "http");
			
			//RestHighLevelClient client = ec.elasticClient();
			
			/*
			 * IndexRequest indexRequest = new IndexRequest("last_test_2","_doc");
			 * RequestOptions options = RequestOptions.DEFAULT; IndexResponse indexResponse;
			 * 
			 * 
			 * 
			 * for (int i = 0; i < 2000; i++) {
			 * 
			 * String presentDate = cd.getPresentTimeMilleUTC();
			 * 
			 * String jsonString = "{" + "\"@timestamp\":\""+presentDate+"\"," +
			 * "\"movieCd\":"+i+"," + "\"movieNm\":\"bye\","+ "\"movieNmEn\":\"bye\""+ "}";
			 * 
			 * indexRequest.source(jsonString,XContentType.JSON); indexResponse =
			 * client.index(indexRequest, options);
			 * 
			 * }
			 * 
			 * 
			 * client.close();
			 */
	        
	       return 0;
		} catch (Exception e) {
			//e.printStackTrace();
			ea.basicErrorException(request, e);
			
			return -1;
		}
		
	}


	@Override
	public int getConnectElasticTestt(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea,ElasticSearchConn ec, CommonDate cd) {
		try {
			
			
			
			final CredentialsProvider credentialsProvider = new BasicCredentialsProvider();
			credentialsProvider.setCredentials(AuthScope.ANY,
					new UsernamePasswordCredentials("elastic", "H0nI5jmRY9ZQhetL7GVt"));

			RestClientBuilder builder = RestClient.builder(new HttpHost("byeanma.kro.kr", 9200))
					.setHttpClientConfigCallback(new HttpClientConfigCallback() {
						@Override
						public HttpAsyncClientBuilder customizeHttpClient(HttpAsyncClientBuilder httpClientBuilder) {
							return httpClientBuilder.setDefaultCredentialsProvider(credentialsProvider);
						}
					});
			
			//RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(new HttpHost("http://elastic:H0nI5jmRY9ZQhetL7GVt@byeanma.kro.kr", 9200, "http")));
			//CredentialsProvider credentialsProvider = new BasicCredentialsProvider();
			//credentialsProvider.setCredentials(AuthScope.ANY, new UsernamePasswordCredentials("elastic", "H0nI5jmRY9ZQhetL7GVt"));
			//RestClientBuilder builder = RestClient.builder(
					//new HttpHost("192.168.0.23", 9200)).setHttpClientConfigCallback(
				        //httpClientBuilder -> httpClientBuilder.setDefaultCredentialsProvider(credentialsProvider));
			
			
			//RestClient httpClient = RestClient.builder(new HttpHost("http://elastic:H0nI5jmRY9ZQhetL7GVt@byeanma.kro.kr", 9200)).build();
			
			//RestHighLevelClient hlrc = new RestHighLevelClient(httpClient).setApiCompatibilityMode(true).build();
			//RestHighLevelClient builder = RestClient.builder(new HttpHost("http://elastic:H0nI5jmRY9ZQhetL7GVt@byeanma.kro.kr",9200));
			
			ec = new ElasticSearchConn("elastic:H0nI5jmRY9ZQhetL7GVt@byeanma.kro.kr", 9200, "http");
			//RestHighLevelClient client = new RestHighLevelClientBuilder(httpClient).setApiCompatibilityMode(true).build();
			
			RestHighLevelClient clients = new RestHighLevelClient(builder);
			//RestHighLevelClient client = ec.elasticClient();
			//RequestOptions options = RequestOptions.DEFAULT;

			BoolQueryBuilder query = QueryBuilders.boolQuery();
			query.must(QueryBuilders.termQuery("ip", "192.143.98.11"));
			//query.must(QueryBuilders.rangeQuery("@timestamp").gte("2022-10-10 09:16:54.001"));
			//query.must(QueryBuilders.rangeQuery("@timestamp").lte("2022-10-10 09:17:54.001"));
			
			SearchRequest searchRequest = new SearchRequest();
			searchRequest.indices("login_cnt_index_1");
			SearchSourceBuilder sourceBuilder = new SearchSourceBuilder(); 
	
			sourceBuilder.query(query);
			searchRequest.source(sourceBuilder);
			SearchResponse srep = clients.search(searchRequest, RequestOptions.DEFAULT);
			
			TotalHits result = srep.getHits().getTotalHits();
			
			System.out.println(result.value);
			
			clients.close();
			

			return 1;
			
		} catch(Exception e) {
			e.printStackTrace();
			//ea.basicErrorException(request, e);
			return -1;
		}
		
	}


	@Override
	public int getConnectElasticCreate(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea,ElasticSearchConn ec, CommonDate cd) {
		
		try {
			
			ec = new ElasticSearchConn("byeanma.kro.kr", 9200, "http");
			//RestHighLevelClient client = ec.elasticClient();
			RequestOptions options = RequestOptions.DEFAULT;
			
			CreateIndexRequest elaReq = new CreateIndexRequest("sh_test_1");
			
			elaReq.settings(Settings.builder() 
				    .put("index.number_of_shards", 3)
				    .put("index.number_of_replicas", 1));
			
			String[] fields = {"message","age","today"};
			String[] types = {"text","integer","date"};
			
			Map<String, Object> message;
			Map<String, Object> properties = new HashMap<String, Object>();
			Map<String, Object> mapping = new HashMap<String, Object>();
			
			
			for (int i = 0; i < fields.length; i++) {
				message = new HashMap<String, Object>();
				message.put("type",types[i]);
				properties.put(fields[i],message);
			}
			
			
			//message.put("type", "text");
			//properties.put("message", message);
			
			//message = new HashMap<String, Object>();
			
			//message.put("type", "integer");
			//properties.put("age", message);
			
			//message = new HashMap<String, Object>();
			
			//message.put("type", "date");
			//properties.put("today", message);
			
			
			mapping.put("properties", properties);
			
			
			
			elaReq.mapping(mapping);
			
			
			//CreateIndexResponse createIndexResponse = client.indices().create(elaReq, options);
			
			//boolean acknowledged = createIndexResponse.isAcknowledged(); 
			//boolean shardsAcknowledged = createIndexResponse.isShardsAcknowledged();
			
			//System.out.println(acknowledged);
			//System.out.println(shardsAcknowledged);
			
			return 0;
			
		} catch (Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
	}


	@Override
	public int getConnectElasticPost(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, ElasticSearchConn ec, CommonDate cd) {
		try {
			
			ec = new ElasticSearchConn("byeanma.kro.kr", 9200, "http");
			//RestHighLevelClient client = ec.elasticClient();
			
			IndexRequest indexRequest = new IndexRequest("sh_test_1","_doc");
			RequestOptions options = RequestOptions.DEFAULT;
			IndexResponse indexResponse;
			
			
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("age", 32);
			jsonMap.put("message","what the");
			jsonMap.put("today", cd.getPresentTimeUTCCal());
			
			indexRequest.source(jsonMap);
			//indexResponse = client.index(indexRequest, options);
			
			//client.close();
			
			return 0;
		} catch(Exception e) {
			e.printStackTrace();
			ea.basicErrorException(request, e);
			return -1;
		}
	}
}
