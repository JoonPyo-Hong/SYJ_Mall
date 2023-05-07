package com.test.SYJ_Mall.mongodb;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.mongodb.ConnectionString;
import com.mongodb.MongoClientSettings;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;

@Configuration
public class MongoDBConfiguration {
	
	@Bean
    public MongoClient mongoClient() {
        ConnectionString connectionString = new ConnectionString("mongodb://admin-user:mongo1q2w3e4r@172.19.31.64:27021");
        MongoClientSettings mongoClientSettings = MongoClientSettings.builder()
                .applyConnectionString(connectionString)
                .build();
        
        return MongoClients.create(mongoClientSettings);
    }
}
