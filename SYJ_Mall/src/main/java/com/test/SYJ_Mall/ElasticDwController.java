//package com.test.SYJ_Mall;
//
//import java.util.List;
//
//import javax.persistence.EntityManager;
//import javax.persistence.EntityManagerFactory;
//import javax.persistence.EntityTransaction;
//import javax.persistence.Persistence;
//import javax.persistence.Query;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.test.SYJ_Mall.elasticsearchDw.IElasticDwService;
//import com.test.SYJ_Mall.elasticsearchDw.SqlUser;
//import com.test.SYJ_Mall.mongodb.IMongoDBService;
//import com.test.SYJ_Mall.mongodb.MongoDwDTO;
//import com.test.SYJ_Mall.sqlServerJpa.ISqlServerService;
//
//@Controller
//public class ElasticDwController {
//	
//	@Autowired 
//	private IElasticDwService elasticService;
//	
//	@Autowired 
//	private ISqlServerService sqlService;
//	
//	@Autowired
//	private IMongoDBService mongoService;
//	
//	
//	@RequestMapping(value = "/mongoToSqlDw.action", method = { RequestMethod.GET , RequestMethod.POST})
//	public String mongoDwTest(HttpServletRequest request, HttpServletResponse response) {
//		
//		int batchSize = 100000;
//		
//		List<MongoDwDTO> mongoDwDto = mongoService.getMongoDwData(batchSize);
//
//		
//		sqlService.insertData(mongoDwDto);
//		
//		
//		return "";
//	}
//	
//	
//	@RequestMapping(value = "/elasticDwStarting.action", method = { RequestMethod.GET , RequestMethod.POST})
//	public String elasticDwStarting(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		
//		int totalUserCount = sqlService.getUserCount("MONGO_ELASTIC");
//		int batchPerSize = 10000;
//		
//		
//		for (int i = 1; i < totalUserCount; i = i+batchPerSize) {
//			
//			List<MongoDwDTO> userList = sqlService.getMongoUserData(i,i+batchPerSize);
//			
//			elasticService.setMongoUserDatas(userList,"elastic_dw_test");
//		}
//		
//		
//		return "";
//	}
//	
//	
//	
//	@RequestMapping(value = "/elasticDwStart.action", method = { RequestMethod.GET , RequestMethod.POST})
//	public String elasticDwStart(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		
//		//elasticService.test();
//		//elasticService.putIndex();
//		
//		return "";
//	}
//	
//	
//	@RequestMapping(value = "/sqlToElasticDummy.action", method = { RequestMethod.GET , RequestMethod.POST})
//	public String sqlToElasticDummy(HttpServletRequest request, HttpServletResponse response) {
//		
//		int totalUserCount = sqlService.getUserCount("MONGO_ELASTIC");
//		int batchPerSize = 10000;
//		
//		
//		for (int i = 1; i < totalUserCount; i = i+batchPerSize) {
//			
//			System.out.println(i);
//			
//			List<SqlUser> userList = sqlService.getSqlUserData(i,i+batchPerSize);
//			elasticService.setSqlUserDatas(userList,"elastic_dw_test");
//		}
//		
//		
//		
//		return "";
//	}
//	
//	@RequestMapping(value = "/sqlSearch.action", method = { RequestMethod.GET , RequestMethod.POST})
//	public String sqlSearch(HttpServletRequest request, HttpServletResponse response) {
//		
//		
//		EntityManagerFactory emf = Persistence.createEntityManagerFactory("sqlserver");
//
//		EntityManager em = emf.createEntityManager();
//
//		EntityTransaction tx = em.getTransaction();
//
//		tx.begin();
//
//		try {
//			
//			String queryString = "SELECT COUNT(*) from dbo.ELASTIC_USER with(nolock)";
//			
//			Query query = em.createNativeQuery(queryString);
//			
//			int result = (int) query.getSingleResult();
//			
//			System.out.println(result);
//			
//			//System.out.println(query.getSingleResult());
//			
//			
//			//String queryString = "SELECT user_seq, user_id, user_birthday, user_gender FROM dbo.ELASTIC_USER with(nolock) WHERE user_seq BETWEEN 1 AND 100";
//			
//			//Query query = em.createNativeQuery(queryString, SqlUser.class);
//			
//			//List<SqlUser> users = query.getResultList();
//			   
//		   // 검색 결과를 처리합니다.
////		   for (SqlUser user : users) {
////		      System.out.println(user.getUserSeq() + " : " + user.getUserId() + " : " + user.getUserBirthDay() + " : " + user.getUserGender());
////		   }
//		   
//		   
//			
//		   tx.commit();
//		} catch (Exception e) {
//			e.printStackTrace();
//			tx.rollback();
//		} finally {
//			em.close();
//		}
//		
//
//		emf.close();
//		
//		
//		return "";
//	}
//	
//}
