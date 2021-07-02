package com.test.SYJ_Mall.main;

import java.util.List;

public interface MainDAO {

	List<MainDTO> list(int num);

	List<String> img(int seq);

	Integer heart(int num);

}
