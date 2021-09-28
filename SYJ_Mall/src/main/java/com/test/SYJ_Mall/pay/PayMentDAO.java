package com.test.SYJ_Mall.pay;

import java.util.List;

public interface PayMentDAO {

	List<ProductDTO> PaySelect(String str1);

	int last_seq();

}
