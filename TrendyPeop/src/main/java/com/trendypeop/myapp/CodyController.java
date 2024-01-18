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
	
}
