package com.test.SYJ_Mall.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MainDAO {

	List<MainDTO> list(HashMap<String, Integer> map);

	List<String> img(int seq);

	Integer heart(int num);

	Integer heart_select(HashMap<String, Integer> map);

	void heart_update(HashMap<String, String> map);

	void feed_insert(Map<String, Object> map);

	List<FeedDTO> feed_select(Map <String, Object> map);

	Integer feed_heart(int feed_seq);

	void feed_heart_update(HashMap<String, String> map);

	void re_feed_insert(Map<String, Object> map);

	Object re_feed_select(String feed_seq);

	void re_feed_heart_update(HashMap<String, String> map);

	Integer re_feed_heart(int feed_seq);

	HashMap<String, Object> main_feed(Integer seq);

	Object main_feed_count(Integer seq);

	void feed_edit(Map<String, Object> map);

	void feed_delete(Integer feed_seq);

	void re_feed_delete(Integer seq);

	void re_feed_update(Map<String, Object> map);

	List<NewMainDTO> new_list(HashMap<String, Integer> map);

	List<String> new_main_img(int seq);

	List<Integer> new_main_sub(int seq);

	List<SubDTO> new_main_sub_img(int seq);

	List<Integer> new_main_list(int seq);

	List<String> char_img(String name);

	Integer new_heart_select(HashMap<String, Integer> map);

	void new_heart_update(HashMap<String, String> map);

	Integer heart_count(int num);



}
