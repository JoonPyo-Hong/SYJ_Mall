package com.test.SYJ_Mall.elasticsearchDw;

import java.util.List;

public interface IElasticDwService {

//	void test();
//	
//	void createIndex();
//	
//	void putIndex();
//
//	void setSqlUserDatas(List<SqlUser> userList, String indexName);
//
//	void setMongoUserDatas(List<MongoDwDTO> userList, String indexName);

	List<String> getSearchData(String keyword);

	
}
