package com.common.utill;

/**
 * server test 용 - 에러 발생시키기
 * @author shin
 *
 */
public class ServerTesting {
	
	
	public Exception erruptError() {
		
			throw new IllegalArgumentException("Tesing Error!");
		
	}
}
