package com.test.SYJ_Mall.detail;

import java.util.HashMap;
import java.util.List;

public interface IDetailDAO {

	List<DetailDTO> lisDetailSelectt(Integer d_seq);

	List<String> HeaderSelect(Integer d_seq);

	List<FeedDTO> FeedSelect(Integer d_seq);

	List<FeedDTO> FeedSelect2(Integer d_seq);

	Integer heart_select(HashMap<String, Integer> map);

}
