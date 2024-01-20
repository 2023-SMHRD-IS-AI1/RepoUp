package com.trendypeop.myapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
	public String goLikeCody(@RequestParam("user_id") String user_id, Model model) {
		
		List<Cody> likeCodyList = codyMapper.likeCodyList(user_id);
		model.addAttribute("likeCodyList", likeCodyList);
		System.out.println(likeCodyList.toString());
		
		
		return "likeCody";
	}
	
	@RequestMapping("/goRecoCody")
	public String goRecoCody() {
		
		return "recommendCody";
	}
	
	@RequestMapping("/insertCodyHeart")
	public String insertCodyHeart(@RequestParam("cody_idx") int cody_idx, @RequestParam("user_id") String user_id) {
		
		Cody cody = new Cody(cody_idx, user_id);
		
		int count = codyMapper.checkCodyHeart(cody);
		System.out.println(count);
		
		if(count == 0) {
			codyMapper.insertCodyHeart(cody);
		} else {
			codyMapper.deleteCodyHeart(cody);
		}
		
		
		
				// 여기까지는 코디 좋아요 & 취소 코드
		
				// 밑으로는 코디 좋아요 태그 분석 코드
				// "nan"도 태그로 인식 -> 추천 시 주의!!!
				
				
				
				List<Cody> list = codyMapper.getTags(user_id);
				
				List<String> cdLookList = new ArrayList<String>();
				List<String> cdTagList = new ArrayList<String>();
				
				for(int i = 0; i < list.size(); i++) {
					cdLookList.add(list.get(i).getCody_look());
					cdTagList.add(list.get(i).getCody_style_tag());
				} // 만약 3가지 컬럼 따로 가져와서 조합할 거라면 리스트 3개 만들고 컬럼 하나씩 가져와야 함!
				

				Set<String> cdLookDistinct = new HashSet<>(cdLookList);
				Set<String> cdTagDistinct = new HashSet<>(cdTagList);
		        
		        Map<String, Integer> map1 = new HashMap<>(); // look
		        Map<String, Integer> map2 = new HashMap<>(); // tag
		        
		        for (String item: cdLookDistinct) {
		            map1.put(item, Collections.frequency(cdLookList, item)); // map에 K:V 형태로 넣기
		        }
		        
		        for (String color: cdTagDistinct) {
		            map2.put(color, Collections.frequency(cdTagList, color)); // map에 K:V 형태로 넣기
		        }
		        
		        
		        List<Map.Entry<String, Integer>> entryList1 = new LinkedList<>(map1.entrySet());
		        List<Map.Entry<String, Integer>> entryList2 = new LinkedList<>(map2.entrySet());
		        
		        entryList1.sort(new Comparator<Map.Entry<String, Integer>>() {
		            @Override
		            public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
		        	return o2.getValue() - o1.getValue();
		            }
		        });
		        
		        entryList2.sort(new Comparator<Map.Entry<String, Integer>>() {
		        	@Override
		        	public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
		        		return o2.getValue() - o1.getValue();
		        	}
		        }); // 내림차순으로 정렬
		        
		        List<String> tagList1 = new ArrayList<String>();
		        List<String> tagList2 = new ArrayList<String>();
		        
		        for(Map.Entry<String, Integer> entry : entryList1){
		            tagList1.add(entry.getKey());
		        }
		        
		        for(Map.Entry<String, Integer> entry : entryList2){
		        	tagList2.add(entry.getKey());
		        } // 내림차순으로 entryList 안에 들어가 있는 상태에서 key 값(태그 값)만 list에 따로 담기
		        
		        List<String> top3_cdLook = new ArrayList<String>();
		        List<String> top3_cdTag = new ArrayList<String>();
		        

		        if(tagList1.size() < 3) {
		        	for(int i = 0; i < tagList1.size(); i++) {
		        		top3_cdLook.add(tagList1.get(i));
		        	}
		        } else {
		        	for(int i = 0; i < 3; i++) {
		        		top3_cdLook.add(tagList1.get(i));
		        	}
		        }
		        
		        if(tagList2.size() < 3) {
		        	for(int i = 0; i < tagList2.size(); i++) {
		        		top3_cdTag.add(tagList2.get(i));
		        	}
		        } else {
		        	for(int i = 0; i < 3; i++) {
		        		top3_cdTag.add(tagList2.get(i));
		        	}
		        }
		        
		        
		        for(int j = 0; j < top3_cdLook.size(); j++) {
		        	System.out.println(top3_cdLook.get(j));
		        }
		        
		        System.out.println("=======================");
				
		        for(int j = 0; j < top3_cdTag.size(); j++) {
		        	System.out.println(top3_cdTag.get(j));
		        }
		        
		        System.out.println("=======================");
		
		
		
		
		
		
		return "redirect:/goCodyMain";
	}
	
	@RequestMapping("/deleteCodyHeart")
	public String deleteCodyHeart(@RequestParam("cody_idx") int cody_idx, @RequestParam("user_id") String user_id, Model model) {
		
		Cody cody = new Cody(cody_idx, user_id);

		int count = codyMapper.checkCodyHeart(cody);
		System.out.println(count);
		
		if(count == 0) {
			codyMapper.insertCodyHeart(cody);
		} else {
			codyMapper.deleteCodyHeart(cody);
		}
		
		List<Cody> likeCodyList = codyMapper.likeCodyList(user_id);
		model.addAttribute("likeCodyList", likeCodyList);
		
		return "likeCody";
	}
	
}
