package com.test.SYJ_Mall.elasticsearch;

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
			ec = new ElasticSearchConn("byeanma.kro.kr", 9200, "http");
			RestHighLevelClient client = ec.elasticClient();
			
			GetSourceRequest getSourceRequest = new GetSourceRequest("log_try_ip", "rHJ5aoMBTyjlI_upWwq5");
			RequestOptions options = RequestOptions.DEFAULT;
			
			System.out.println(client.existsSource(getSourceRequest, options));
			
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
			//ea.basicErrorException(request, e);
			e.printStackTrace();
			return -1;
		}
		
	}
}
