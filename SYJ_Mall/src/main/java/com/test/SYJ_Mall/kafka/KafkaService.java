package com.test.SYJ_Mall.kafka;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class KafkaService implements IKafkaService {
	@Autowired
	private IKafkaDAO dao;
}
