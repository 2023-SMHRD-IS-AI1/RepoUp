package com.trendypeop.myapp;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trendypeop.myapp.entity.Cody;
import com.trendypeop.myapp.entity.Keyword;
import com.trendypeop.myapp.entity.User;
import com.trendypeop.myapp.mapper.CodyMapper;
import com.trendypeop.myapp.mapper.GraphMapper;
import com.trendypeop.myapp.mapper.UserMapper;

@Controller
public class MainController {
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private CodyMapper codyMapper;
	
	@Autowired
	private GraphMapper graphMapper;
	
	
	@RequestMapping("/")	
	public String main(String collected_at, Model model) {
		
		List<Cody> bestCody = codyMapper.bestCody();
		model.addAttribute("bestCody", bestCody);
		

		Map<String, Double> ratioData = new HashMap<String, Double>();
		
//		String data1 = "패딩";
//		String data2 = "원피스";
//		String data3 = "코트";
//		String data4 = "티셔츠";
//		String data5 = "재킷";
//		String data6 = "트위트자켓";
//		String data7 = "여성코트";
//		String data8 = "숏패딩";
//		String data9 = "니트원피스";
//		String data10 = "톰보이코트";
		LocalDate now = LocalDate.now();
		String now_string = now.toString();
		System.out.println("2024-01-15");
		String date = "2024-01-15";
		//DataController dataController = new DataController();
		Keyword keywordList = graphMapper.keywordListing("2024-01-15");
		System.out.println(keywordList.getTop1());
		
	
        String clientId = "2wfu86SPC0J9dFdG2iJq"; // 애플리케이션 클라이언트 아이디
        String clientSecret = "Yv305cvfq_"; // 애플리케이션 클라이언트 시크릿

        String apiUrl = "https://openapi.naver.com/v1/datalab/search";

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        requestHeaders.put("Content-Type", "application/json");

//        String requestBody = String.format("{\"startDate\":\"2023-12-12\"," +
//                "\"endDate\":\"2023-12-12\"," + 
//                "\"timeUnit\":\"date\"," +
//                "\"keywordGroups\":[{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}," +
//                "{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}," +
//                "{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}," + 
//                "{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}," + 
//                "{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}]," +
//                "\"device\":\"pc\"," +
//                "\"ages\":[\"3\",\"4\",\"5\",\"6\"]," +
//                "\"gender\":\"f\"}", keywordList.getTop1(), keywordList.getTop1(), keywordList.getTop2(), keywordList.getTop2(), 
//                					keywordList.getTop3(), keywordList.getTop3(), keywordList.getTop4(), keywordList.getTop4(), 
//                					keywordList.getTop5(), keywordList.getTop5());
//        이쪽은 확인!!!!!!!!!!
        ArrayList<Double> rateList = new ArrayList<Double>();
        rateList.add(100.0);
        		
        String requestBody = makeQuery(keywordList.getTop1(), keywordList.getTop2(), keywordList.getTop3(), keywordList.getTop4(), date);
        String responseBody1 = post(apiUrl, requestHeaders, requestBody);
       
        rateList = makeMap(responseBody1, rateList);
        
        requestBody = makeQuery(keywordList.getTop1(), keywordList.getTop5(), keywordList.getTop6(), keywordList.getTop7(), date);
        String responseBody2 = post(apiUrl, requestHeaders, requestBody);
        
        rateList = makeMap(responseBody2, rateList);
        
        requestBody = makeQuery(keywordList.getTop1(), keywordList.getTop8(), keywordList.getTop9(), keywordList.getTop10(), date);
        String responseBody3 = post(apiUrl, requestHeaders, requestBody);
        
        rateList = makeMap(responseBody3, rateList);
        
        System.out.println(rateList);
        
        Collections.sort(rateList, Collections.reverseOrder());
        System.out.println(rateList);
        keywordList.setTop1_rate(rateList.get(0));
        keywordList.setTop2_rate(rateList.get(1));
        keywordList.setTop3_rate(rateList.get(2));
        keywordList.setTop4_rate(rateList.get(3));
        keywordList.setTop5_rate(rateList.get(4));
        keywordList.setTop6_rate(rateList.get(5));
        keywordList.setTop7_rate(rateList.get(6));
        keywordList.setTop8_rate(rateList.get(7));
        keywordList.setTop9_rate(rateList.get(8));
        keywordList.setTop10_rate(rateList.get(9));
        
//        JSONParser parser = new JSONParser();
//        try {
//			Object obj = parser.parse(responseBody);
//			JSONObject jsonObject = (JSONObject) obj;
//			
//			JSONArray resultsArray = (JSONArray) jsonObject.get("results");
//			System.out.println(resultsArray);
//			Map<String, Double> ratioData = new HashMap<String, Double>();
//			for (Object result : resultsArray) {
//	               JSONObject resultObject = (JSONObject) result;
//	               String title = (String) resultObject.get("title");
//
//	                // "data" 배열에 접근
//	               JSONArray dataArray = (JSONArray) resultObject.get("data");
//	                
//	                // 각 데이터에 대한 정보 출력a
//	               for (Object data : dataArray) {
//	                   JSONObject dataObject = (JSONObject) data;
//	                   Object ratio = dataObject.get("ratio");
//	                   if(ratio.getClass().getName().equals("java.lang.Long")) {
//	                	   ratio = Double.valueOf(dataObject.get("ratio").toString());
//	                   }
//  
//	                   System.out.println("비율: " + ratio);
//	                   ratioData.put(title, (Double) ratio);
//	               }         
//			}
//			System.out.println(ratioData.toString());
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
        System.out.println("test");
        model.addAttribute("keywordList", keywordList);
        System.out.println(keywordList.toString());
		
		
		
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
	
		if(loginUser != null) {
			return "redirect:/";
		}else {
			return "signInFail";
	}
	}
	
