package com.test.SYJ_Mall.mongodb;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import static com.mongodb.client.model.Filters.eq;
import static com.mongodb.client.model.Sorts.ascending;
import static com.mongodb.client.model.Sorts.orderBy;
import static com.mongodb.client.model.Projections.include;

@Service
public class MongoDBService implements IMongoDBService {
	
	private final MongoClient mongoClient;
	
	@Autowired
    public MongoDBService(MongoClient mongoClient) {
        this.mongoClient = mongoClient;
    }

	@Override
	public void test() {
		
		MongoDatabase database = mongoClient.getDatabase("listing_test_db");
		MongoCollection<Document> collection = database.getCollection("product_all");
		
		FindIterable<Document> findIterable = collection.find()
				.sort(ascending("_id"))
				.projection(include("benefitPrice", "todayOpenWeight", "newPopularityWeight"))
				.limit(10);
		
        List<Document> documents = new ArrayList<>();
		
        
        for (Document document : findIterable) {
            System.out.println(document);
            System.out.println(document.get("todayOpenWeight"));
        }
        
        
        
		// 모든 문서 가져오기
//        try (MongoCursor<Document> cursor = collection.find().iterator()) {
//            while (cursor.hasNext()) {
//                Document document = cursor.next();
//                System.out.println(document.toJson());
//            }
//        }

        // MongoDB 연결 닫기
        mongoClient.close();
		
	}

	@Override
	public List<MongoDwDTO> getMongoDwData(int batchSize) {
		
		MongoDatabase database = mongoClient.getDatabase("listing_test_db");
		MongoCollection<Document> collection = database.getCollection("product_all");
		
		FindIterable<Document> findIterable = collection.find()
				.sort(ascending("_id"))
				.projection(include("brandNo", "benefitPrice", "linkInfo", "dispNm"))
				.limit(batchSize);
		
        List<MongoDwDTO> mongoDtos = new ArrayList<>();
        
        
        for (Document document : findIterable) {
        	
        	int brandNo = 0;
        	Long benefitPrice = 0L;
        	Long linkInfo = 0L;
        	String dispNm = "NOT";
        	
        	if (document.get("brandNo") != null) brandNo = document.getInteger("brandNo");
        	if (document.get("benefitPrice") != null) benefitPrice = document.getLong("benefitPrice");
        	if (document.get("linkInfo") != null) linkInfo = document.getLong("linkInfo");
        	if (document.get("dispNm") != null) dispNm = document.getString("dispNm");

        	MongoDwDTO mDtos = new MongoDwDTO(brandNo,benefitPrice,linkInfo,dispNm);
        	
        	mongoDtos.add(mDtos);
        }
        
		return mongoDtos;
	}
	
	
	
}
