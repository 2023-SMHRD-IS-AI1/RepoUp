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
	public String goLikeStyle(@RequestParam("user_id") String user_id, Model model) {
		
		List<Style> likeStyleList = styleMapper.likeStyleList(user_id);
		model.addAttribute("likeStyleList", likeStyleList);
		
		return "likeStyle";
	}
	
	@RequestMapping("/insertStyleHeart")
	public String insertHeart(@RequestParam("style_idx") int style_idx, @RequestParam("user_id") String user_id) {
		

		Style style = new Style(style_idx, user_id);

		int count = styleMapper.checkStyleHeart(style);
		System.out.println(count);
		
		if(count == 0) {
			styleMapper.insertStyleHeart(style);
		} else {
			styleMapper.deleteStyleHeart(style);
		}
		
		
		
		
				// 여기까지는 db에 좋아요 넣고 빼는 코드
		
				// 밑으로는 좋아요 태그 분석(item, color, tag)
				// top3_stItem, top3_stColor, top3_stTag
				// 이렇게 3개 리스트(좋아요 누를 때마다 갱신)
				
				
				
				List<Style> list = styleMapper.getTags(user_id);
				
				List<String> stItemList = new ArrayList<String>();
				List<String> stColorList = new ArrayList<String>();
				List<String> stTagList = new ArrayList<String>();
				
				for(int i = 0; i < list.size(); i++) {
					stItemList.add(list.get(i).getStyle_item());
					stColorList.add(list.get(i).getStyle_color());
					stTagList.add(list.get(i).getStyle_tag());
				} // 만약 3가지 컬럼 따로 가져와서 조합할 거라면 리스트 3개 만들고 컬럼 하나씩 가져와야 함!
				

				
				Set<String> stItemDistinct = new HashSet<>(stItemList);
				Set<String> stColorDistinct = new HashSet<>(stColorList);
				Set<String> stTagDistinct = new HashSet<>(stTagList);
		        
		        Map<String, Integer> map1 = new HashMap<>(); // item
		        Map<String, Integer> map2 = new HashMap<>(); // color
		        Map<String, Integer> map3 = new HashMap<>(); // tag
		        
		        for (String item: stItemDistinct) {
		            map1.put(item, Collections.frequency(stItemList, item)); // map에 K:V 형태로 넣기
		        }
		        
		        for (String color: stColorDistinct) {
		            map2.put(color, Collections.frequency(stColorList, color)); // map에 K:V 형태로 넣기
		        }
		        
		        for (String tag: stTagDistinct) {
		            map3.put(tag, Collections.frequency(stTagList, tag)); // map에 K:V 형태로 넣기
		        }
		        
		        List<Map.Entry<String, Integer>> entryList1 = new LinkedList<>(map1.entrySet());
		        List<Map.Entry<String, Integer>> entryList2 = new LinkedList<>(map2.entrySet());
		        List<Map.Entry<String, Integer>> entryList3 = new LinkedList<>(map3.entrySet());
		        
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
		        });
		        
		        entryList3.sort(new Comparator<Map.Entry<String, Integer>>() {
		        	@Override
		        	public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
		        		return o2.getValue() - o1.getValue();
		        	}
		        }); // 내림차순으로 정렬
		        
		        List<String> tagList1 = new ArrayList<String>();
		        List<String> tagList2 = new ArrayList<String>();
		        List<String> tagList3 = new ArrayList<String>();
		        
		        for(Map.Entry<String, Integer> entry : entryList1){
		            tagList1.add(entry.getKey());
		        }
		        
		        for(Map.Entry<String, Integer> entry : entryList2){
		        	tagList2.add(entry.getKey());
		        }
		        
		        for(Map.Entry<String, Integer> entry : entryList3){
		        	tagList3.add(entry.getKey());
		        } // 내림차순으로 entryList 안에 들어가 있는 상태에서 key 값(태그 값)만 list에 따로 담기
		        
		        List<String> top3_stItem = new ArrayList<String>();
		        List<String> top3_stColor = new ArrayList<String>();
		        List<String> top3_stTag = new ArrayList<String>();
		        

		        if(tagList1.size() < 3) {
		        	for(int i = 0; i < tagList1.size(); i++) {
		        		top3_stItem.add(tagList1.get(i));
		        	}
		        } else {
		        	for(int i = 0; i < 3; i++) {
		        		top3_stItem.add(tagList1.get(i));
		        	}
		        }
		        
		        if(tagList2.size() < 3) {
		        	for(int i = 0; i < tagList2.size(); i++) {
		        		top3_stColor.add(tagList2.get(i));
		        	}
		        } else {
		        	for(int i = 0; i < 3; i++) {
		        		top3_stColor.add(tagList2.get(i));
		        	}
		        }
		        
		        if(tagList3.size() < 3) {
		        	for(int i = 0; i < tagList3.size(); i++) {
		        		top3_stTag.add(tagList3.get(i));
		        	}
		        } else {
		        	for(int i = 0; i < 3; i++) {
		        		top3_stTag.add(tagList3.get(i));
		        	}
		        }
		        
		        
		        for(int j = 0; j < top3_stItem.size(); j++) {
		        	System.out.println(top3_stItem.get(j));
		        }
		        
		        System.out.println("=======================");
				
		        for(int j = 0; j < top3_stColor.size(); j++) {
		        	System.out.println(top3_stColor.get(j));
		        }
		        
		        System.out.println("=======================");
		        
		        for(int j = 0; j < top3_stTag.size(); j++) {
		        	System.out.println(top3_stTag.get(j));
		        }
		        
		        System.out.println("=======================");
		
		
		
		
		return "redirect:/goStyleMain";
	}
	
	@RequestMapping("/insertCloset")
	public String insertCloset(@RequestParam("style_idx") int style_idx, @RequestParam("user_id") String user_id) {
		
		Style style = new Style(style_idx, user_id);
		
		int count = styleMapper.checkCloset(style);
		System.out.println(count);
		
		if(count == 0) {
			styleMapper.insertCloset(style);
		} else {
			styleMapper.deleteCloset(style);
		}
		
		
		return "redirect:/goStyleMain";
	}
	
	@RequestMapping("/deleteStyleHeart")
	public String deleteHeart(@RequestParam("style_idx") int style_idx, @RequestParam("user_id") String user_id, Model model) {
		
		Style style = new Style(style_idx, user_id);
		
		int count = styleMapper.checkStyleHeart(style);
		
		if(count == 0) {
			styleMapper.insertStyleHeart(style);
		} else {
			styleMapper.deleteStyleHeart(style);
		}
		
		List<Style> likeStyleList = styleMapper.likeStyleList(user_id);
		model.addAttribute("likeStyleList", likeStyleList);
		
		return "likeStyle";
	}
	
}
