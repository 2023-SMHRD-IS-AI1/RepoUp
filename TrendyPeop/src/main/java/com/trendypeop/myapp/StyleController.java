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
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("/goRecoStyle")
	public String goRecoStyle() {
		return "recommendStyle";
	}
	
	@RequestMapping("/goLikeStyle")
	public String goLikeStyle() {
		return "likeStyle";
	}
	
	@RequestMapping("/insertStyleHeart")
	public String insertHeart(@RequestParam("style_idx") int style_idx, @RequestParam("user_id") String user_id) {
		
		/* System.out.println("성공");
		System.out.println(idx);
		System.out.println(email);
		System.out.println("성공2"); */
		Style style = new Style(style_idx, user_id);
		/* System.out.println(board.getIdx());
		System.out.println(board.getEmail()); */
		
		int count = styleMapper.checkStyleHeart(style);
		System.out.println(count);
		
		if(count == 0) {
			styleMapper.insertStyleHeart(style);
		} else {
			styleMapper.deleteStyleHeart(style);
		}
		return "redirect:/goStyleMain";
	}
	
	@RequestMapping("/insertCloset")
	public String insertCloset(@RequestParam("style_idx") int style_idx, @RequestParam("user_id") String user_id) {
		
		/* System.out.println("성공");
		System.out.println(idx);
		System.out.println(email);
		System.out.println("성공2"); */
		Style style = new Style(style_idx, user_id);
		/* System.out.println(board.getIdx());
		System.out.println(board.getEmail()); */
		
		int count = styleMapper.checkCloset(style);
		System.out.println(count);
		
		if(count == 0) {
			styleMapper.insertCloset(style);
		} else {
			styleMapper.deleteCloset(style);
		}
		
		
		return "redirect:/goStyleMain";
	}
	
}
