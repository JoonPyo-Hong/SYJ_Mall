package com.test.SYJ_Mall.kakaoLogin;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.common.utill.KakaoError;
import com.test.SYJ_Mall.jpqltest.JpqlMember;
import com.test.SYJ_Mall.jpqltest.JpqlTeam;

@Repository
public class KakaoLoginDAO implements IKakaoLoginDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	
	// Get capture secure key information
	@Override
	public String getCapchaSecureKey(HttpServletRequest request) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");
		
		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();
		
		String capchaSeqVal = null;
		
		try {
			
			String query = "select ait.capchaSecureKey from KakaoAdminDTO ait where ait.adminSeq = 1";
			
			capchaSeqVal = em.createQuery(query,String.class).getSingleResult();			
			
			tx.commit();
			
		} catch (Exception e) {
			KakaoError ea = new KakaoError(request, e);
			ea.basicErrorExceptionVoid();
			
			e.printStackTrace();
			tx.rollback();
			
		} finally {
			em.close();
		}
		
		emf.close();
		
		return capchaSeqVal;
	}
}
