package com.test.SYJ_Mall.pay;

import java.util.List;
import java.util.Map;

public interface PayMentService {

	List<ProductDTO> PaySelect(String str1);

	int last_seq();

	void order(Map<String, Object> map);

	void shpping(Map<String, Object> map);

}
