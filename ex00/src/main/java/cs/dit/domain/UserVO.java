package cs.dit.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class UserVO {
	
	private Long user_id;
	private String user_name;
	private String user_pwd;
	private String user_email;
	
}
