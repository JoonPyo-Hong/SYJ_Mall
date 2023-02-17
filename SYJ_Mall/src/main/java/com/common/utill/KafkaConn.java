package com.common.utill;

import java.util.Properties;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.StringSerializer;

import lombok.Data;

/**
 * Kafka connection instance
 * @author shin
 *
 */
@Data
public class KafkaConn {
	
	private String bootstrap_server_ip; 
	private int bootstrap_server_port; 
	private String kafka_topic_name;
	
	
	public KafkaConn() {};
	
	/**
	 * 
	 * @param bootstrap_server_ip
	 * @param bootstrap_server_port
	 * @param kafka_topic_name
	 */
	public KafkaConn(String bootstrap_server_ip, int bootstrap_server_port, String kafka_topic_name) {
		this.bootstrap_server_ip = bootstrap_server_ip;
		this.bootstrap_server_port = bootstrap_server_port;
		this.kafka_topic_name = kafka_topic_name;
	}
	
	/**
	 * Send a message through kafkatopic
	 * @param data
	 * @throws Exception
	 */
	public void kafkaSendMessage(String data) throws Exception {
		
		Properties configs = new Properties();
		String bootstrap_server = bootstrap_server_ip + ":" +bootstrap_server_port;
		
		configs.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrap_server);// kafka cluster
		configs.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());// KEY_SERIALIZER
        configs.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName()); // VALUE_SERIALIZE
        
        KafkaProducer<String, String> producer = new KafkaProducer<>(configs);
        ProducerRecord<String,String> record = new ProducerRecord<>(kafka_topic_name,data);
        
        producer.send(record);
		
	}
	
}
