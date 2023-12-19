package cs.dit.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cs.dit.domain.CommentVO;
import cs.dit.mapper.CommentMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@RequiredArgsConstructor
public class CommentServiceImpl implements CommentService {
	
	private final CommentMapper mapper;

	@Override
	public List<CommentVO> getList(Long bno) {
		
		return mapper.getList(bno);
	}

	@Override
	public int insert(CommentVO comment) {
		return mapper.insert(comment);
	}

	@Override
	public int modify(CommentVO comment) {
		// TODO Auto-generated method stub
		return mapper.modify(comment);
	}

	@Override
	public CommentVO get(Long cno) {
		
		return mapper.get(cno);
	}

	@Override
	public int delete(Long cno) {
		// TODO Auto-generated method stub
		return mapper.delete(cno);
	}
	
}
