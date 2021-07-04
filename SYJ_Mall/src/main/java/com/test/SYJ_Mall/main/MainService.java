package com.test.SYJ_Mall.main;

import java.util.HashMap;
import java.util.List;


public interface MainService {


	List<MainDTO> list(int num);

	List<String> img(int seq);

	Integer heart(int num);

	Integer heart_select(HashMap<String, Integer> map);

}
