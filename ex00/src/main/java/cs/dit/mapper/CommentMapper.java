package cs.dit.mapper;

import java.util.List;

import cs.dit.domain.BoardVO;
import cs.dit.domain.CommentVO;

public interface CommentMapper {
	List<CommentVO> getList(long bno);
	
	int insert(CommentVO comment);
	
	int modify(CommentVO comment);
	
	CommentVO get(long cno);
	
	int delete(long cno);
}
