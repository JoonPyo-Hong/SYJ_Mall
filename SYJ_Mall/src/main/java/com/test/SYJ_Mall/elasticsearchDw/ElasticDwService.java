package com.test.SYJ_Mall.elasticsearchDw;

import java.util.ArrayList;
import java.util.List;

import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.index.query.MatchQueryBuilder;
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
	public List<String> getSearchData(String keyword) {
		
		List<String> searchResult = new ArrayList<>();
		
		try {
			
			SearchRequest searchRequest = new SearchRequest("elastic_dw_test");
			
			SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
			searchSourceBuilder.size(100); // 결과 데이터 크기를 100으로 설정
			
			MatchQueryBuilder matchQueryBuilder = QueryBuilders.matchQuery("disp_nm", keyword);
			matchQueryBuilder.analyzer("my_analyzer");
			
			searchSourceBuilder.query(matchQueryBuilder);
			searchRequest.source(searchSourceBuilder);
			
			SearchResponse searchResponse = elasticClient.restHighLevelClient().search(searchRequest, RequestOptions.DEFAULT);
			
			SearchHits hits = searchResponse.getHits();
			SearchHit[] searchHits = hits.getHits();
			
			for (SearchHit hit : searchHits) {
			    String dispNm = hit.getSourceAsMap().get("disp_nm").toString();
			    searchResult.add(dispNm);
			}
			
		
			return searchResult;
			
		} catch(Exception e) {
			e.printStackTrace();
			
			return null;
		}
	}
	
	
	
	


	
}
