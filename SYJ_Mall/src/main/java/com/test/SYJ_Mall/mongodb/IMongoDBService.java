package com.test.SYJ_Mall.mongodb;

import java.util.List;

public interface IMongoDBService {

	void test();

	List<MongoDwDTO> getMongoDwData(int batchSize);

}
