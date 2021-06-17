package com.test.SYJ_Mall.board;

import java.util.List;

public interface IBoardDAO {
	public List<BoardDTO> noticelist(BoardDTO dto);
	public List<BoardDTO> listbtn(BoardDTO dto);
}
