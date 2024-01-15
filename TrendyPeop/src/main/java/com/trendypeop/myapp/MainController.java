package com.trendypeop.myapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.trendypeop.myapp.entity.User;
import com.trendypeop.myapp.mapper.UserMapper;

@Controller
public class MainController {
	
	@Autowired
	private UserMapper userMapper;
	
	
	@RequestMapping("/")
	public String main() {
		return "Main";
	}
	
	
	@RequestMapping("/join")
	public String join() {
		
		return "join";
	}

	
	@RequestMapping("/joinUser")
	public String joinUser(User user, Model model) {
		
		System.out.println(user.toString());
		int cnt = userMapper.joinUser(user);
		
		if (cnt > 0) {
			System.out.println("데이터 입력 성공");
		}
		
		model.addAttribute("user_id", user.getUser_id());
		
		return "joinSuccess";
	}
	
	
	
	
	
	
}
