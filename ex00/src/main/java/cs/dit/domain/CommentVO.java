package cs.dit.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentVO {
	private Long cno;
	private Long bno;
	private String writer;
	private String content;
	private Date regdate;
	private String time;
}
