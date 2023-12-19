package cs.dit.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cs.dit.domain.BoardVO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TestBoardMapper {
	
	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void boardMapperTests() {
		log.info("mapper getList test----------------------");
		
		List<BoardVO> list = mapper.mapleGetList();
		for(BoardVO board : list) {
			log.info(board);
		}
	}
	
	@Test
	public void testInsert() {
		log.info("test insert----------------------");
		
		 BoardVO board = new BoardVO();
		 board.setTitle("혹성탈출");
		 board.setContent("임승진 탈출편");
		 board.setWriter("사육사김신영");
		 
		 mapper.insert(board);
	}
	
	@Test
	public void testDelete() {
		BoardVO board = new BoardVO();
		log.info("test/delete-------------------");
		log.info("delete" + mapper.delete(4));
	}
	
	@Test
	public void testRead() {
		log.info("get...............");
		
		BoardVO board = mapper.get(1);
		log.info(board);
	}
	
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setBno(1L);
		board.setTitle("수정 제목");
		board.setContent("수정 내용");
		board.setWriter("작성자 수정");
		log.info("test-update ----------------");
		int count = mapper.modify(board);
		log.info("update count" + count);
	}
}