	@RequestMapping("/logoutUser")
	public String logoutUser(HttpSession session) {
		session.invalidate();
		return "redirect:/";
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

private static String makeQuery(String data1, String data2, String data3, String data4, String date) {
		
		return String.format("{\"startDate\":\"%s\"," +
                "\"endDate\":\"%s\"," + 
                "\"timeUnit\":\"date\"," +
                "\"keywordGroups\":[{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}," +
                "{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}," +
                "{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}," +             
                "{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}]," +
                "\"device\":\"pc\"," +
                "\"ages\":[\"3\",\"4\",\"5\",\"6\"]," +
                "\"gender\":\"f\"}", date, date, data1, data1, data2, data2, data3, data3, 
                						data4, data4);
	}
	
	private static ArrayList<Double> makeMap(String responseBody, ArrayList<Double> rateList) {
		JSONParser parser = new JSONParser();
        try {
			Object obj = parser.parse(responseBody);
			JSONObject jsonObject = (JSONObject) obj;
			
			JSONArray resultsArray = (JSONArray) jsonObject.get("results");
			
			 for (int i = 0; i < resultsArray.size(); i++) {
		            JSONObject resultObject = (JSONObject) resultsArray.get(i);
		            String title = (String) resultObject.get("title");

	                // "data" 배열에 접근
		            JSONArray dataArray = (JSONArray) resultObject.get("data");
	                
	                // 각 데이터에 대한 정보 출력a
		            if (i != 0) {
		                // 각 데이터에 대한 정보 출력
		                for (Object data : dataArray) {
		                    JSONObject dataObject = (JSONObject) data;
		                    Object ratio = dataObject.get("ratio");

		                    if (ratio instanceof Double) {
		                        // Number 타입인 경우 Double로 변환하여 리스트에 추가
		                    	rateList.add(((Number) ratio).doubleValue());
		                    }
		                }
		            }         
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
        
        
		return rateList;
        
        
	}
    private static String post(String apiUrl, Map<String, String> requestHeaders, String requestBody) {
        HttpURLConnection con = connect(apiUrl);

        try {
            con.setRequestMethod("POST");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            con.setDoOutput(true);
            try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
                wr.write(requestBody.getBytes());
                wr.flush();
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답
                return readBody(con.getInputStream());
            } else {  // 에러 응답
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect(); // Connection을 재활용할 필요가 없는 프로세스일 경우
        }
    }

    private static HttpURLConnection connect(String apiUrl) {
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection) url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body) {
        InputStreamReader streamReader = new InputStreamReader(body, StandardCharsets.UTF_8);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
	
	
	
}
