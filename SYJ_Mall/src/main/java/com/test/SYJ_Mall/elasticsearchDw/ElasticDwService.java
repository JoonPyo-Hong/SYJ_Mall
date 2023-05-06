package com.test.SYJ_Mall.elasticsearchDw;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.elasticsearch.action.DocWriteResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.indices.CreateIndexRequest;
import org.elasticsearch.client.indices.CreateIndexResponse;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.XContentFactory;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ElasticDwService implements IElasticDwService {
	
	private final ElasticConfig elasticClient;
	
	@Autowired
    public ElasticDwService(ElasticConfig elasticClient) {
        this.elasticClient = elasticClient;
    }
	
	@Override
	public void test() {
		// TODO Auto-generated method stub
		SearchRequest searchRequest = new SearchRequest("login_cnt_index_2023_01_21"); // 검색할 인덱스 지정
		SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder(); // 검색 조건 및 옵션을 설정하기 위한 SearchSourceBuilder 객체 생성
	    
		
		// 검색 쿼리 설정
	    QueryBuilder queryBuilder = QueryBuilders
	            .matchQuery("ip", "192.168.0.1"); // "title" 필드에서 "Elasticsearch" 단어를 검색

	    searchSourceBuilder.query(queryBuilder); // 검색 쿼리 설정

	    searchRequest.source(searchSourceBuilder); // 검색 조건 및 옵션 설정
	    
	    try {
	    	
	    	SearchResponse searchResponse = elasticClient.restHighLevelClient().search(searchRequest, RequestOptions.DEFAULT); // 검색 실행

		    // 검색 결과 처리
		    SearchHits searchHits = searchResponse.getHits();
		    
		    for (SearchHit hit : searchHits) {
		    	
		    	System.out.println(hit.getSourceAsString());

		    }
	    } catch(Exception e) {
	    	e.printStackTrace();
	    }
	    
	}
	
	
	@Override
	public void createIndex() {
		try {
			CreateIndexRequest request = new CreateIndexRequest("my-index-testing");
	        
			request.settings(Settings.builder()
	                .put("index.number_of_shards", 3)
	                .put("index.number_of_replicas", 2)
	        );
			
			XContentBuilder builder = XContentFactory.jsonBuilder();
			
	        builder.startObject();
	        {
	            builder.startObject("properties");
	            {
	                builder.startObject("name");
	                {
	                    builder.field("type", "text");
	                }
	                builder.endObject();
	
	                builder.startObject("age");
	                {
	                    builder.field("type", "integer");
	                }
	                builder.endObject();
	
	                builder.startObject("email");
	                {
	                    builder.field("type", "text");
	                }
	                builder.endObject();
	            }
	            builder.endObject();
	        }
	        builder.endObject();
	
	        request.mapping(builder);
        
        
        	
        	CreateIndexResponse createIndexResponse = elasticClient.restHighLevelClient().indices().create(request, RequestOptions.DEFAULT);
        	
        	boolean acknowledged = createIndexResponse.isAcknowledged();
        	
        	System.out.println(acknowledged);
        	
        } catch(Exception e) {
        	e.printStackTrace();
        }
        		
        
		
		
	}
	
	@Override
	public void putIndex() {
		
		// TODO Auto-generated method stub
		try {
			
			IndexRequest request = new IndexRequest("my-index-testing");
	        
			//request.id("1");
			Map<String, Object> dataMap = new HashMap<>();
	        dataMap.put("name", "John");
	        dataMap.put("age", 28);
	        dataMap.put("email", "john@test.com");

	        request.source(dataMap);

	        IndexResponse indexResponse =  elasticClient.restHighLevelClient().index(request, RequestOptions.DEFAULT);
	        
	        if(indexResponse.getResult() == DocWriteResponse.Result.CREATED){
	            
	        	System.out.println("Data inserted successfully.");
	        	
	            //("Data inserted successfully.");
	        } else{
	        	
	        	System.out.println("Failed to insert data.");
	            //return ResponseEntity.badRequest().body("Failed to insert data.");
	        }
	        
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//http://byeanma.kro.kr:9081/SYJ_Mall/sqlToElasticDummy.action
	
	@Override
	public void setSqlUserDatas(List<SqlUser> userList, String indexName) {
		
		try {
			
			IndexRequest request = new IndexRequest(indexName);
						
			for (int i = 0; i < userList.size(); i++) {
				
				Map<String, Object> dataMap = new HashMap<>();
		        
				dataMap.put("user_seq", userList.get(i).getUserSeq());
		        dataMap.put("user_id", userList.get(i).getUserId());
		        dataMap.put("user_birthday", userList.get(i).getUserBirthDay());
		        dataMap.put("user_gender", userList.get(i).getUserGender());
				
		        request.source(dataMap);
		       
		        IndexResponse indexResponse =  elasticClient.restHighLevelClient().index(request, RequestOptions.DEFAULT);
		        
		        if(indexResponse.getResult() != DocWriteResponse.Result.CREATED){
		            
		        	System.out.println("ERROR");
		        	
		        } 
			}
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}


	
}
