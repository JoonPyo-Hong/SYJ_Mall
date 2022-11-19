package com.test.SYJ_Mall;

import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.apache.kafka.common.serialization.StringSerializer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.SYJ_Mall.kafka.IKafkaService;

@Controller
public class KafkaController {
	
	@Autowired
	private IKafkaService service;
	
	// kafka test
	@RequestMapping(value = "/kafkaProducer.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String kafkaProducer(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			
			Properties configs = new Properties();
			configs.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "byeanma.kro.kr:9092");// kafka cluster
			configs.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());// KEY_SERIALIZER
	        configs.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName()); // VALUE_SERIALIZER

	        // init KafkaProducer
	        KafkaProducer<String, String> producer = new KafkaProducer<>(configs);
			
	        int idx = 0;
	        
	        while(true){

	            // set ProducerRecord
	            String topic = "testtopics";           // topic name
	            Integer partition = 3;           // partition number (default: Round Robin)
	            String key = "key-" + idx;       // key  (default: null)
	            String data = "record-"+ idx;    // data

	            ProducerRecord<String, String> record = new ProducerRecord<>(topic, data);
	            ProducerRecord<String, String> record2 = new ProducerRecord<>(topic, key, data);
	            ProducerRecord<String, String> record3 = new ProducerRecord<>(topic, partition, key, data);

	            // send record
	            producer.send(record);

	            System.out.println("producer.send() >> [topic:" + topic + "][data:" + data + "]");
	            Thread.sleep(1000);
	            idx++;
	        }
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}

	}
	
	@RequestMapping(value = "/kafkaConsumer.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String kafkaConsumer(HttpServletRequest request, HttpServletResponse response) {
		try {
			
			System.out.println("???");
			
			// set kafka properties
            Properties props = new Properties();
            props.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "byeanma.kro.kr:9092");  // kafka cluster
            props.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());// KEY_SERIALIZER
            props.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName()); // VALUE_SERIALIZER
            props.put(ConsumerConfig.GROUP_ID_CONFIG,"testgroup");
			
            // init KafkaConsumer
            KafkaConsumer<String, String> consumer = new KafkaConsumer<>(props);

            consumer.subscribe(Arrays.asList("testtopics")); // topic list
            final int minBatchSize = 200;

            List<ConsumerRecord<String, String>> buffer = new ArrayList<>();
            
            while (true) {
                ConsumerRecords<String, String> records = consumer.poll(Duration.ofMillis(100));  // polling interval
                for (ConsumerRecord<String, String> record : records) {
                    System.out.println(record.value());
                    buffer.add(record);
                }
                if (buffer.size() >= minBatchSize) {
                    System.out.println(buffer);
                    consumer.commitSync();
                    buffer.clear();
                }
            }
            
            
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
		
	
	
}
