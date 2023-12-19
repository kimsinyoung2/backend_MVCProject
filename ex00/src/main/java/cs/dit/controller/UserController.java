package cs.dit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cs.dit.domain.UserVO;
import cs.dit.mapper.UserMapper;
import cs.dit.service.BoardService;
import cs.dit.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user/*")
@Log4j
// @RequiredArgsConstructor
public class UserController {
	
	private final UserMapper mapper;
	private final UserService UserService;	
	
	@Autowired
	public UserController(UserMapper mapper, UserService UserService) {
		this.mapper = mapper;
		this.UserService = UserService;
		
	}
	
	@GetMapping("login")
	public String loginView() {
		return "/board/login";
	}
	
	@GetMapping("first")
	public String firstView() {
		return "/board/first";
	}
	
	@GetMapping("writing")
	public String writing() {
		return "/board/writing";
	}
	
	@PostMapping("/login")
	public String getLoginData(String user_email, String user_pwd, HttpSession session, Model model) {
	    UserVO loginUser = new UserVO();
	    loginUser.setUser_email(user_email);
	    loginUser.setUser_pwd(user_pwd);
	    UserVO user = mapper.userCheck(loginUser); // 비교

	    if (user == null) {
	        session.setAttribute("loginFailed", true);
	        return "redirect:/user/login";
	    } else {
	        session.setAttribute("userData", user);
	        log.info(user);
	        return "redirect:/board/mapleTable";
	    }
	}
			
	
	
	@PostMapping("register")
	public String register(UserVO user, Model model) {
		UserVO registerCheck = mapper.registerCheck(user); //db에 같은 이메일이 있을경우
			
			if(registerCheck != null) {
				model.addAttribute("registerFailed", true);
				return "board/login";
			}else {
				UserService.register(user);
				return "/board/login";
			}
	}
	
	
}
