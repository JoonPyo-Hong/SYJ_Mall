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
			session.insert("payment.order",map);
		}

		@Override
		public void shpping(Map<String, Object> map) {
			/*
			 * System.out.println(map.get("l_seq"));
			 * System.out.println(map.get("shipping_name"));
			 * System.out.println(map.get("shipping_phone_number"));
			 * System.out.println(map.get("shipping_adress"));
			 * System.out.println(map.get("shipping_message"));
			 * System.out.println(map.get("pay")); System.out.println(map.get("stat"));
			 * System.out.println(map.get("price"));
			 */
			
			session.insert("payment.shipping",map);
			
		}
}
