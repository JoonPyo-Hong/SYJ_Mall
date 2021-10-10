package com.common.utill;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
/**
 * 공통 DB 담당 클래스
 * @author shin
 *
 */
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
	
	/**
	 * 로그인 된 경우에 장바구니 기능 -> 장바구니에서 빼주거나 넣어주기.
	 * @param userSeq	유저고유번호
	 * @param prodtId	상품번호
	 * @return			1: 장바구니에 추가,	2: 장바구니에서 삭제, -1: 오류
	 */
	public int setBasketProdt(int userSeq, int prodtId) {
		try {
			System.out.println(userSeq);
			String sql = "{? = call kakao_popular_product_basket(?,?)}";
			
			stat = conn.prepareCall(sql);
			stat.registerOutParameter(1, java.sql.Types.INTEGER);
			stat.setInt("qoouser_seq", userSeq);
			stat.setInt("product_id", prodtId);
			
			stat.execute();
			
			int result = stat.getInt(1);
			stat.close();
			
			return result;
			
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}

	

}
