package cs.dit.service;

import java.util.List;

import cs.dit.domain.BoardVO;
import cs.dit.domain.CommentVO;

public interface CommentService {
	
	List<CommentVO> getList(Long bno);
	
	int insert(CommentVO comment);
	
	int modify(CommentVO comment);
	
	CommentVO get(Long cno);
	
	int delete(Long cno);
}
