package com.test.SYJ_Mall.prodtPay;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * 상품결제 DAO
 * @author shin
 *
 */
@Repository
public class ProdtPayDAO implements IProdtPayDAO {
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public int getTest() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
