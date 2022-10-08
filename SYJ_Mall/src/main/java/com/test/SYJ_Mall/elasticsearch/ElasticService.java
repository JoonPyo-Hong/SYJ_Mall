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
			
			//throw new Exception();
			ec = new ElasticSearchConn("byeanma.kro.kr", 9200, "http");
			RestHighLevelClient client = ec.elasticClient();
			
			IndexRequest indexRequest = new IndexRequest("my_index_test_1","_doc");
			RequestOptions options = RequestOptions.DEFAULT;
			IndexResponse indexResponse;
			
			for (int i = 0; i < 10; i++) {
				String jsonString = "{" +
					      "\"name\":\"kdyhkdy\"," +
					      "\"age\":\""+i+"\""+
					      "}";
				
				//위의 jsonString을 JSON타입으로 변환하여 indexRequest에 담습니다.
				indexRequest.source(jsonString,XContentType.JSON);
				indexResponse = client.index(indexRequest, options);
			}
			
			

			
			
			//GetSourceRequest getSourceRequest = new GetSourceRequest("log_try_ip", "rHJ5aoMBTyjlI_upWwq5");
			//RequestOptions options = RequestOptions.DEFAULT;
			
			//System.out.println(client.existsSource(getSourceRequest, options));
			
			//GetIndexRequest req = new GetIndexRequest("log_try_ip");
			
			//req.addFeatures(null)
			
			//System.out.println(client.indices().ex(getSourceRequest, options));
			
			//boolean exists = client.indices().exists(req,options);
			
			//System.out.println(exists);
			
			//client.putScript(null, options);
			
			//GetSourceResponse eresp = client.getSource(getSourceRequest, options);
			
			//Map<String,Object> map = eresp.getSource();
			//System.out.println(map.get("message"));
			
			
//			String jsonString = "{" +
//				      "\"name\":\"kdyhkdy\"," +
//				      "\"new_col\":\"25\","+
//				      "\"addr\":\"samsung\"," +
//				      "\"workplace\":\"index_bu_seo\","+
//				      "\"added_col4\":[{\"aa\":[{\"depth3\":[{\"vvv4\":99}]}],\"bb\":\"bbbbbbb\"}]" +
//				      "}";
			
			
		
			
			
	       client.close();
			
	        
	        return 0;
		} catch (Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
		
	}
}
