package com.test.SYJ_Mall.main;

import java.util.HashMap;
import java.util.List;


public interface MainService {


	List<MainDTO> list(HashMap<String, Integer> map);

	List<String> img(int seq);

	Integer heart(int num);

	Integer heart_select(HashMap<String, Integer> map);

	void heart_update(HashMap<String, String> map);

}
