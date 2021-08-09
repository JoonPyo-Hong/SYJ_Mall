package com.test.SYJ_Mall.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MainService {

	List<MainDTO> list(HashMap<String, Integer> map);

	List<String> img(int seq);

	Integer heart(int num);

	Integer heart_select(HashMap<String, Integer> map);

	void heart_update(HashMap<String, String> map);

	void feed_insert(Map<String, Object> map);

	List<FeedDTO> feed_select(Map<String, Object> map);

	Integer feed_heart(int feed_seq);

	void feed_heart_update(HashMap<String, String> map);

	void re_feed_insert(Map<String, Object> map);

	Object re_feed_select(String feed_seq);

	void re_feed_heart_update(HashMap<String, String> map);

	Integer re_feed_heart(int feed_seq);

	HashMap<String, Object> main_feed(Integer seq);

	Object main_feed_count(Integer seq);

}
