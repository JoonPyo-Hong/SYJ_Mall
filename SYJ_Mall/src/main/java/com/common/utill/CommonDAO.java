package com.common.utill;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

public class CommonDAO {

	// DB 담당
	private Connection conn;
	private CallableStatement stat;
	private ResultSet rs;
	private PreparedStatement pstat;

	public CommonDAO() {
		DBUtil util = new DBUtil();
		conn = util.open();
	}

	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 에러요건 DB에 넣어주기
	 * @param map
	 */
	public void inputErrorToDb(HashMap<String, String> map) {

		try {
			
			String sql = "{call kakao_error_log(?,?)}";

			stat = conn.prepareCall(sql);
			
			stat.setString("user_ip_address", map.get("ip"));
			stat.setString("err_msg", map.get("errormsg"));
			
			stat.execute();
			
			stat.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	

}
