package com.test.SYJ_Mall.pay;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


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

		@Override
		public int last_seq() {
			// TODO Auto-generated method stub
			return session.selectOne("payment.last_seq");
		}

		@Override
		public void order(Map<String, Object> map) {
			// TODO Auto-generated method stub
			//session.insert("payment.order",map);
		}

		@Override
		public void shpping(Map<String, Object> map) {
			//session.insert("payment.shpping",map);
			
		}
}
