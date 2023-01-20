package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.common.utill.KafkaConn;
import com.test.SYJ_Mall.kafka.IKafkaService;

@Controller
public class KafkaController {
	
	@Autowired
	private IKafkaService service;
	
	@RequestMapping(value = "/kafkaProducer.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String kafkaProducer(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			
			KafkaConn kc = new KafkaConn("byeanma.kro.kr",9092,"syjcluster");
			
			
			for (int i = 0; i < 10; i++) {
				Thread.sleep(1000);
				kc.kafkaSendMessage(i+"kaka");
			}
		
			
			return "";
			
			
		} catch(Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
//	private static String TOPIC_NAME = "testtopics";
//	private static String BOOTSTRAP_SERVER = "byeanma.kro.kr:9092";
//	
//	// kafka test
//	@RequestMapping(value = "/kafkaProducer.action", method = { RequestMethod.GET, RequestMethod.POST })
//	public String kafkaProducer(HttpServletRequest request, HttpServletResponse response) {
//		
//		try {
//			
//			Properties configs = new Properties();
//
//			configs.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, BOOTSTRAP_SERVER);// kafka cluster
//			configs.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());// KEY_SERIALIZER
//	        configs.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName()); // VALUE_SERIALIZE
//	        
//	        try (// init KafkaProducer
//			KafkaProducer<String, String> producer = new KafkaProducer<>(configs)) {
//				for (int index = 100; index < 110; index++) {
//					String data = "This is record " + index;
//					ProducerRecord<String,String> record = new ProducerRecord<>(TOPIC_NAME,data);
//					
//					producer.send(record);
//					
//					System.out.println("Send to " + TOPIC_NAME + " | data : " + data);
//					//Thread.sleep(1000);
//				}
//			}
//	        
//	        
//	        return "";
//	        
////			
////	        int idx = 0;
////	        
////	        
////	        for (int i = 0; i < 10; i++) {
////	        	 // set ProducerRecord
////	            String topic = "testtopics";           // topic name
////	            Integer partition = 3;           // partition number (default: Round Robin)
////	            String key = "key-" + idx;       // key  (default: null)
////	            String data = "record-"+ idx;    // data
////
////	            ProducerRecord<String, String> record = new ProducerRecord<>(topic, data);
////	            ProducerRecord<String, String> record2 = new ProducerRecord<>(topic, key, data);
////	            ProducerRecord<String, String> record3 = new ProducerRecord<>(topic, partition, key, data);
////
////	            // send record
////	            producer.send(record2);
////
////	            System.out.println("producer.send() >> [topic:" + topic + "][data:" + data + "]");
////	            //Thread.sleep(1000);
////	            idx++;
////	        }
////	        
////	        producer.close();
////	        
////	        return "";
////	        while(true){
////
////	            // set ProducerRecord
////	            String topic = "testtopics";           // topic name
////	            Integer partition = 3;           // partition number (default: Round Robin)
////	            String key = "key-" + idx;       // key  (default: null)
////	            String data = "record-"+ idx;    // data
////
////	            ProducerRecord<String, String> record = new ProducerRecord<>(topic, data);
////	            ProducerRecord<String, String> record2 = new ProducerRecord<>(topic, key, data);
////	            ProducerRecord<String, String> record3 = new ProducerRecord<>(topic, partition, key, data);
////
////	            // send record
////	            producer.send(record);
////
////	            System.out.println("producer.send() >> [topic:" + topic + "][data:" + data + "]");
////	            Thread.sleep(1000);
////	            idx++;
////	        }
//			
//			
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			return "";
//		}
//
//	}
	
//	@RequestMapping(value = "/kafkaConsumer.action", method = { RequestMethod.GET, RequestMethod.POST })
//	public String kafkaConsumer(HttpServletRequest request, HttpServletResponse response) {
//		try {
//			
//			System.out.println("???");
//			
//			// set kafka properties
//            Properties props = new Properties();
//            props.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, BOOTSTRAP_SERVER);  // kafka cluster
//            props.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());// KEY_SERIALIZER
//            props.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName()); // VALUE_SERIALIZER
//            props.put(ConsumerConfig.GROUP_ID_CONFIG,"testgroup");
//			
//            try (// init KafkaConsumer - 데이터를 읽고 처리가 가능하다.
//            	KafkaConsumer<String, String> consumer = new KafkaConsumer<>(props)) {
//				consumer.subscribe(Arrays.asList(TOPIC_NAME)); // topic list
//				//final int minBatchSize = 200;
//
//				//List<ConsumerRecord<String, String>> buffer = new ArrayList<>();
//				
//				while(true) {
//					ConsumerRecords<String, String> records = consumer.poll(Duration.ofSeconds(1));
//					for (ConsumerRecord<String, String> record : records) {
//						System.out.println(record.value());
//					}
//				}
//			}
//            
//            
////            while (true) {
////                ConsumerRecords<String, String> records = consumer.poll(Duration.ofMillis(100));  // polling interval
////                System.out.println("!!!");
////                for (ConsumerRecord<String, String> record : records) {
////                	System.out.println(record.value());
////                    //buffer.add(record);
////                }
//////                if (buffer.size() >= minBatchSize) {
//////                    System.out.println(buffer);
//////                    consumer.commitSync();
//////                    buffer.clear();
//////                }
////            }
//            
//            
//		} catch (Exception e) {
//			e.printStackTrace();
//			return "";
//		}
//	}
		
	
	
}
