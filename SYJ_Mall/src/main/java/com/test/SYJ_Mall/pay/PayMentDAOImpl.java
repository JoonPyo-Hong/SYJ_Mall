package com.test.SYJ_Mall.pay;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.SYJ_Mall.main.MainDAO;
@Repository
public class PayMentDAOImpl implements PayMentDAO{

		@Autowired
		private SqlSession session;

		@Override
		public List<ProductDTO> PaySelect(String str1) {
			// TODO Auto-generated method stub
			//System.out.println(str1);
			return session.selectList("payment.PaySelect", str1);
		}
}
