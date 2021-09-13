package com.test.SYJ_Mall.pay;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.SYJ_Mall.main.MainDAO;
@Repository
public class PayMentDAOImpl implements PayMentDAO{

		@Autowired
		private SqlSession session;
}
