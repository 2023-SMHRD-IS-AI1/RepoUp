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

	
	@RequestMapping("/filterCodyLook")
	public String filterCodyLook(@RequestParam("cody_look") String cody_look, Model model) {

		List<Cody> codyLookFilterList = codyMapper.filterCodyLook(cody_look);
		model.addAttribute("codyLookFilterList", codyLookFilterList);

		return "codyLookFilter";
	}

	@RequestMapping("/filterCodyStyleTag")
	public String filterCodyStyleTag(@RequestParam("cody_style_tag") String cody_style_tag, Model model) {

		List<Cody> codyStyleTagFilterList = codyMapper.filterCodyStyleTag(cody_style_tag);
		model.addAttribute("codyStyleTagFilterList", codyStyleTagFilterList);

		return "codyStyleTagFilter";
	}

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

	@RequestMapping("/insertCodyHeart")
	@ResponseBody
	public Map<String, Object> insertCodyHeart(@RequestParam("cody_idx") int cody_idx, @RequestParam("user_id") String user_id) {
		
		System.out.println("test1");
		System.out.println(cody_idx);		
		System.out.println(user_id);
		System.out.println("test2");
		
		Map<String, Object> response = new HashMap<>(); 
		Cody cody = new Cody(cody_idx, user_id);
		
		int count = codyMapper.checkCodyHeart(cody);
		
		if(count == 0) {
			codyMapper.insertCodyHeart(cody);
	        response.put("success", true);
		} else {
			codyMapper.deleteCodyHeart(cody);
			response.put("success", false);
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
		        
		        map1.remove("nan");
		        map2.remove("nan");
		        
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
		        
		        String top1_cdLook;
		        String top2_cdLook;
		        String top3_cdLook;
		        
		        String top1_cdTag;
		        String top2_cdTag;
		        String top3_cdTag;
		        

		        if(tagList1.size() == 0) {
		        	top1_cdLook = "n";
			        top2_cdLook = "n";
			        top3_cdLook = "n";
		        } else if(tagList1.size() == 1) {
		        	top1_cdLook = tagList1.get(0);
		        	top2_cdLook = "n";
				    top3_cdLook = "n";
		        } else if(tagList1.size() == 2) {
		        	top1_cdLook = tagList1.get(0);
		        	top2_cdLook = tagList1.get(1);
		        	top3_cdLook = "n";
		        } else {
		        	top1_cdLook = tagList1.get(0);
		        	top2_cdLook = tagList1.get(1);
		        	top3_cdLook = tagList1.get(2);
		        }
		        
		        if(tagList2.size() == 0) {
		        	top1_cdTag = "n";
		        	top2_cdTag = "n";
		        	top3_cdTag = "n";
		        } else if(tagList2.size() == 1){
		        	top1_cdTag = tagList2.get(0);
		        	top2_cdTag = "n";
		        	top3_cdTag = "n";
		        }else if(tagList2.size() == 2){
		        	top1_cdTag = tagList2.get(0);
		        	top2_cdTag = tagList2.get(1);
		        	top3_cdTag = "n";
		        	
		        }else{
		        	top1_cdTag = tagList2.get(0);
		        	top2_cdTag = tagList2.get(1);
		        	top3_cdTag = tagList2.get(2);
		        }
		        
		        
		        
		        System.out.println(top1_cdLook);
		        System.out.println(top2_cdLook);
		        System.out.println(top3_cdLook);
		        
		        System.out.println("=======================");
		        
		        System.out.println(top1_cdTag);
		        System.out.println(top2_cdTag);
		        System.out.println(top3_cdTag);

		        System.out.println("=======================");
		        

		        codyMapper.deleteCodyReco(user_id);
		        Cody cody1 = new Cody(user_id, top1_cdLook, top1_cdTag);
		        codyMapper.insertCodyReco(cody1);
		        Cody cody2 = new Cody(user_id, top2_cdLook, top2_cdTag);
		        codyMapper.insertCodyReco(cody2);
		        Cody cody3 = new Cody(user_id, top3_cdLook, top3_cdTag);
		        codyMapper.insertCodyReco(cody3);


		
		return response;
	}

	@RequestMapping("/deleteCodyHeart")
	public String deleteCodyHeart(@RequestParam("cody_idx") int cody_idx, @RequestParam("user_id") String user_id,
			Model model) {

		Cody cody = new Cody(cody_idx, user_id);

		int count = codyMapper.checkCodyHeart(cody);
		System.out.println(count);

		if (count == 0) {
			codyMapper.insertCodyHeart(cody);
		} else {
			codyMapper.deleteCodyHeart(cody);
		}

		List<Cody> likeCodyList = codyMapper.likeCodyList(user_id);
		model.addAttribute("likeCodyList", likeCodyList);

		return "likeCody";
	}

	@RequestMapping("/goRecoCody")
	public String goRecoCody(@RequestParam("user_id") String user_id, @RequestParam("cody_season") String cody_season,
			Model model) {

		Cody cody = new Cody(cody_season, user_id);

		List<Cody> recoList = codyMapper.recoList(cody);
		model.addAttribute("recoList", recoList);
		System.out.println(recoList.toString());

		return "recommendCody";
	}

	@RequestMapping("/gostyleRecoDetail")
	public String gostyleRecoDetail(@RequestParam("style_idx") int style_idx, Model model) {

		System.out.println("test");

		List<Cody> detailRecoList1 = codyMapper.detailRecoList1(style_idx);
		model.addAttribute("detailRecoList1", detailRecoList1);

		List<Cody> detailRecoList2 = codyMapper.detailRecoList2(style_idx);
		model.addAttribute("detailRecoList2", detailRecoList2);

		List<Cody> detailRecoList3 = codyMapper.detailRecoList3(style_idx);
		model.addAttribute("detailRecoList3", detailRecoList3);

		List<Cody> detailRecoList4 = codyMapper.detailRecoList4(style_idx);
		model.addAttribute("detailRecoList4", detailRecoList4);

		System.out.println(detailRecoList4.toString());

		return "styleRecoDetail";
	}

}
