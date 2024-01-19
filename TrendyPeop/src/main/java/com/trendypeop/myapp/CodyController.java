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

import com.trendypeop.myapp.entity.Cody;
import com.trendypeop.myapp.entity.Style;
import com.trendypeop.myapp.entity.User;
import com.trendypeop.myapp.mapper.CodyMapper;
import com.trendypeop.myapp.mapper.StyleMapper;
import com.trendypeop.myapp.mapper.UserMapper;

@Controller
public class CodyController {
	
	@Autowired
	private CodyMapper codyMapper;
	
	
	@RequestMapping("/goCodyMain")
	public String goCodyMain(Model model) {
		
		List<Cody> codyList = codyMapper.codyList();
		model.addAttribute("codyList", codyList);
		
		return "codyMain";
	}
	
	@RequestMapping("/goCodyDetail")
	public String goCodyDetail(@RequestParam("cody_idx") int cody_idx, Model model) {
		
		System.out.println(cody_idx);
		List<Cody> itemList = codyMapper.codyDetail(cody_idx);
		model.addAttribute("itemList", itemList);
		System.out.println(itemList);
		
		return "codyDetail";
	}
	
	@RequestMapping("/goLikeCody")
	public String goLikeCody() {
		
		return "likeCody";
	}
	
	@RequestMapping("/goRecoCody")
	public String goRecoCody() {
		
		return "recommendCody";
	}
	
	@RequestMapping("/insertCodyHeart")
	public String insertCodyHeart(@RequestParam("cody_idx") int cody_idx, @RequestParam("user_id") String user_id) {
		
		/* System.out.println("성공");
		System.out.println(idx);
		System.out.println(email);
		System.out.println("성공2"); */
		Cody cody = new Cody(cody_idx, user_id);
		/* System.out.println(board.getIdx());
		System.out.println(board.getEmail()); */
		
		int count = codyMapper.checkCodyHeart(cody);
		System.out.println(count);
		
		if(count == 0) {
			codyMapper.insertCodyHeart(cody);
		} else {
			codyMapper.deleteCodyHeart(cody);
		}
		return "redirect:/goCodyMain";
	}
}
