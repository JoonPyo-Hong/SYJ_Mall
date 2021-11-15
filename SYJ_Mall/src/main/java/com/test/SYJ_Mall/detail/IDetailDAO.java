package com.test.SYJ_Mall.detail;

import java.util.List;

public interface IDetailDAO {

	List<DetailDTO> lisDetailSelectt(Integer d_seq);

	List<String> HeaderSelect(Integer d_seq);

}
