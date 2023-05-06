package com.test.SYJ_Mall.sqlServerJpa;

import java.util.List;

import com.test.SYJ_Mall.elasticsearchDw.SqlUser;

public interface ISqlServerService {

	int getUserCount(String tableName);

	List<SqlUser> getSqlUserData(int startIndex, int batchPerSize);

}
