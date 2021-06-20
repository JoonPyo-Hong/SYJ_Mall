package com.test.SYJ_Mall.board;

import java.util.List;

public interface IBoardService {
	public int countBoard();	
	public List<BoardDTO> noticelist(PagingDTO dto);
	public List<BoardDTO> listbtn(BoardDTO dto);
}
