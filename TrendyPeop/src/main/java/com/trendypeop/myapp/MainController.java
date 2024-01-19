package com.trendypeop.myapp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/goMain")
	public String goMain() {
		
		return "redirect:/";
	}
	
	@PostMapping("/userSelect")
	public String userSelect(User user, HttpSession session) {

		User loginUser = userMapper.userSelect(user);
		session.setAttribute("loginUser", loginUser);
		System.out.println(loginUser.toString());
		return "Main";
	}
	
	@RequestMapping("/logoutUser")
	public String logoutUser(HttpSession session) {
		session.invalidate();
		return "Main";
	}
	
	
	
	@RequestMapping("/signUp")
	public String signUp() {
		
		return "signUp";
	}
	
	@RequestMapping("/signIn")
	public String signIn() {
		
		return "signIn";
	}
	
	
	@RequestMapping("/goUpdateUser")
	public String goUpdateUser() {
		
		return "updateUser";
	}
	
	
	
	@RequestMapping("/updateSuccess")
	public String updateSuccess(User user, HttpSession session) {
		System.out.println(user.toString());
		
		int cnt = userMapper.updateUser(user);

		if (cnt > 0) {
			user = userMapper.userSelect(user);
			session.setAttribute("loginUser", user);
			
			return "updateSuccess";
		} else {
			System.out.println("실패");
			return "goMain";
		}
	}

	
	
	@RequestMapping("/signUpSuccess")
	public String signUpSuccess(User user, Model model) {
		
		System.out.println(user.toString());
		int cnt = userMapper.signUpSuccess(user);
		
		if (cnt > 0) {
			System.out.println("데이터 입력 성공");
			model.addAttribute("user_id", user.getUser_id());
			return "signUpSuccess";
			
		} else {
			System.out.println("회원가입 실패");
			return "signUpFail";
		}
		
	}
	
	@RequestMapping("/ConfirmId")
	@ResponseBody
	public void confirmId(String user_id, HttpServletResponse response) {

		
		boolean result = true;		
		if(user_id.trim().isEmpty()) {
			result = false;
		} else {
			if (userMapper.selectId(user_id)) {
				result = false;
			} else {
				result = true;
			}
		}
		
		try {
			PrintWriter out = response.getWriter();
			out.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping("/goMyCloset")
	public String goMyCloset() {
		return "myCloset";
	}
	
	
	
	
	
}
