package cs.dit.mapper;

import java.util.List;

import cs.dit.domain.BoardVO;

public interface BoardMapper {
	
	//접근제어자, 리턴타입, 파라메터
	 List<BoardVO> mapleGetList();
	 
	 List<BoardVO> lostGetList();
	 
	 List<BoardVO> lolGetList();
	
	 int insert(BoardVO board);
	
	 int delete(long bno);
	
	 BoardVO get(long bno);
	 
	 int count(Long bno);
	
	 int modify(BoardVO board);
}
