package com.test.SYJ_Mall.sqlServerJpa;

import java.util.List;

public interface ISqlServerService {

//	int getUserCount(String tableName);
//
//	List<SqlUser> getSqlUserData(int startIndex, int batchPerSize);
//
//	void insertData(List<MongoDwDTO> mongoDto);
//
//	List<MongoDwDTO> getMongoUserData(int startIndex, int batchPerSize);

	List<String> getSearchData(String keyword);

}
