package com.test.SYJ_Mall.detail;

import java.util.List;

public interface IDetailDAO {

	List<DetailDTO> lisDetailSelectt();

	List<String> HeaderSelect(Integer d_seq);

}
