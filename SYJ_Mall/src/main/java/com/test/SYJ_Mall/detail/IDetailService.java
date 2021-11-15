package com.test.SYJ_Mall.detail;

import java.util.List;

public interface IDetailService {

	List<DetailDTO> DetailSelect(Integer d_seq);

	List<String> HeaderSelect(Integer d_seq);

}
