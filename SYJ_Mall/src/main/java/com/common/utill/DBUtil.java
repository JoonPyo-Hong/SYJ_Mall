package com.common.utill;

import java.sql.Connection;
import java.sql.DriverManager;
/**
 * 공통 DB 객체
 * @author shin
 *
 */
public class DBUtil {
	
	private Connection conn = null;

	public Connection open() {

		String url = "jdbc:sqlserver://byeanma.kro.kr:11289;database=MALL";
		String id = "seunghwan";
		String pw = "byeanma170125";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			conn = DriverManager.getConnection(url, id, pw);

			return conn;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
}
