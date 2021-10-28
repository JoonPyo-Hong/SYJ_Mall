package com.test.SYJ_Mall.info;

import java.util.List;

public interface InfoDAO {

	List<InfoDTO> InfoSelect();

	List<InfoDTO> InfoSelect_en();

	List<InfoDTO> InfoSelect_jp();

	List<InfoDTO> InfoSelect_cn();

	List<InfoDTO> InfoSelect_cn2();

}
