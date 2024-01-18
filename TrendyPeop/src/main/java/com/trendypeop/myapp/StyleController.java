package com.trendypeop.myapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trendypeop.myapp.entity.Style;
import com.trendypeop.myapp.entity.User;
import com.trendypeop.myapp.mapper.StyleMapper;
import com.trendypeop.myapp.mapper.UserMapper;

@Controller
public class StyleController {
	
	@Autowired
	private StyleMapper styleMapper;
	
	
	@RequestMapping("/goStyleMain")
	public String goStyleMain(Model model) {
		
		List<Style> styleList = styleMapper.styleList();
		model.addAttribute("styleList", styleList);
		
		return "styleMain";
	}
	
}
